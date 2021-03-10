import { Task } from './task.model';
import { User } from './user.model';

export interface UserTask {
  id?: number;
  tareas_idtarea: Task;
  usuarios_idusuario: User;
}
