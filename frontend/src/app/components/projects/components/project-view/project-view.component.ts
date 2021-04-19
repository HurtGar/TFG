import { Component, Input, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Block } from 'src/app/models/block.model';
import { Project } from 'src/app/models/project.model';
import { Task } from 'src/app/models/task.model';
import { User } from 'src/app/models/user.model';
import { ProjectsService } from 'src/app/services/projects.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-project-view',
  templateUrl: './project-view.component.html',
  styleUrls: ['./project-view.component.scss'],
})
export class ProjectViewComponent implements OnInit {
  @Input() project: Project;
  horasactuales: number;
  horasestimacion: number;
  userId: string;
  users: User[];
  usersToAssign: User[];
  idusuario;

  constructor(
    private projectService: ProjectsService,
    private router: Router,
    private activatedRouter: ActivatedRoute
  ) {}

  ngOnInit(): void {
    this.getAllProjectHours(this.project.idproyecto.toString());
    this.getUsersAssigned(this.project.idproyecto.toString());
    this.userId = localStorage.getItem('userId');
    this.getAllUsers();
  }

  deleteProject(idProject): void {
    this.projectService.deleteProject(this.project.idproyecto).subscribe(
      (p: Project) => {
        this.router.navigate(['projects/user/', this.userId]);
      },
      (error: any) => {
        Swal.fire({
          icon: 'error',
          text:
            'Este proyecto tiene tareas asociadas. Elimine las tareas para eliminar el proyecto.',
        });
      }
    );
  }

  getAllProjectHours(idProject: string): void {
    this.projectService.getTotalProjectHours(idProject).subscribe((t: any) => {
      this.horasestimacion = t.horasestimacion;
      this.horasactuales = t.horasactuales;
    });
  }

  getUsersAssigned(idProject: string): void {
    this.projectService.getAllUsersFromAProject(idProject).subscribe((u) => {
      this.users = u;
    });
  }

  currentHours(horasActu: number, horasEsti: number): string {
    const hours = (horasActu * 100) / horasEsti;

    return hours.toString().concat('%');
  }

  getAllUsers(): void {
    this.projectService.getAllUsers().subscribe((u) => {
      this.usersToAssign = u;
    });
  }

  assignUser(idProject: number): void {
    const assign = JSON.stringify({
      idproyecto: idProject,
      idusuario: this.idusuario,
    });

    this.projectService.setAssignmentProject(assign).subscribe(
      (asig) => {
        window.location.reload();
      },
      (error: any) => {
        Swal.fire({
          icon: 'error',
          text: 'No se ha podido asignar el usuario. Inténtelo de nuevo.',
        });
      }
    );
  }

  selectUser(e): any {
    this.idusuario = e.target.value;
  }
}
