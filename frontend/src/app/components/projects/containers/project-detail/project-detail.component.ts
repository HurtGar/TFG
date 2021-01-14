import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Project } from 'src/app/models/project.model';
import { ProjectsService } from 'src/app/services/projects.service';

@Component({
  selector: 'app-project-detail',
  templateUrl: './project-detail.component.html',
  styleUrls: ['./project-detail.component.scss'],
})
export class ProjectDetailComponent implements OnInit {
  project: Project;
  blocks: any;
  tasks: any;

  constructor(
    private projectsService: ProjectsService,
    private router: ActivatedRoute
  ) {
    this.router.params.subscribe((param) => {
      this.getOneProjectFromAnUser(param.idUser, param.idProject);
    });
  }

  ngOnInit(): void {}

  public getOneProjectFromAnUser(idUser: string, idProject: string): void{
    this.projectsService
      .getOneProjectFromAnUser(idUser, idProject)
      .subscribe((pro) => {
        this.project = pro;
        console.log(pro);
      });
  }
}
