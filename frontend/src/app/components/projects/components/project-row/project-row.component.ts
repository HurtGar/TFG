import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
import { Project } from 'src/app/models/project.model';
import { Record } from 'src/app/models/record.model';

@Component({
  selector: 'app-project-row',
  templateUrl: './project-row.component.html',
  styleUrls: ['./project-row.component.scss'],
})
export class ProjectRowComponent implements OnInit {
  @Input() project: Project;
  @Input() lastModification: Record;
  @Output() detail = new EventEmitter<number>(); // Esto devolverá el ID del proyecto.

  constructor() {}

  ngOnInit(): void {}

}
