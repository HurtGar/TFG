import { Component, Input, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Block } from 'src/app/models/block.model';
import { Project } from 'src/app/models/project.model';
import { ProjectsService } from 'src/app/services/projects.service';

@Component({
  selector: 'app-project-view',
  templateUrl: './project-view.component.html',
  styleUrls: ['./project-view.component.scss'],
})
export class ProjectViewComponent implements OnInit {
  @Input() project: Project;

  constructor(
    private projectService: ProjectsService,
    private router: Router
  ) {}

  ngOnInit(): void {}

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
}
