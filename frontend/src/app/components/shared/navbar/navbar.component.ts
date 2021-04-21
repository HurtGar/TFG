import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { UserLogin } from 'src/app/models/user-login.model';
import { AuthenticationService } from 'src/app/services/authentication.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.scss'],
})
export class NavbarComponent implements OnInit {
  user: UserLogin;
  rol: string;

  constructor(
    private authService: AuthenticationService,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.user = new UserLogin();
    this.user.username = localStorage.getItem('email');
    this.user.idusuario = Number(localStorage.getItem('userId'));
    this.rol = localStorage.getItem('roles');
  }

  searchApp(search: string) {
    this.router
      .navigateByUrl('/RefreshComponent', { skipLocationChange: true })
      .then(() => {
        this.router.navigate(['search', search]);
      });
  }

  logout() {
    this.authService.deleteToken();
    Swal.fire({
      title: 'Saliendo',
      icon: 'info',
      text: 'Cerrando sesión.',
      showCancelButton: false, // There won't be any cancel button
      showConfirmButton: false,
    });
    this.router.navigate([`/login`]).then(() => {
      window.location.reload();
    });
  }
}
