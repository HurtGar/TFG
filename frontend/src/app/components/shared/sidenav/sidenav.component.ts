import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-sidenav',
  templateUrl: './sidenav.component.html',
  styleUrls: ['./sidenav.component.scss'],
})
export class SidenavComponent implements OnInit {
  events: string[] = [];
  opened: boolean;
  userId: string;

  constructor() {}

  ngOnInit(): void {
    this.userId = localStorage.getItem('userId');
  }
}
