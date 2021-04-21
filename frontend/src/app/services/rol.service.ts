import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment, headers } from 'src/environments/environment';
import { Rol } from '../models/rol.model';

@Injectable({
  providedIn: 'root',
})
export class RolService {
  constructor(private http: HttpClient) {}

  getQuery(url: string): Observable<any> {
    const statusUrl = environment.baseurl.concat(`/users/${url}`);
    return this.http.get(statusUrl, { headers });
  }

  listRoles(): Observable<Rol[]>{
    return this.getQuery(`roles`);
  }
}
