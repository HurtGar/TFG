import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment, headers } from 'src/environments/environment';
import { UserLogin } from '../models/user-login.model';
import { map } from 'rxjs/operators';

@Injectable({
  providedIn: 'root',
})
export class AuthenticationService {
  userToken: string;
  constructor(private http: HttpClient) {}

  getToken(credentials: UserLogin): any {
    return this.http
      .post(environment.baseurl.concat(`/get_token`), credentials, { headers })
      .pipe(
        map((resp) => {
          const tok = 'token';
          const userId = 'userId';
          const superuser = 'superuser';
          const roles = 'roles';
          const permission = 'permission';

          this.saveToken(resp[tok], resp[userId], resp[superuser], resp[roles], resp[permission]);
          return resp;
        })
      );
  }

  deleteToken(): any {
    localStorage.clear();
  }

  private saveToken(
    userToken: string,
    userId: string,
    superuser: boolean,
    rol: string,
    permission: string
  ): any {
    this.userToken = userToken;
    localStorage.setItem('token', userToken);
    localStorage.setItem('userId', userId);
    localStorage.setItem('superuser', superuser.toString());
    localStorage.setItem('roles', rol);
    localStorage.setItem('permission', permission);

    // Expiración token.
    const today = new Date();
    today.setSeconds(3600);
    localStorage.setItem('expires', today.getTime().toString());
  }

  readToken(): any {
    if (localStorage.getItem('token')) {
      this.userToken = localStorage.getItem('token');
    } else {
      this.userToken = '';
    }
  }

  // Método para el GUARD
  isAuthenticate(): boolean {
    if (this.userToken != null || localStorage.getItem('token') != null) {
      return true;
    }
    return this.expiredDate(Number(localStorage.getItem('expires')));
  }

  public expiredDate(expires: number): boolean {
    const expiresDate = new Date();
    expiresDate.setTime(expires);

    if (expiresDate > new Date()) {
      return true;
    } else {
      return false;
    }
  }
}
