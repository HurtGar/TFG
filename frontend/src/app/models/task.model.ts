import { Block } from './block.model';
import { Priority } from './priority.model';
import { Project } from './project.model';
import { Status } from './status.model';

export interface Task{
    idtarea?: number;
    nombretarea: string;
    desctarea?: string;
    fechacreacion: string;
    fechainicio?: string;
    fechafin?: string;
    fechaactualizacion: string;
    horasestimacion?: number;
    horasactuales?: number;
    horasrestantes?: number;
    bloques_idbloque: Block;
    estados_idestado?: Status;
    prioridades_idprioridad?: Priority;
    proyectos_idproyecto: Project;
}
