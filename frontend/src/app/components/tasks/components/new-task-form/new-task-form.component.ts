import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { Block } from 'src/app/models/block.model';
import { Priority } from 'src/app/models/priority.model';
import { Project } from 'src/app/models/project.model';
import { Status } from 'src/app/models/status.model';
import { Task } from 'src/app/models/task.model';
import { UserTask } from 'src/app/models/user-task.component';
import { User } from 'src/app/models/user.model';
import { BlockService } from 'src/app/services/block.service';
import { PriorityService } from 'src/app/services/priority.service';
import { ProjectsService } from 'src/app/services/projects.service';
import { RecordModificationService } from 'src/app/services/record-modification.service';
import { StatusService } from 'src/app/services/status.service';
import { TaskService } from 'src/app/services/task.service';
import { UserService } from 'src/app/services/user.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-new-task-form',
  templateUrl: './new-task-form.component.html',
  styleUrls: ['./new-task-form.component.scss'],
})
export class NewTaskFormComponent implements OnInit {
  projects: Project[] = [];
  blocks: Block[] = [];
  users: User[] = [];
  status: Status[] = [];
  priorities: Priority[] = [];
  data: FormGroup;
  dataUserTask: FormGroup;
  dataRecordTask: FormGroup;
  userTask: UserTask;
  lastTask: Task;
  error: any = { isError: false };
  userId: string;

  constructor(
    private taskService: TaskService,
    private blockService: BlockService,
    private projectService: ProjectsService,
    private userService: UserService,
    private statusService: StatusService,
    private priorityService: PriorityService,
    private recordModificationService: RecordModificationService,
    private router: Router,
    private formBuilder: FormBuilder
  ) {
    this.createUserTask();
    this.createForm();
    this.loadStatus();
    this.loadPriorities();
    this.loadUsers();
    this.taskService.lastInsertedTask().subscribe((lt) => {
      this.lastTask = lt;
    });
    this.createRecordTask();
  }

  ngOnInit(): void {
    this.userId = localStorage.getItem('userId');
    this.loadProjects();
  }

  get nombreTareaNoValido(): any {
    return (
      this.data.get('nombretarea').invalid &&
      this.data.get('nombretarea').touched
    );
  }
  get estimacionHorasNoValido(): any {
    return (
      this.data.get('horasestimacion').invalid &&
      this.data.get('horasestimacion').touched
    );
  }
  get prioridadNoValida(): any {
    return (
      this.data.get('prioridades_idprioridad').invalid &&
      this.data.get('prioridades_idprioridad').touched
    );
  }
  get estadoNoValido(): any {
    return (
      this.data.get('estados_idestado').invalid &&
      this.data.get('estados_idestado').touched
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
  get idTask(): any {
    return this.dataUserTask.get('tareas_idtarea');
  }
  get idUser(): any {
    return this.dataUserTask.get('usuarios_idusuario');
  }

  selectProject(e): any {
    this.idProject.setValue(e.target.value, {
      onlySelf: true,
    });
    this.loadBlocks();
  }
  selectBlock(e): any {
    this.idBlock.setValue(e.target.value, {
      onlySelf: true,
    });
  }
  selectStatus(e): any {
    this.idStatus.setValue(e.target.value, {
      onlySelf: true,
    });
  }
  selectPriority(e): any {
    this.idPriority.setValue(e.target.value, {
      onlySelf: true,
    });
  }
  selectUser(e): any {
    this.idUser.setValue(e.target.value, {
      onlySelf: true,
    });
  }

  loadProjects(): void {
    this.projectService.getAllProjectFromAnUser(this.userId).subscribe((p) => {
      this.projects = p;
    });
  }

  loadBlocks(): void {
    this.projectService
      .getAllBlocksFromAProjectForTasks(this.userId, this.idProject.value)
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
  loadUsers(): void {
    this.userService.getUsersFromApp().subscribe((s) => {
      this.users = s;
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
      horasestimacion: ['', Validators.required],
      horasactuales: [''],
      horasrestantes: [''],
      estados_idestado: [''],
      prioridades_idprioridad: [''],
      bloques_idbloque: [''],
      proyectos_idproyecto: [''],
    });
  }

  createUserTask(): any {
    this.dataUserTask = this.formBuilder.group({
      tareas_idtarea: [''],
      usuarios_idusuario: [''],
    });
  }

  createRecordTask(): any {
    this.dataRecordTask = this.formBuilder.group({
      fechahistorico: [this.setCreationTime(), [Validators.required]],
      motivo: ['Creación de tarea'],
      deschistorico: [`Se ha creado una nueva tarea.`],
      usuarios_idusuario: 1,
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

  addTask(): any {
    if (this.data.invalid) {
      return Object.values(this.data.controls).forEach((control) => {
        control.markAsTouched();
      });
    }
    // Asignar siguiente tarea para insertar en tareas_usuarios
    this.dataUserTask.get('tareas_idtarea').setValue(this.lastTask.idtarea + 1);

    const formObject = this.data.getRawValue();
    JSON.stringify(formObject);
    const userTaskObject = this.dataUserTask.getRawValue();
    JSON.stringify(userTaskObject);
    const recordTask = this.dataRecordTask.getRawValue();
    JSON.stringify(recordTask);

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
        Swal.fire({
          icon: 'error',
          text: 'Error en las fechas.',
        });
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

    this.taskService.createTask(formObject).subscribe((t: Task) => {
      this.taskService
        .createAssignment(userTaskObject)
        .subscribe((ut: UserTask) => {});
      this.recordModificationService
        .insertNewRecordModificationTask(recordTask, this.lastTask.idtarea + 1)
        .subscribe((rt) => {
          this.router.navigate(['task/user/', this.userId]);
        });
    });
  }

  private checkDates(dateA: string, dateB: string): boolean {
    let correct = true;

    const finalDateA = Date.parse(dateA);
    const finalDateB = Date.parse(dateB);

    if (finalDateB < finalDateA) {
      correct = false;
    }

    return correct;
  }
}
