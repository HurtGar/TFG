import { Component, Input, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { User } from 'src/app/models/user.model';
import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'app-admin-row',
  templateUrl: './admin-row.component.html',
  styleUrls: ['./admin-row.component.scss']
})
export class AdminRowComponent implements OnInit {

  @Input() user: User;

  constructor(private userService: UserService, private router: Router) {
  }

  ngOnInit(): void {
  }

}
