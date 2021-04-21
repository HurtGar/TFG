import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Record } from 'src/app/models/record.model';
import { Task } from 'src/app/models/task.model';
import { RecordModificationService } from 'src/app/services/record-modification.service';
import { TaskService } from 'src/app/services/task.service';

@Component({
  selector: 'app-task-list',
  templateUrl: './task-list.component.html',
  styleUrls: ['./task-list.component.scss'],
})
export class TaskListComponent implements OnInit {
  tasks: Task[] = [];
  lastModification: Record[] = [];
  permissions = '';

  constructor(
    private taskService: TaskService,
    private recordService: RecordModificationService,
    private router: ActivatedRoute
  ) {
    this.router.params.subscribe((param) => {
      this.getAllTaskFromAnUser(param.idUser);
    });
  }

  ngOnInit(): void {
    this.permissions = localStorage.getItem('permission');
  }

  public getAllTaskFromAnUser(idUser: string): void {
    let i = 0;
    this.taskService.getAllTasksFromAnUser(idUser).subscribe((task) => {
      this.tasks = task;

      this.recordService
        .getRecordsChangesFromTask(task[i].idtarea)
        .subscribe((record) => {
          this.lastModification = record;
        });
      i += 1;
    });
  }
}
