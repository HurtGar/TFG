import { Component, Input, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { User } from 'src/app/models/user.model';
import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'app-admin-view',
  templateUrl: './admin-view.component.html',
  styleUrls: ['./admin-view.component.scss'],
})
export class AdminViewComponent implements OnInit {
  @Input() user: User;

  constructor(private userService: UserService, private router: Router) {}

  ngOnInit(): void {}

  deleteUser(idUser): void {
    this.userService.deleteUser(idUser).subscribe(
      (u: User) => {
        this.router.navigate(['administration-panel']);
      },
      (error: any) => {
        console.log(error);
        alert('No se ha podido borrar el usuario.');
      }
    );
  }
}
