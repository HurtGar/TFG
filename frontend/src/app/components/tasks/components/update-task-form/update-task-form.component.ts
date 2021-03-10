import { Component, Input, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { Block } from 'src/app/models/block.model';
import { Priority } from 'src/app/models/priority.model';
import { Project } from 'src/app/models/project.model';
import { Status } from 'src/app/models/status.model';
import { Task } from 'src/app/models/task.model';
import { BlockService } from 'src/app/services/block.service';
import { PriorityService } from 'src/app/services/priority.service';
import { ProjectsService } from 'src/app/services/projects.service';
import { StatusService } from 'src/app/services/status.service';
import { TaskService } from 'src/app/services/task.service';

@Component({
  selector: 'app-update-task-form',
  templateUrl: './update-task-form.component.html',
  styleUrls: ['./update-task-form.component.scss'],
})
export class UpdateTaskFormComponent implements OnInit {
  @Input() task: Task;
  projects: Project[] = [];
  blocks: Block[] = [];
  status: Status[] = [];
  priorities: Priority[] = [];
  data: FormGroup;
  error: any = { isError: false };

  constructor(
    private taskService: TaskService,
    private blockService: BlockService,
    private projectService: ProjectsService,
    private statusService: StatusService,
    private priorityService: PriorityService,
    private router: Router,
    private formBuilder: FormBuilder
  ) {
    this.createForm();
    this.loadProjects();
    this.loadStatus();
    this.loadPriorities();
  }

  ngOnInit(): void {
    this.loadTask(this.task);
  }

  get nombreTareaNoValido(): any {
    return (
      this.data.get('nombretarea').invalid &&
      this.data.get('nombretarea').touched
    );
  }

  get idProject(): any {
    return this.data.get('proyectos_idproyecto');
  }
  get idBlock(): any {
    return this.data.get('bloques_idbloque');
  }
  get idStatus(): any {
    return this.data.get('estados_idestado');
  }
  get idPriority(): any {
    return this.data.get('prioridades_idprioridad');
  }

  selectProject(e): any {
    console.log(e.target.value);

    this.idProject.setValue(e.target.value, {
      onlySelf: true,
    });
    this.loadBlocks();
  }
  selectBlock(e): any {
    console.log(e.target.value);

    this.idBlock.setValue(e.target.value, {
      onlySelf: true,
    });
  }
  selectStatus(e): any {
    console.log(e.target.value);

    this.idStatus.setValue(e.target.value, {
      onlySelf: true,
    });
  }
  selectPriority(e): any {
    console.log(e.target.value);

    this.idPriority.setValue(e.target.value, {
      onlySelf: true,
    });
  }

  loadProjects(): void {
    this.projectService.getAllProjectFromAnUser('1').subscribe((p) => {
      console.log(p);
      this.projects = p;
    });
  }

  loadBlocks(): void {
    this.projectService
      .getAllBlocksFromAProjectForTasks('1', this.idProject.value)
      .subscribe((b) => {
        this.blocks = b;
      });
  }
  loadStatus(): void {
    this.statusService.getAllStatus().subscribe((s) => {
      this.status = s;
    });
  }
  loadPriorities(): void {
    this.priorityService.getAllPriorities().subscribe((s) => {
      this.priorities = s;
    });
  }

  compareTwoDates(): void {
    if (
      new Date(this.data.controls.fechafin.value) <
      new Date(this.data.controls.fechainicio.value)
    ) {
      this.error = {
        isError: true,
      };
    }
  }

  createForm(): any {
    this.data = this.formBuilder.group({
      nombretarea: ['', Validators.required],
      desctarea: [''],
      fechacreacion: [this.setCreationTime(), [Validators.required]],
      fechainicio: [''],
      fechafin: [''],
      fechaactualizacion: [this.setCreationTime(), [Validators.required]],
      horasestimacion: [''],
      horasactuales: [''],
      horasrestantes: [''],
      estados_idestado: [''],
      prioridades_idprioridad: [''],
      bloques_idbloque: [''],
      proyectos_idproyecto: [''],
    });
  }
  loadTask(task: Task): any {
    this.data.setValue({
      nombretarea: task.nombretarea,
      desctarea: task.desctarea,
      fechacreacion: task.fechacreacion,
      fechainicio: task.fechainicio,
      fechafin: task.fechafin,
      fechaactualizacion: task.fechaactualizacion,
      horasestimacion: task.horasestimacion,
      horasactuales: task.horasactuales,
      horasrestantes: task.horasrestantes,
      prioridades_idprioridad: task.prioridades_idprioridad.idprioridad,
      estados_idestado: task.estados_idestado.idestado,
      bloques_idbloque: task.bloques_idbloque.idbloque,
      proyectos_idproyecto: task.proyectos_idproyecto.idproyecto,
    });
  }

  setCreationTime(): string {
    const date = new Date();
    const dateStr =
      date.getFullYear() +
      '-' +
      ('00' + (date.getMonth() + 1)).slice(-2) +
      '-' +
      ('00' + date.getDate()).slice(-2) +
      ' ' +
      ('00' + date.getHours()).slice(-2) +
      ':' +
      ('00' + date.getMinutes()).slice(-2) +
      ':' +
      ('00' + date.getSeconds()).slice(-2);
    return dateStr;
  }

  updateTask() {
    console.log(this.data);
    if (this.data.invalid) {
      return Object.values(this.data.controls).forEach((control) => {
        control.markAsTouched();
      });
    }

    const formObject = this.data.getRawValue();
    JSON.stringify(formObject);

    // Comprobar si la fecha de fin es anterior a la de inicio del proyecto.
    if (
      this.data.get('fechainicio').value != null &&
      this.data.get('fechafin').value != null
    ) {
      const datesOk = this.checkDates(
        this.data.get('fechainicio').value,
        this.data.get('fechafin').value
      );
      if (!datesOk) {
        throw Error();
      }
    }

    // Las fechas pueden venir vacías y si vienen, debemos borrar el campo del JSON para evitar problemas de inserción.
    // No se puede insertar en la BD un campo de tipo DateField como null o vacío.
    if (
      this.data.get('fechainicio').value === null ||
      this.data.get('fechainicio').value === ''
    ) {
      delete formObject.fechainicio;
    }
    if (
      this.data.get('fechafin').value === null ||
      this.data.get('fechafin').value === ''
    ) {
      delete formObject.fechafin;
    }

    if (
      this.data.get('horasactuales').value === null ||
      this.data.get('horasactuales').value === ''
    ) {
      delete formObject.horasactuales;
    }
    if (
      this.data.get('horasrestantes').value === null ||
      this.data.get('horasrestantes').value === ''
    ) {
      delete formObject.horasrestantes;
    }

    console.log(formObject);

    this.taskService.updateTask(formObject, this.task.idtarea).subscribe(
      (t: Task) => {
        console.log(t);
        window.location.reload();
      },
      (error: any) => console.log(error)
    );
  }

  private checkDates(dateA: string, dateB: string): boolean {
    let correct = true;

    const finalDateA = Date.parse(dateA);
    const finalDateB = Date.parse(dateB);

    if (finalDateB < finalDateA) {
      correct = false;
    }
    console.log(correct);
    return correct;
  }
}
