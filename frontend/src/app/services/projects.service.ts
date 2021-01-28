import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment, headers} from 'src/environments/environment';
import { Project } from '../models/project.model';
import { Block } from '../models/block.model';
import { Task } from '../models/task.model';



@Injectable({
  providedIn: 'root',
})
export class ProjectsService {
  constructor(private http: HttpClient) {
    console.log('Servicio listo para usarse.');
  }

  getQuery(url: string): Observable<any> {
    const projectUrl = environment.baseurl.concat(`/project/${url}`);
    return this.http.get(projectUrl, { headers });
  }

  getAllProjectFromAnUser(idUsuario: string): Observable<Project[]> {
    return this.getQuery(`user/${idUsuario}`);
  }

  getOneProjectFromAnUser(idUser: string, idProject: string): Observable<Project>{
    return this.getQuery(`user/${idUser}/${idProject}`);
  }

  getAllBlocksFromAProject(idUser: string, idProject: string): Observable<Block>{
    return this.getQuery(`${idProject}/user/${idUser}/blocks`);
  }

  getAllTasksFromAProject(idProject: string): Observable<Task>{
    return this.getQuery(`${idProject}/tasks`);
  }

  deleteProject(idProject: string): void{
    const projectUrl = environment.baseurl.concat(`/project/delete/${idProject}`);
    this.http.delete(projectUrl, {headers});
  }
}
