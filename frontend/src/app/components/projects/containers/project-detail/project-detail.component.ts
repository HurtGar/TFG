import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Block } from 'src/app/models/block.model';
import { Project } from 'src/app/models/project.model';
import { Task } from 'src/app/models/task.model';
import { ProjectsService } from 'src/app/services/projects.service';

@Component({
  selector: 'app-project-detail',
  templateUrl: './project-detail.component.html',
  styleUrls: ['./project-detail.component.scss'],
})
export class ProjectDetailComponent implements OnInit {
  project: Project;
  blocks: Block;
  tasks: Task;

  constructor(
    private projectsService: ProjectsService,
    private router: ActivatedRoute
  ) {
    this.router.params.subscribe((param) => {
      this.getOneProjectFromAnUser(param.idUser, param.idProject);
    });

    this.router.params.subscribe((param) => {
      this.getAllBlocksFromAProjectAndUser(param.idUser, param.idProject);
    });
    this.router.params.subscribe((param) => {
      this.getAllTasksFromAProject(param.idProject);
    });
  }

  ngOnInit(): void {}

  public getOneProjectFromAnUser(idUser: string, idProject: string): void {
    this.projectsService
      .getOneProjectFromAnUser(idUser, idProject)
      .subscribe((pro) => {
        this.project = pro;
      });
  }

  public getAllBlocksFromAProjectAndUser(
    idUser: string,
    idProject: string
  ): void {
    const myMap = new Map<number, number>();
    this.projectsService
      .getAllBlocksFromAProject(idUser, idProject)
      .subscribe((block) => {
        this.blocks = block;
      });
  }

  public getAllTasksFromAProject(idProject: string): void {
    this.projectsService
      .getAllTasksFromAProject(idProject)
      .subscribe((task) => {
        this.tasks = task;
      });
  }
}
