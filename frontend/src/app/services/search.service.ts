import { Injectable } from '@angular/core';
import { Block } from '../models/block.model';
import { Project } from '../models/project.model';
import { Task } from '../models/task.model';
import { BlockService } from './block.service';
import { ProjectsService } from './projects.service';
import { TaskService } from './task.service';

@Injectable({
  providedIn: 'root',
})
export class SearchService {
  objectsToReturn: any[] = [];
  projects: Project[] = [];
  blocks: Block[] = [];
  tasks: Task[] = [];
  userId = localStorage.getItem('userId');
  wordToSearch: string;
  constructor(
    private projectService: ProjectsService,
    private blockService: BlockService,
    private taskService: TaskService
  ) {}

  getAllProjectsFromAnUser(idUser) {
    this.projectService.getAllProjectFromAnUser(idUser).subscribe((p) => {
      this.projects = p;
    });
  }
  getAllBlocksFromAnUser(idUser) {
    this.blockService.getAllBlocksFromAnUser(idUser).subscribe((b) => {
      this.blocks = b;
    });
  }
  getAllTasksFromAnUser(idUser) {
    this.taskService.getAllTasksFromAnUser(idUser).subscribe((t) => {
      this.tasks = t;
    });
  }

  searchInApp(
    toSearch: string,
    projects: Project[],
    blocks: Block[],
    tasks: Task[]
  ): any {
    console.log('Entro en el servicio');

    let objects: any[] = [];
    if (toSearch) {
      toSearch = toSearch.toLowerCase();
    }
    console.log(this.projects);

    for (let i = 0; i < projects.length; ++i) {
      console.log('entro en proyectos');
      if (projects[i].nombreproyecto.toLowerCase().indexOf(toSearch) >= 0) {
        console.log(projects[i].nombreproyecto.toLowerCase());

        objects.push(projects[i]);
      }
    }
    for (const b of this.blocks) {
      console.log('entro en bloques');

      if (b.nombrebloque.toLowerCase().indexOf(toSearch) >= 0) {
        objects.push(b);
      }
    }
    for (const t of this.tasks) {
      console.log('entro en tareas');

      if (t.nombretarea.toLowerCase().indexOf(toSearch) >= 0) {
        objects.push(t);
      }
    }
  }
}
