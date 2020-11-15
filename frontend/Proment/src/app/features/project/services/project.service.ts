import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { HttpHeaders } from '@angular/common/http';

@Injectable({
  providedIn: 'root',
})
export class ProjectService {
  readonly APIUrl = '';
  constructor(private http: HttpClient) {}

  getProjectList(): Observable<any[]> {
    return this.http.get<any[]>(
      this.APIUrl + 'http://127.0.0.1:8000/project/user/1',
      { headers: httpOptions.headers }
    );
  }
}

const httpOptions = {
  headers: new HttpHeaders({
    'Content-Type': 'application/json',
    Authorization: 'Token c79d3ee98926bd1204e67f264ee969753bd6e467',
  }),
};
