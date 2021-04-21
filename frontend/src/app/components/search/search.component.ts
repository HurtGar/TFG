import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Block } from 'src/app/models/block.model';
import { Project } from 'src/app/models/project.model';
import { Task } from 'src/app/models/task.model';
import { BlockService } from 'src/app/services/block.service';
import { ProjectsService } from 'src/app/services/projects.service';
import { TaskService } from 'src/app/services/task.service';

@Component({
  selector: 'app-search',
  templateUrl: './search.component.html',
  styleUrls: ['./search.component.scss'],
})
export class SearchComponent implements OnInit {
  projectsToReturn: any[] = [];
  blocksToReturn: any[] = [];
  tasksToReturn: any[] = [];
  projects: Project[] = [];
  blocks: Block[] = [];
  tasks: Task[] = [];
  userId;
  termino: string;
  constructor(
    private projectService: ProjectsService,
    private blockService: BlockService,
    private taskService: TaskService,
    private activatedRouter: ActivatedRoute
  ) {
    this.activatedRouter.params.subscribe((params) => {
      this.termino = params.search;
    });
    this.userId = localStorage.getItem('userId');
    this.getAllProjectsFromAnUser(this.userId);
    this.getAllBlocksFromAnUser(this.userId);
    this.getAllTasksFromAnUser(this.userId);
  }

  ngOnInit(): void {}

  getAllProjectsFromAnUser(idUser) {
    this.projectService.getAllProjectFromAnUser(idUser).subscribe((p) => {
      this.projects = p;
      for (let i = 0; i < this.projects.length; ++i) {
        if (
          this.projects[i].nombreproyecto.toLowerCase().indexOf(this.termino) >=
          0
        ) {
          this.projectsToReturn.push(this.projects[i]);
        }
      }
    });
  }
  getAllBlocksFromAnUser(idUser) {
    this.blockService.getAllBlocksFromAnUser(idUser).subscribe((b) => {
      this.blocks = b;
      for (let i = 0; i < this.blocks.length; ++i) {
        if (
          this.blocks[i].nombrebloque.toLowerCase().indexOf(this.termino) >= 0
        ) {
          this.blocksToReturn.push(this.blocks[i]);
        }
      }
    });
  }
  getAllTasksFromAnUser(idUser) {
    this.taskService.getAllTasksFromAnUser(idUser).subscribe((t) => {
      this.tasks = t;
      for (let i = 0; i < this.tasks.length; ++i) {
        if (
          this.tasks[i].nombretarea.toLowerCase().indexOf(this.termino) >= 0
        ) {
          this.tasksToReturn.push(this.tasks[i]);
        }
      }
    });
  }
}
