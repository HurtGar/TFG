import { Project } from './project.model';
import { Record } from './record.model';

export interface ProjectRecord {
  historialModificaciones_idhistorial: Record;
  id: number;
  proyectos_idproyecto: Project;
}
