import { Component, Input, OnInit } from '@angular/core';
import { HistoricalModificationProject } from 'src/app/models/historial-modification-project.model';
import { Project } from 'src/app/models/project.model';
import { Record } from 'src/app/models/record.model';
import { RecordModificationService } from 'src/app/services/record-modification.service';

@Component({
  selector: 'app-project-history',
  templateUrl: './project-history.component.html',
  styleUrls: ['./project-history.component.scss'],
})
export class ProjectHistoryComponent implements OnInit {
  @Input() project: Project;
  modifications: HistoricalModificationProject[];

  constructor(private recordsService: RecordModificationService) {}

  ngOnInit(): void {
    this.getAllRecordsProject(this.project.idproyecto);
  }

  getAllRecordsProject(idProject: number) {
    this.recordsService.getAllRecordsProject(idProject).subscribe((p) => {
      this.modifications = p;
      console.log(p);
    });
  }
}
