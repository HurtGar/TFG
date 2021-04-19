import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { User } from 'src/app/models/user.model';
import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'app-new-user-admin',
  templateUrl: './new-user-admin.component.html',
  styleUrls: ['./new-user-admin.component.scss'],
})
export class NewUserAdminComponent implements OnInit {
  data: FormGroup;

  constructor(
    private userService: UserService,
    private formBuilder: FormBuilder,
    private router: Router
  ) {
    this.createForm();
  }

  ngOnInit(): void {}

  get nombreUsuarioNoValido(): any {
    return this.data.get('nombre').invalid && this.data.get('nombre').touched;
  }
  get primerApellidoNoValido(): any {
    return (
      this.data.get('primerapellido').invalid &&
      this.data.get('primerapellido').touched
    );
  }
  get emailNoValido(): any {
    return this.data.get('email').invalid && this.data.get('email').touched;
  }

  createForm() {
    this.data = this.formBuilder.group({
      nombre: ['', Validators.required],
      primerapellido: ['', Validators.required],
      segundoapellido: [''],
      email: ['', Validators.required],
      password: ['', Validators.required],
      telefono: [''],
      administrador: [''],
      activar: [''],
      fecharegistro: [this.setCreationTime(), [Validators.required]],
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

  addUser() {
    if (this.data.invalid) {
      return Object.values(this.data.controls).forEach((control) => {
        control.markAsTouched();
      });
    }

    const formObject = this.data.getRawValue();

    // Eliminar campos vacios.
    if (
      this.data.get('segundoapellido').value === null ||
      this.data.get('segundoapellido').value === ''
    ) {
      delete formObject.segundoapellido;
    }
    if (
      this.data.get('telefono').value === null ||
      this.data.get('telefono').value === ''
    ) {
      delete formObject.telefono;
    }
    console.log(this.data);

    console.log(formObject);

    this.userService.createUser(formObject).subscribe((u: User) => {
      this.router.navigate(['administration-panel']);
    });
  }
}
