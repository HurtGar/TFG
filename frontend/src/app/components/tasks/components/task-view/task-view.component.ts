import { Component, Input, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Task } from 'src/app/models/task.model';
import { TaskService } from 'src/app/services/task.service';

@Component({
  selector: 'app-task-view',
  templateUrl: './task-view.component.html',
  styleUrls: ['./task-view.component.scss'],
})
export class TaskViewComponent implements OnInit {
  @Input() task: Task;
  userId: string;

  constructor(private taskService: TaskService, private router: Router) {}

  ngOnInit(): void {
    this.userId = localStorage.getItem('userId');
  }

  deleteTask(idTask): void {
    this.taskService.deleteTaskAssignment(this.task.idtarea).subscribe(
      (t: Task) => {},
      (error: any) => {
        console.log(error);
        alert('Esta tarea no puede ser eliminada.');
      }
    );

    this.taskService.deleteTask(this.task.idtarea).subscribe(
      (t: Task) => {
        this.router.navigate(['task/user/', this.userId]);
      },
      (error: any) => {
        console.log(error);
        alert('Esta tarea no puede ser eliminada.');
      }
    );
  }

  currentHours(taskHour: Task): string {
    const hours = (taskHour.horasactuales * 100) / taskHour.horasestimacion;

    return hours.toString().concat('%');
  }
  remainingHours(taskHour: Task): string {
    const hours = (taskHour.horasrestantes * 100) / taskHour.horasestimacion;

    return hours.toString().concat('%');
  }
}
