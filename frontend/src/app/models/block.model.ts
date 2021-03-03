import { Project } from './project.model';

export interface Block{
    idbloque?: number;
    nombrebloque: string;
    descbloque?: string;
    iniciobloque?: string;
    finbloque?: string;
    fechacreacion: string;
    proyecto_idproyecto: Project;
}