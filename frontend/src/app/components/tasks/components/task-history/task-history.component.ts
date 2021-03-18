import { Component, Input, OnInit } from '@angular/core';
import { HistoricalModificationTask } from 'src/app/models/historical-modification-task.model';
import { Task } from 'src/app/models/task.model';
import { RecordModificationService } from 'src/app/services/record-modification.service';

@Component({
  selector: 'app-task-history',
  templateUrl: './task-history.component.html',
  styleUrls: ['./task-history.component.scss'],
})
export class TaskHistoryComponent implements OnInit {
  @Input() task: Task;
  modifications: HistoricalModificationTask[];

  constructor(private recordsService: RecordModificationService) {}

  ngOnInit(): void {
    this.getAllRecordsTask(this.task.idtarea);
  }

  getAllRecordsTask(idTask: number) {
    this.recordsService.getAllRecordsTask(idTask).subscribe((t) => {
      this.modifications = t;
      console.log(t);
    });
  }
}
