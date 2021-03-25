import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { Router } from '@angular/router';
import { UserLogin } from 'src/app/models/user-login.model';
import { AuthenticationService } from 'src/app/services/authentication.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss'],
})
export class LoginComponent implements OnInit {
  user: UserLogin = new UserLogin();
  rememberUser = true;

  constructor(private authService: AuthenticationService, private router: Router) {}

  ngOnInit(): void {
    if(localStorage.getItem('email')){
      this.user.username = localStorage.getItem('email');
      this.rememberUser = true;
    }
  }

  login(form: NgForm) {
    this.user.username = form.value.username;
    this.user.password = form.value.password;

    this.authService.getToken(this.user).subscribe(
      (resp) => {
        this.router.navigateByUrl('/home/1');
        if(this.rememberUser){
          localStorage.setItem('email', this.user.username);
        }
      },
      (err) => {
        console.log(err.error);
      }
    );
  }
}
