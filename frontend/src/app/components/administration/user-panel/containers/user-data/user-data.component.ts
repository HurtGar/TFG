import { Component, OnInit } from '@angular/core';
import { User } from 'src/app/models/user.model';
import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'app-user-data',
  templateUrl: './user-data.component.html',
  styleUrls: ['./user-data.component.scss']
})
export class UserDataComponent implements OnInit {

  userId: string;
  user: User;

  constructor(private userService: UserService) { 
  }

  ngOnInit(): void {
    this.userId = localStorage.getItem('userId');
    this.getUser();
  }

  getUser() {
    this.userService.getUserById(this.userId).subscribe((u) => {
      this.user = u;
    });
  }

}
