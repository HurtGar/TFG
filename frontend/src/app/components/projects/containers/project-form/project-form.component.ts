import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Project } from 'src/app/models/project.model';
import { ProjectsService } from 'src/app/services/projects.service';

@Component({
  selector: 'app-project-form',
  templateUrl: './project-form.component.html',
  styleUrls: ['./project-form.component.scss'],
})
export class ProjectFormComponent implements OnInit {
  project: Project;
  createForm = true;

  constructor(
    private projectsService: ProjectsService,
    private router: ActivatedRoute
  ) {
    this.router.params.subscribe((param) => {
      this.getOneProjectFromAnUser(param.idUser, param.idProject);
    });
  }

  ngOnInit(): void {}

  public getOneProjectFromAnUser(idUser: string, idProject: string): void {
    this.projectsService.getOneProjectFromAnUser('1', '1').subscribe((pro) => {
      this.project = pro;
    });
  }
}
