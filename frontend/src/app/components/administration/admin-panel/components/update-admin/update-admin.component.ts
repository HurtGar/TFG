import { formatDate } from '@angular/common';
import { Component, Input, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { User } from 'src/app/models/user.model';
import { UserService } from 'src/app/services/user.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-update-admin',
  templateUrl: './update-admin.component.html',
  styleUrls: ['./update-admin.component.scss'],
})
export class UpdateAdminComponent implements OnInit {
  @Input() user: User;
  data: FormGroup;
  error: any = { isError: false };

  constructor(
    private userService: UserService,
    private formBuilder: FormBuilder
  ) {
    this.createForm();
  }

  ngOnInit(): void {
    this.loadUser(this.user);
  }

  get nombreUsuarioNoValido(): any {
    return (this.data.get('nombre').invalid && this.data.get('nombre').touched);
  }
  get primerApellidoNoValido(): any {
    return (
      this.data.get('primerapellido').invalid &&
      this.data.get('primerapellido').touched
    );
  }
  get emailNoValido(): any {
    return (this.data.get('email').invalid && this.data.get('email').touched);
  }

  createForm(): any {
    this.data = this.formBuilder.group({
      nombre: ['', [Validators.required]],
      primerapellido: ['', [Validators.required]],
      segundoapellido: [''],
      telefono: [''],
      email: ['', [Validators.required]],
      fecharegistro: ['', [Validators.required]],
    });
  }

  loadUser(user: User): any {
    this.data = this.formBuilder.group({
      nombre: user.nombre,
      primerapellido: user.primerapellido,
      segundoapellido: user.segundoapellido,
      telefono: user.telefono,
      email: user.email,
      fecharegistro: formatDate(user.fecharegistro, 'dd-MM-yyyy', 'en'),
    });
    this.data.controls.fecharegistro.disable();
  }

  updateUser(): void {
    console.log(this.data);
    
    if (this.data.invalid) {
      return Object.values(this.data.controls).forEach((control) => {
        control.markAsTouched();
      });
    }

    const formObject = this.data.getRawValue();
    JSON.stringify(formObject);

    //Eliminamos fecha registro porque nunca se cambia.
    delete formObject.fecharegistro;

    this.userService.updateUser(formObject, this.user.idusuario).subscribe(
      (u: User) => {
        window.location.reload();
      },
      (error: any) => {
        Swal.fire({
          icon: 'error',
          text:
            'Error al actualizar usuario. Inténtelo de nuevo.',
        });
      }
    );
  }
}
