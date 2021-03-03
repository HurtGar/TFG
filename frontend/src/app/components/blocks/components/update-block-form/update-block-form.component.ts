import { Component, Input, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { Block } from 'src/app/models/block.model';
import { Project } from 'src/app/models/project.model';
import { BlockService } from 'src/app/services/block.service';
import { ProjectsService } from 'src/app/services/projects.service';

@Component({
  selector: 'app-update-block-form',
  templateUrl: './update-block-form.component.html',
  styleUrls: ['./update-block-form.component.scss']
})
export class UpdateBlockFormComponent implements OnInit {
  projects: Project[] = [];
  @Input() block: Block;
  data: FormGroup;
  error: any = { isError: false };

  constructor(
    private blockService: BlockService,
    private projectService: ProjectsService,
    private router: Router,
    private formBuilder: FormBuilder
  ) {
    this.createForm();
    this.loadProjects();
  }
  
  ngOnInit(): void {
    this.loadBlock(this.block);
  }

  get nombreBloqueNoValido(): any {
    return (
      this.data.get('nombrebloque').invalid &&
      this.data.get('nombrebloque').touched
    );
  }

  get idProject(): any {
    return this.data.get('proyecto_idproyecto');
  }

  selectProject(e: any): any {
    console.log(e.target.value);

    this.idProject.setValue(e.target.value, {
      onlySelf: true,
    });
  }

  compareTwoDates(): void {
    if (
      new Date(this.data.controls.finbloque.value) <
      new Date(this.data.controls.iniciobloque.value)
    ) {
      this.error = {
        isError: true,
      };
    }
  }

  loadProjects(): void {
    this.projectService.getAllProjectFromAnUser('1').subscribe((p) => {
      console.log(p);

      this.projects = p;
    });
  }

  createForm(): any {
    this.data = this.formBuilder.group({
      nombrebloque: ['', [Validators.required]],
      descbloque: [''],
      fechacreacion: [this.setCreationTime(), [Validators.required]],
      iniciobloque: [''],
      finbloque: [''],
      proyecto_idproyecto: [''],
    });
  }

  loadBlock(block: Block):any{
    this.data.setValue({
      nombrebloque: block.nombrebloque,
      descbloque: block.descbloque,
      fechacreacion: block.fechacreacion,
      iniciobloque: block.iniciobloque,
      finbloque: block.finbloque,
      proyecto_idproyecto: block.proyecto_idproyecto.idproyecto,
    });
    console.log(this.data);
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

  updateBlock(): void {
    if (this.data.invalid) {
      return Object.values(this.data.controls).forEach((control) => {
        control.markAsTouched();
      });
    }

    const formObject = this.data.getRawValue();
    JSON.stringify(formObject);

    // Comprobar si la fecha de fin es anterior a la de inicio del proyecto.
    if (
      this.data.get('iniciobloque').value != null &&
      this.data.get('finbloque').value != null
    ) {
      const datesOk = this.checkDates(
        this.data.get('iniciobloque').value,
        this.data.get('finbloque').value
      );
      if (!datesOk) {
        throw Error();
      }
    }

    // Las fechas pueden venir vacías y si vienen, debemos borrar el campo del JSON para evitar problemas de inserción.
    // No se puede insertar en la BD un campo de tipo DateField como null o vacío.
    if (
      this.data.get('iniciobloque').value === null ||
      this.data.get('iniciobloque').value === ''
    ) {
      delete formObject.iniciobloque;
    }
    if (
      this.data.get('finbloque').value === null ||
      this.data.get('finbloque').value === ''
    ) {
      delete formObject.finbloque;
    }

    console.log(formObject);

    this.blockService.updateBlock(formObject,this.block.idbloque).subscribe((b: Block) => {
      console.log(b);
      window.location.reload();
    },
    (error: any)=> console.log(error)
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
