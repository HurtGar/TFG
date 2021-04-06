import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root',
})
export class RegisterService {
  constructor(private http: HttpClient) {}

  registerNewUser(user: any): Observable<any> {
    return this.http.post(environment.baseurl.concat(`/register-user`), user);
  }
}
