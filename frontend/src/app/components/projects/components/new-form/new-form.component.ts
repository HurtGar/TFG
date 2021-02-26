import { Component, OnInit } from '@angular/core';
import { Project } from 'src/app/models/project.model';
import { ProjectsService } from 'src/app/services/projects.service';
import { Router } from '@angular/router';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';

@Component({
  selector: 'app-new-form',
  templateUrl: './new-form.component.html',
  styleUrls: ['./new-form.component.scss'],
})
export class NewFormComponent implements OnInit {
  project: Project;
  data: FormGroup;
  error: any = { isError: false };
  constructor(
    private projectService: ProjectsService,
    private router: Router,
    private formBuilder: FormBuilder
  ) {
    this.createForm();
  }

  ngOnInit(): void {}

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
      this.data.get('inicioproyecto').value != null &&
      this.data.get('finproyecto').value != null
    ) {
      const datesOk = this.checkDates(
        this.data.get('inicioproyecto').value,
        this.data.get('finproyecto').value
      );
      if (!datesOk) {
        throw Error();
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

    console.log(formObject);

    this.projectService.createProject(formObject).subscribe(
      (p: Project) => {
        console.log(p);
        this.router.navigate(['projects/user/1']);
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
