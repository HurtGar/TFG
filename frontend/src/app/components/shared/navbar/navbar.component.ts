import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { UserLogin } from 'src/app/models/user-login.model';
import { AuthenticationService } from 'src/app/services/authentication.service';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.scss'],
})
export class NavbarComponent implements OnInit {
  
  user: UserLogin;

  constructor(private authService: AuthenticationService, private router: Router) {}

  ngOnInit(): void {
    this.user = new UserLogin();
    this.user.username = localStorage.getItem('email');
  }

  logout() {
    this.authService.deleteToken();
    this.router.navigateByUrl('/login');
  }
}
