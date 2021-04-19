import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Task } from 'src/app/models/task.model';
import { BlockService } from 'src/app/services/block.service';
import { ProjectsService } from 'src/app/services/projects.service';
import { TaskService } from 'src/app/services/task.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss'],
})
export class HomeComponent implements OnInit {
  tasks: Task[] = [];
  currentDate = new Date();
  userId = localStorage.getItem('userId');

  constructor(
    private projectService: ProjectsService,
    private blockService: BlockService,
    private taskService: TaskService,
    private router: ActivatedRoute
  ) {
    this.router.params.subscribe((param) => {
      this.getTasksWithAnUpcomingDate(param.idUser);
    });
  }

  ngOnInit(): void {}

  public getTasksWithAnUpcomingDate(idUser: string): void {
    this.taskService.getAllTasksFromAnUser(idUser).subscribe((task) => {
      this.tasks = task;
    });
    this.tasks.sort(
      (a, b) => (new Date(a.fechafin) as any) - (new Date(b.fechafin) as any)
    );
  }
}
