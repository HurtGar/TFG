import { Component, Input, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Block } from 'src/app/models/block.model';
import { Project } from 'src/app/models/project.model';
import { Task } from 'src/app/models/task.model';
import { ProjectsService } from 'src/app/services/projects.service';

@Component({
  selector: 'app-project-view',
  templateUrl: './project-view.component.html',
  styleUrls: ['./project-view.component.scss'],
})
export class ProjectViewComponent implements OnInit {
  @Input() project: Project;
  horasactuales: number;
  horasestimacion: number;

  constructor(
    private projectService: ProjectsService,
    private router: Router,
    private activatedRouter: ActivatedRoute
  ) {}

  ngOnInit(): void {
    this.getAllProjectHours(this.project.idproyecto.toString());
  }

  deleteProject(idProject): void {
    this.projectService.deleteProject(this.project.idproyecto).subscribe(
      (p: Project) => {
        console.log('Borrando proyecto');
        this.router.navigate(['projects/user/1']);
      },
      (error: any) => {
        console.log(error);
        alert('Este proyecto tiene tareas asociadas. No se puede borrar.');
      }
    );
  }

  getAllProjectHours(idProject: string): void {
    this.projectService.getTotalProjectHours(idProject).subscribe((t: any) => {
      console.log(t);
      this.horasestimacion = t.horasestimacion;
      this.horasactuales = t.horasactuales;
    });
  }

  currentHours(horasActu: number, horasEsti: number): string {
    const hours = (horasActu * 100) / horasEsti;

    return hours.toString().concat('%');
  }
}
