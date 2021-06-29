import { Component, OnInit } from '@angular/core';
import { Project } from 'src/app/models/project.model';
import { ProjectsService } from 'src/app/services/projects.service';
import { Router } from '@angular/router';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { RecordModificationService } from 'src/app/services/record-modification.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-new-form',
  templateUrl: './new-form.component.html',
  styleUrls: ['./new-form.component.scss'],
})
export class NewProjectFormComponent implements OnInit {
  project: Project;
  data: FormGroup;
  dataRecord: FormGroup;
  lastProject: number;
  error: any = { isError: false };
  userId: string;
  constructor(
    private projectService: ProjectsService,
    private router: Router,
    private recordModificationService: RecordModificationService,
    private formBuilder: FormBuilder
  ) {
    this.createForm();
    this.projectService.lastInsertedProject().subscribe((lp) => {
      this.lastProject = lp;
    });
    this.createRecordProject();
  }

  ngOnInit(): void {
    this.userId = localStorage.getItem('userId');
  }

  get nombreProyectoNoValido(): any {
    return (
      this.data.get('nombreproyecto').invalid &&
      this.data.get('nombreproyecto').touched
    );
  }

  get inicioProyectoNoValido(): any {
    return (
      this.data.get('inicioproyecto').invalid &&
      this.data.get('inicioproyecto').touched
    );
  }

  compareTwoDates(): void {
    if (
      new Date(this.data.controls.finproyecto.value) <
      new Date(this.data.controls.inicioproyecto.value)
    ) {
      this.error = {
        isError: true,
      };
    }
  }
  createForm(): any {
    this.data = this.formBuilder.group({
      nombreproyecto: ['', [Validators.required]],
      descproyecto: '',
      fechacreacion: [this.setCreationTime(), [Validators.required]],
      inicioproyecto: [''],
      finproyecto: [''],
    });
  }

  createRecordProject(): any {
    this.dataRecord = this.formBuilder.group({
      fechahistorico: [this.setCreationTime(), [Validators.required]],
      motivo: ['Creación del proyecto'],
      deschistorico: [`Se ha creado un nuevo proyecto.`],
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

  addProject(): void {
    if (this.data.invalid) {
      return Object.values(this.data.controls).forEach((control) => {
        control.markAsTouched();
      });
    }
    const formObject = this.data.getRawValue();
    JSON.stringify(formObject);
    const recordProject = this.dataRecord.getRawValue();
    JSON.stringify(recordProject);

    // Comprobar si la fecha de fin es anterior a la de inicio del proyecto.
    if (
      this.data.get('inicioproyecto').value != null &&
      this.data.get('finproyecto').value != null
    ) {
      const datesOk = this.checkDates(
        this.data.get('inicioproyecto').value,
        this.data.get('finproyecto').value
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
      this.data.get('inicioproyecto').value === null ||
      this.data.get('inicioproyecto').value === ''
    ) {
      delete formObject.inicioproyecto;
    }
    if (
      this.data.get('finproyecto').value === null ||
      this.data.get('finproyecto').value === ''
    ) {
      delete formObject.finproyecto;
    }

    this.projectService.createProject(formObject).subscribe(
      (p: Project) => {
        var assign = {
          idusuario: this.userId,
          idproyecto: this.lastProject + 1,
        };

        // Creamos objeto a enviar para la asignación

        this.projectService.setAssignmentProject(assign).subscribe((a) => {});

        this.recordModificationService
          .insertNewRecordModificationProject(
            recordProject,
            this.lastProject + 1
          )
          .subscribe((rt) => {
            this.router.navigate(['projects/user/', this.userId]);
          });
      },
      (error: any) => {
        Swal.fire({
          icon: 'error',
          text: 'Error al insertar proyecto. Inténtelo de nuevo.',
        });
      }
    );
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
