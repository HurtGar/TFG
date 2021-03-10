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
    const projectUrl = environment.baseurl.concat(`/block/${url}`);
    return this.http.get(projectUrl, { headers });
  }

  getRecordsChangesFromProject(idProject: number): Observable<any> {
    return this.http.get(
      environment.baseurl.concat(`/project/${idProject}/last_modification`),
      { headers }
    );
  }
  getRecordsChangesFromBlock(idBlock: number): Observable<any> {
    return this.http.get(
      environment.baseurl.concat(`/block/${idBlock}/last_modification`),
      { headers }
    );
  }
  getRecordsChangesFromTask(idTask: number): Observable<any> {
    return this.http.get(
      environment.baseurl.concat(`/task/${idTask}/last_modification`),
      { headers }
    );
  }

  insertNewRecordModificationProject(
    changes: any,
    idProject: number
  ): Observable<any> {
    return this.http.post(
      environment.baseurl.concat(`/project/insert_record/${idProject}`),
      changes,
      { headers }
    );
  }
  insertNewRecordModificationBlock(
    changes: any,
    idBlock: number
  ): Observable<any> {
    return this.http.post(
      environment.baseurl.concat(`/block/insert_record/${idBlock}`),
      changes,
      { headers }
    );
  }
  insertNewRecordModificationTask(
    changes: any,
    idTask: number
  ): Observable<any> {
    return this.http.post(
      environment.baseurl.concat(`/task/insert_record/${idTask}`),
      changes,
      { headers }
    );
  }

}
