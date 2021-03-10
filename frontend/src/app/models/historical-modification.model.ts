import { User } from './user.model';

export interface HistoricalModification {
  idhistorico?: number;
  fechahistorico: string;
  motivo: string;
  deschistoricio: string;
  usuario_idusuario: User;
}
