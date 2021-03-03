import { Component, Input, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Project } from 'src/app/models/project.model';
import { ProjectsService } from 'src/app/services/projects.service';

@Component({
  selector: 'app-update-form',
  templateUrl: './update-form.component.html',
  styleUrls: ['./update-form.component.scss'],
})
export class UpdateProjectFormComponent implements OnInit {
  data: FormGroup;
  @Input() project: Project;
  error: any = { isError: false };
  updateForm = true;

  constructor(
    private projectService: ProjectsService,
    private formBuilder: FormBuilder,
    private router: Router
  ) {
    this.createForm();
  }

  ngOnInit(): void {
    this.loadDataToForm(this.project);
  }

  get nombreProyectoNoValido(): any {
    return (
      this.data.get('nombreproyecto').invalid &&
      this.data.get('nombreproyecto').touched
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
      descproyecto: [''],
      fechacreacion: [''],
      inicioproyecto: [''],
      finproyecto: [''],
    });
  }

  loadDataToForm(pro: Project): any {
    this.data.setValue({
      nombreproyecto: pro.nombreproyecto,
      descproyecto: pro.descproyecto,
      fechacreacion: pro.fechacreacion,
      inicioproyecto: pro.inicioproyecto,
      finproyecto: pro.finproyecto,
    });
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

  updateProject(): void {
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

    this.projectService
      .updateProject(formObject, this.project.idproyecto)
      .subscribe(
        (p: Project) => {
          console.log(p);
          // Recargamos la página para mostrar los nuevos cambios.
          window.location.reload();
        },
        (error: any) => console.log(error)
      );
  }
}
