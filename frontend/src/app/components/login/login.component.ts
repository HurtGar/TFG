import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { Router } from '@angular/router';
import { UserLogin } from 'src/app/models/user-login.model';
import { AuthenticationService } from 'src/app/services/authentication.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss'],
})
export class LoginComponent implements OnInit {
  user: UserLogin = new UserLogin();
  rememberUser = true;

  constructor(
    private authService: AuthenticationService,
    private router: Router
  ) {}

  ngOnInit(): void {
    if (localStorage.getItem('email')) {
      this.user.email = localStorage.getItem('email');
      this.rememberUser = true;
    }
  }

  login(form: NgForm) {
    if (form.invalid) {
      Swal.fire({
        icon: 'error',
        text: 'Por favor, introduzca email y contraseña.',
      });
      return;
    }

    this.user.email = form.value.email;
    this.user.password = form.value.password;

    Swal.fire({
      icon: 'info',
      title: 'Accediendo',
      text: 'Espere por favor...',
    });
    Swal.showLoading();

    this.authService.getToken(this.user).subscribe(
      (resp) => {
        this.router.navigate([`/home/${resp.userId}`]).then(() => {
          if (this.rememberUser) {
            localStorage.setItem('email', this.user.email);
          }
          Swal.fire({
            icon: 'success',
            title: 'Login correcto',
          });
          Swal.close();
          window.location.reload();
        });
      },
      (err) => {
        Swal.fire({
          icon: 'error',
          title: 'Error al autenticar',
          text: 'Usuario o contraseña erronea',
        });
        console.log(err.error);
      }
    );
  }
}
