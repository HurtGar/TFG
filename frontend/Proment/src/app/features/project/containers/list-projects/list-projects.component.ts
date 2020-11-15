import { Component, OnInit } from '@angular/core';
import { ProjectService } from 'src/app/features/project/services/project.service';
import { Project } from './../../models/project.model';

@Component({
  selector: 'app-list-projects',
  templateUrl: './list-projects.component.html',
  styleUrls: ['./list-projects.component.scss'],
})
export class ListProjectComponent implements OnInit {
  // Inyección del servicio en el componente.
  constructor(private service: ProjectService) {}

  Projects: Project[] = [];

  ngOnInit(): void {
    this.refreshProjectList();
  }

  refreshProjectList(): any {
    this.service.getProjectList().subscribe((data) => {
      this.Projects = data;
    });
  }
}
