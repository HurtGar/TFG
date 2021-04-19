import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { UserLogin } from 'src/app/models/user-login.model';
import { RegisterService } from 'src/app/services/register-service.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-registration',
  templateUrl: './registration.component.html',
  styleUrls: ['./registration.component.scss'],
})
export class RegistrationComponent implements OnInit {
  user: UserLogin;
  data: FormGroup;
  error: any = { isError: false };
  constructor(
    private registrationService: RegisterService,
    private formBuilder: FormBuilder
  ) {
    this.createForm();
  }

  ngOnInit(): void {}

  get userNameNoValid(): any {
    return this.data.get('nombre').invalid && this.data.get('nombre').touched;
  }
  get firstSurnameNoValid(): any {
    return (
      this.data.get('primerapellido').invalid &&
      this.data.get('primerapellido').touched
    );
  }
  get emailNoValid(): any {
    return this.data.get('email').invalid && this.data.get('email').touched;
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

  createForm(): any {
    this.data = this.formBuilder.group({
      nombre: ['', [Validators.required]],
      primerapellido: ['', [Validators.required]],
      segundoapellido: [''],
      email: ['', [Validators.required]],
      password: ['', [Validators.required]],
      fecharegistro: [this.setCreationTime(), Validators.required],
      confirmPassword: ['', [Validators.required]],
      estado: [1, [Validators.required]],
    });
  }

  onSubmit(): any {
    console.log(this.data);

    if (this.data.invalid) {
      return Object.values(this.data.controls).forEach((control) => {
        control.markAsTouched();
      });
    }

    const formObject = this.data.getRawValue();
    JSON.stringify(formObject);

    console.log(formObject);

    this.registrationService.registerNewUser(formObject).subscribe(
      (u: any) => {
        localStorage.setItem('token', u.token);
      },
      (error: any) => {
        Swal.fire({
          icon: 'error',
          text: 'Error al insertar nuevo. Inténtelo de nuevo.',
        });
      }
    );
  }
}
