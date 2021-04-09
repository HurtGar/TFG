import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Project } from 'src/app/models/project.model';
import { Record } from 'src/app/models/record.model';
import { ProjectsService } from 'src/app/services/projects.service';
import { RecordModificationService } from 'src/app/services/record-modification.service';

@Component({
  selector: 'app-projects-list',
  templateUrl: './projects-list.component.html',
  styleUrls: ['./projects-list.component.scss'],
})
export class ProjectsListComponent implements OnInit {
  projects: Project[] = [];
  lastModification: Record[] = [];

  constructor(
    private projectsService: ProjectsService,
    private recordService: RecordModificationService,
    private router: ActivatedRoute
  ) {
    this.router.params.subscribe((param) => {
      this.getAllProjectFromAnUser(param.idUsuario);
    });
  }

  ngOnInit(): void {}

  public getAllProjectFromAnUser(idUsuario: string): void {
    let i = 0;
    this.projectsService
      .getAllProjectFromAnUser(idUsuario)
      .subscribe((project) => {
        this.projects = project;
        console.log(project);
        if (project.length > 0) {
          this.recordService
            .getRecordsChangesFromProject(project[i].idproyecto)
            .subscribe((record) => {
              this.lastModification = record;
              console.log(record);
            });
          i += 1;
        }
      });
  }
}
