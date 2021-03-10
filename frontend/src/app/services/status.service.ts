import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment, headers } from 'src/environments/environment';
import { Status } from 'src/app/models/status.model';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class StatusService {
  constructor(private httpClient: HttpClient) {}

  getQuery(url: string): Observable<any> {
    const statusUrl = environment.baseurl.concat(`/state/${url}`);
    return this.httpClient.get(statusUrl, { headers });
  }

  getAllStatus(): Observable<Status[]>{
    return this.getQuery(`list_states`);
  }
}
