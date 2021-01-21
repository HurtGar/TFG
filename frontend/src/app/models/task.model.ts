import { Block } from "./block.model";
import { Project } from "./project.model";

export interface Task{
    idtarea: number;
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
    estados_idestado?: number;
    prioridad_idprioridad?: number;
    proyectos_idproyecto: Project;
}