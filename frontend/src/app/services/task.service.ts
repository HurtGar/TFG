import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment, headers } from 'src/environments/environment';
import { Task } from '../models/task.model';

@Injectable({
  providedIn: 'root',
})
export class TaskService {
  constructor(private http: HttpClient) {
    console.log('Servicio tareas listo para usarse.');
  }

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
}
