import { Component, Input, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Block } from 'src/app/models/block.model';
import { User } from 'src/app/models/user.model';
import { BlockService } from 'src/app/services/block.service';
import { ProjectsService } from 'src/app/services/projects.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-block-view',
  templateUrl: './block-view.component.html',
  styleUrls: ['./block-view.component.scss'],
})
export class BlockViewComponent implements OnInit {
  @Input() block: Block;
  horasactuales: number;
  horasestimacion: number;
  userId: string;
  users: User[];
  usersToAssign: User[];
  idusuario;
  permissions = '';
  constructor(
    private blockService: BlockService,
    private projectService: ProjectsService,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.getAllBlockHours(this.block.idbloque.toString());
    this.getUsersAssigned(this.block.idbloque.toString());
    this.userId = localStorage.getItem('userId');
    this.getUsersForThisBlockFromAProject();
    this.permissions = localStorage.getItem('permission');
  }

  deleteBlock(idbloque): void {
    this.blockService.deleteBlock(this.block.idbloque).subscribe(
      (b: Block) => {
        this.router.navigate(['blocks/user/', this.userId]);
      },
      (error: any) => {
        Swal.fire({
          icon: 'error',
          text:
            'Este bloque tiene tareas asociadas. No se puede borrar. Borre las tareas asociadas previamente.',
        });
      }
    );
  }

  getAllBlockHours(idBlock: string): void {
    this.blockService.getTotalBlockHours(idBlock).subscribe((t: any) => {
      this.horasestimacion = t.horasestimacion;
      this.horasactuales = t.horasactuales;
    });
  }

  currentHours(horasActu: number, horasEsti: number): string {
    const hours = (horasActu * 100) / horasEsti;

    return hours.toString().concat('%');
  }

  getUsersAssigned(idBlock: string): void {
    this.blockService.getAllUsersFromABlock(idBlock).subscribe((u) => {
      this.users = u;
    });
  }

  getUsersForThisBlockFromAProject(): void {
    this.projectService
      .getAllUsersFromAProject(
        this.block.proyecto_idproyecto.idproyecto.toString()
      )
      .subscribe((u) => {
        this.usersToAssign = u;
      });
  }

  assignUser(idBlock: number): void {
    const assign = JSON.stringify({
      idbloque: idBlock,
      idusuario: this.idusuario,
    });

    this.blockService.setAssignmentBlock(assign).subscribe(
      (asig) => {
        window.location.reload();
      },
      (error: any) => {
        Swal.fire({
          icon: 'error',
          text: 'No se ha podido asignar el usuario. Inténtelo de nuevo.',
        });
      }
    );
  }

  selectUser(e): any {
    this.idusuario = e.target.value;
  }
}
