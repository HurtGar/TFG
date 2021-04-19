import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { User } from 'src/app/models/user.model';
import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'app-admin-list',
  templateUrl: './admin-list.component.html',
  styleUrls: ['./admin-list.component.scss'],
})
export class AdminListComponent implements OnInit {
  users: User[];

  constructor(private userService: UserService) {
    this.getUsersFromApp();
  }

  ngOnInit(): void {}

  getUsersFromApp(): any {
    this.userService.getUsersFromApp().subscribe((u) => {
      this.users = u;
    });
  }
}
