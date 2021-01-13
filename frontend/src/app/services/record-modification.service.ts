import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment, headers } from 'src/environments/environment';
import { Observable } from 'rxjs';
import { Record } from '../models/record.model';
import { ProjectRecord } from '../models/project-record.model';

@Injectable({
  providedIn: 'root',
})
export class RecordModificationService {
  constructor(private http: HttpClient) {
    console.log('Servicio RecordModification listo para usarse');
  }

  getQuery(url: string): Observable<any> {
    const projectUrl = environment.baseurl.concat(`/project/${url}`);
    return this.http.get(projectUrl, { headers });
  }

  getRecordsChangesFromProject(idProject: number): Observable<Record[]>{
    return this.getQuery(`${idProject}/last_modification`);
  }
}
