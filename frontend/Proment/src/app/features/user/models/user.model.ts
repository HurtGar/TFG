import {UserStatus} from './user-status.enum';

export interface User{
    id: number;
    nombre: string;
    primerApellido: string;
    segundoApellido?: string;
    telefono?: string;
    email: string;
    password: string;
    fechaRegistro: string;
    estado: UserStatus;
}