import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment, headers } from 'src/environments/environment';
import { Block } from '../models/block.model';
import { Task } from '../models/task.model';

@Injectable({
  providedIn: 'root',
})
export class BlockService {
  constructor(private http: HttpClient) {
    console.log('Servicio bloque listo para usarse.');
  }

  getQuery(url: string): Observable<any> {
    const projectUrl = environment.baseurl.concat(`/block/${url}`);
    return this.http.get(projectUrl, { headers });
  }

  getAllTasksFromABlock(idBlock: string): Observable<Task> {
    return this.getQuery(`${idBlock}/tasks`);
  }

  getOneBlockFromAProjectAndUser(
    idBlock: string,
    idUser: string
  ): Observable<Block> {
    return this.getQuery(`${idBlock}/user/${idUser}`);
  }

  getAllBlocksFromAnUser(idUser: string): Observable<Block[]> {
    return this.getQuery(`user/${idUser}`);
  }

  lastInsertedBlock(): Observable<any>{
    return this.getQuery(`last_inserted`);
  }

  createBlock(block: any): Observable<any> {
    console.log(block);

    return this.http.post(environment.baseurl.concat(`/block/create`), block, {
      headers,
    });
  }

  updateBlock(block: any, idblock: number): Observable<any> {
    return this.http.put(
      environment.baseurl.concat(`/block/update/${idblock}`),
      block,
      { headers }
    );
  }

  deleteBlock(idBlock: number): Observable<any> {
    const blockUrl = environment.baseurl.concat(
      `/block/delete/${idBlock}`
    );
    return this.http.delete(blockUrl, { headers });
  }
}
