import { Component, Input, OnInit } from '@angular/core';
import { Block } from 'src/app/models/block.model';
import { Project } from 'src/app/models/project.model';
import { ProjectsService } from 'src/app/services/projects.service';

@Component({
  selector: 'app-project-view',
  templateUrl: './project-view.component.html',
  styleUrls: ['./project-view.component.scss']
})
export class ProjectViewComponent implements OnInit {

  @Input() project: Project;

  constructor(private projectService: ProjectsService) { }

  ngOnInit(): void {
  }

  deleteProject(idProject): void{
    console.log('Borrando proyecto '+idProject);
    this.deleteProject(idProject);
  }

}
