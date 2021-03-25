import { Component, OnInit } from '@angular/core';
import { UserLogin } from 'src/app/models/user-login.model';

@Component({
  selector: 'app-registration',
  templateUrl: './registration.component.html',
  styleUrls: ['./registration.component.scss'],
})
export class RegistrationComponent implements OnInit {
  user: UserLogin;

  constructor() {}

  ngOnInit(): void {
    this.user = new UserLogin();
    this.user.email = 'adrian@gmail.com';
    this.user.username = 'Adrian';
    this.user.password = 'adrian';
    this.user.idusuario = 1;
  }

  onSubmit(): any {
    console.log('Formulario enviado.');
    console.log(this.user);
  }
}
