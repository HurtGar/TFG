import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment, headers } from 'src/environments/environment';
import { Priority } from 'src/app/models/priority.model';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class PriorityService {

  constructor(private httpClient: HttpClient) { }

  getQuery(url: string): Observable<any> {
    const priorityUrl = environment.baseurl.concat(`/priority/${url}`);
    return this.httpClient.get(priorityUrl, { headers });
  }

  getAllPriorities(): Observable<Priority[]>{
    return this.getQuery(`list_priorities`);
  }
}
