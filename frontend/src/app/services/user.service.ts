import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment, headers } from 'src/environments/environment';
import { User } from '../models/user.model';
import { UserTask } from '../models/user-task.component';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  constructor(private http: HttpClient) { }

  getQuery(url: string): Observable<any> {
    const userUrl = environment.baseurl.concat(`/users/${url}`);
    return this.http.get(userUrl, { headers });
  }

  getUsersFromApp(): Observable<User[]>{
    return this.getQuery(`list_users`);
  }
}
