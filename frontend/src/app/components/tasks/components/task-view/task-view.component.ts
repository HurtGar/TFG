import { Component, Input, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Task } from 'src/app/models/task.model';
import { User } from 'src/app/models/user.model';
import { ProjectsService } from 'src/app/services/projects.service';
import { TaskService } from 'src/app/services/task.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-task-view',
  templateUrl: './task-view.component.html',
  styleUrls: ['./task-view.component.scss'],
})
export class TaskViewComponent implements OnInit {
  @Input() task: Task;
  userId: string;
  users: User[];
  usersToAssign: User[];
  idusuario;
  permissions = '';

  constructor(
    private taskService: TaskService,
    private projectService: ProjectsService,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.userId = localStorage.getItem('userId');
    this.permissions = localStorage.getItem('permission');
    this.getUsersAssigned(this.task.idtarea.toString());
    this.getAllUsersOfAProject();
  }

  deleteTask(idTask): void {
    this.taskService.deleteTaskAssignment(this.task.idtarea).subscribe(
      (t: Task) => {
        this.taskService.deleteTask(this.task.idtarea).subscribe(
          (t: Task) => {
            this.router.navigate(['task/user/', this.userId]);
          },
          (error: any) => {
            Swal.fire({
              icon: 'error',
              text:
                'Error al eliminar tarea. Inténtelo de nuevo.',
            });
          }
        );
      },
      (error: any) => {
        Swal.fire({
          icon: 'error',
          text: 'Error al eliminar asignación del usuario. Inténtelo de nuevo.',
        });
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

  getUsersAssigned(idTask: string): void {
    this.taskService.getAllUsersFromATask(idTask).subscribe((u) => {
      this.users = u;
    });
  }

  getAllUsersOfAProject(): void {
    this.projectService
      .getAllUsersFromAProject(
        this.task.proyectos_idproyecto.idproyecto.toString()
      )
      .subscribe((u) => {
        this.usersToAssign = u;
      });
  }

  assignUser(idTask: number): void {
    const assign = JSON.stringify({
      tareas_idtarea: idTask,
      usuarios_idusuario: this.idusuario,
    });
    console.log(assign);

    this.taskService.setAssignmentTask(assign).subscribe(
      (asig) => {
        window.location.reload();
      },
      (error: any) => {
        Swal.fire({
          icon: 'error',
          text:
            'No se ha podido asignar el usuario. Inténtelo de nuevo.',
        });
      }
    );
  }

  selectUser(e): any {
    this.idusuario = e.target.value;
  }
}
