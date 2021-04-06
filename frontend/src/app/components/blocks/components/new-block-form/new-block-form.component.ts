import { Component, OnInit } from '@angular/core';
import { FormArray, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';
import { Block } from 'src/app/models/block.model';
import { Project } from 'src/app/models/project.model';
import { BlockService } from 'src/app/services/block.service';
import { ProjectsService } from 'src/app/services/projects.service';
import { RecordModificationService } from 'src/app/services/record-modification.service';

@Component({
  selector: 'app-new-block-form',
  templateUrl: './new-block-form.component.html',
  styleUrls: ['./new-block-form.component.scss'],
})
export class NewBlockFormComponent implements OnInit {
  projects: Project[] = [];
  block: Block;
  data: FormGroup;
  dataRecordBlock: FormGroup;
  lastBlock: Block;
  error: any = { isError: false };
  userId: string;

  constructor(
    private blockService: BlockService,
    private projectService: ProjectsService,
    private recordModificationService: RecordModificationService,
    private router: Router,
    private formBuilder: FormBuilder
  ) {
    this.createForm();
    this.loadProjects();
    this.blockService.lastInsertedBlock().subscribe((lb) => {
      this.lastBlock = lb;
    });
    this.createRecordBlock();
  }

  ngOnInit(): void {
    this.userId = localStorage.getItem('userId');
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

  selectProject(e): any {
    console.log(e.target.value);

    this.idProject.setValue(e.target.value, {
      onlySelf: true,
    });
  }

  loadProjects(): void {
    this.projectService.getAllProjectFromAnUser('1').subscribe((p) => {
      console.log(p);

      this.projects = p;
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

  createRecordBlock(): any {
    this.dataRecordBlock = this.formBuilder.group({
      fechahistorico: [this.setCreationTime(), [Validators.required]],
      motivo: ['Creación del bloque'],
      deschistorico: [`Se ha creado un nuevo bloque.`],
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

  addBlock(): void {
    if (this.data.invalid) {
      return Object.values(this.data.controls).forEach((control) => {
        control.markAsTouched();
      });
    }

    const formObject = this.data.getRawValue();
    JSON.stringify(formObject);
    const recordBlock = this.dataRecordBlock.getRawValue();
    JSON.stringify(recordBlock);
    console.log(recordBlock);

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

    this.blockService.createBlock(formObject).subscribe((b: Block) => {});

    this.recordModificationService
      .insertNewRecordModificationBlock(
        recordBlock,
        this.lastBlock.idbloque + 1
      )
      .subscribe((rb) => {
        this.router.navigate(['blocks/user/', this.userId]);
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
}