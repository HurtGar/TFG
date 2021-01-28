import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Task } from 'src/app/models/task.model';
import { TaskService } from 'src/app/services/task.service';

@Component({
  selector: 'app-task-detail',
  templateUrl: './task-detail.component.html',
  styleUrls: ['./task-detail.component.scss'],
})
export class TaskDetailComponent implements OnInit {
  tasks: Task;

  constructor(
    private taskService: TaskService,
    private router: ActivatedRoute
  ) {
    this.router.params.subscribe((param) => {
      this.getOneTaskFromAUser(param.idUser, param.idTask);
    });
  }

  ngOnInit(): void {}

  public getOneTaskFromAUser(idUser: string, idTask: string): void {
    this.taskService.getOneTaskFromAnUser(idUser, idTask).subscribe((t) => {
      this.tasks = t;
      console.log(t);
    });
  }
}
