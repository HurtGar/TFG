import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment, headers } from 'src/environments/environment';
import { Task } from '../models/task.model';
import { UserTask } from '../models/user-task.component';
import { User } from '../models/user.model';

@Injectable({
  providedIn: 'root',
})
export class TaskService {
  constructor(private http: HttpClient) {}

  getQuery(url: string): Observable<any> {
    const projectUrl = environment.baseurl.concat(`/task/${url}`);
    return this.http.get(projectUrl, { headers });
  }

  getAllTasksFromAnUser(idUser: string): Observable<Task[]> {
    return this.getQuery(`user/${idUser}`);
  }

  getOneTaskFromAnUser(idUser: string, idTask: string): Observable<Task> {
    return this.getQuery(`${idTask}/user/${idUser}`);
  }

  getAllUsersFromATask(idTask: string): Observable<User[]> {
    return this.getQuery(`${idTask}/list-users`);
  }

  createTask(task: any): Observable<any> {
    return this.http.post(environment.baseurl.concat(`/task/create`), task, {
      headers,
    });
  }

  updateTask(task: any, idTask: number): Observable<any> {
    return this.http.put(
      environment.baseurl.concat(`/task/update/${idTask}`),
      task,
      { headers }
    );
  }

  lastInsertedTask(): Observable<any> {
    return this.getQuery(`last_inserted`);
  }

  deleteTask(idTask: number): Observable<any> {
    const taskUrl = environment.baseurl.concat(`/task/delete/${idTask}`);
    return this.http.delete(taskUrl, { headers });
  }

  createAssignment(userTask: any): Observable<any> {
    return this.http.post(
      environment.baseurl.concat(`/task/assignment`),
      userTask,
      {
        headers,
      }
    );
  }

  deleteTaskAssignment(idTask: number): Observable<any> {
    const taskUrl = environment.baseurl.concat(
      `/task/delete/assignment/${idTask}`
    );
    return this.http.delete(taskUrl, { headers });
  }

  registerTaskHours(idTask: number, json: any): Observable<any> {
    return this.http.post(
      environment.baseurl.concat(`/task/register_hours/${idTask}`),
      json,
      { headers }
    );
  }

  setAssignmentTask(assign: any): Observable<any> {
    return this.http.post(
      environment.baseurl.concat(`/task/assignment`),
      assign,
      { headers }
    );
  }
}
