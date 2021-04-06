import { Component, Input, OnInit } from '@angular/core';
import { Task } from 'src/app/models/task.model';

@Component({
  selector: 'app-tasks-available',
  templateUrl: './tasks-available.component.html',
  styleUrls: ['./tasks-available.component.scss']
})
export class TasksAvailableComponent implements OnInit {

  @Input() tasks: Task[] = [];
  userId: string;

  constructor() { }

  ngOnInit(): void {
    this.userId = localStorage.getItem('userId');
  }

}
