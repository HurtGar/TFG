import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { User } from 'src/app/models/user.model';
import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'app-admin-detail',
  templateUrl: './admin-detail.component.html',
  styleUrls: ['./admin-detail.component.scss'],
})
export class AdminDetailComponent implements OnInit {
  users: User;

  constructor(
    private userService: UserService,
    private router: ActivatedRoute
  ) {
    this.router.params.subscribe((param) => {
      this.getUserById(param.idUser);
    });
  }

  ngOnInit(): void {}

  getUserById(idUser): any {
    this.userService.getUserById(idUser).subscribe((u) => {
      this.users = u;
    });
  }
}
