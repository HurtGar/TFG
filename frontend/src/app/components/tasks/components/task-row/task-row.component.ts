import { Component, Input, OnInit } from '@angular/core';
import { Record } from 'src/app/models/record.model';
import { Task } from 'src/app/models/task.model';

@Component({
  selector: 'app-task-row',
  templateUrl: './task-row.component.html',
  styleUrls: ['./task-row.component.scss']
})
export class TaskRowComponent implements OnInit {

  @Input() task: Task;
  @Input() lastModification: Record;
  constructor() { }

  ngOnInit(): void {
  }

}
