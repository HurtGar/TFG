import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment, headers } from 'src/environments/environment';
import { Project } from '../models/project.model';
import { Block } from '../models/block.model';
import { Task } from '../models/task.model';
import { User } from '../models/user.model';

@Injectable({
  providedIn: 'root',
})
export class ProjectsService {
  constructor(private http: HttpClient) {}

  getQuery(url: string): Observable<any> {
    const projectUrl = environment.baseurl.concat(`/project/${url}`);
    return this.http.get(projectUrl, { headers });
  }

  getAllUsers(): Observable<User[]> {
    return this.getQuery(`users`);
  }

  getAllProjectFromAnUser(idUsuario: string): Observable<Project[]> {
    return this.getQuery(`user/${idUsuario}`);
  }

  getAllUsersFromAProject(idProject: string): Observable<User[]> {
    return this.getQuery(`${idProject}/list-users`);
  }

  getOneProjectFromAnUser(
    idUser: string,
    idProject: string
  ): Observable<Project> {
    return this.getQuery(`user/${idUser}/${idProject}`);
  }

  getAllBlocksFromAProject(
    idUser: string,
    idProject: string
  ): Observable<Block> {
    return this.getQuery(`${idProject}/user/${idUser}/blocks`);
  }

  getAllBlocksFromAProjectForTasks(
    idUser: string,
    idProject: string
  ): Observable<Block[]> {
    return this.getQuery(`${idProject}/user/${idUser}/blocks`);
  }

  getAllTasksFromAProject(idProject: string): Observable<Task> {
    return this.getQuery(`${idProject}/tasks`);
  }

  lastInsertedProject(): Observable<any> {
    return this.getQuery(`last_inserted`);
  }

  createProject(project: any): Observable<any> {
    return this.http.post(
      environment.baseurl.concat(`/project/create`),
      project,
      { headers }
    );
  }

  updateProject(project: any, idproject: number): Observable<any> {
    return this.http.put(
      environment.baseurl.concat(`/project/update/${idproject}`),
      project,
      { headers }
    );
  }

  deleteProject(idProject: number): Observable<any> {
    const projectUrl = environment.baseurl.concat(
      `/project/delete/${idProject}`
    );
    return this.http.delete(projectUrl, { headers });
  }

  getTotalProjectHours(idProject: string): Observable<any> {
    return this.getQuery(`${idProject}/hours`);
  }

  setAssignmentProject(assign: any): Observable<any> {
    return this.http.post(
      environment.baseurl.concat(`/project/assignment`),
      assign,
      { headers }
    );
  }

  deleteProjectAssignment(idProject: number): Observable<any> {
    const taskUrl = environment.baseurl.concat(
      `/project/delete/assignment/${idProject}`
    );
    return this.http.delete(taskUrl, { headers });
  }
}
