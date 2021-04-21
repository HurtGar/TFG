import { formatDate } from '@angular/common';
import { Component, Input, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { User } from 'src/app/models/user.model';
import { UserService } from 'src/app/services/user.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-admin-view',
  templateUrl: './admin-view.component.html',
  styleUrls: ['./admin-view.component.scss'],
})
export class AdminViewComponent implements OnInit {
  @Input() user: User;
  data: FormGroup;

  constructor(
    private userService: UserService,
    private router: Router,
    private formBuilder: FormBuilder
  ) {
    this.createForm();
  }

  ngOnInit(): void {
    this.loadUser(this.user);
  }

  createForm(): any {
    this.data = this.formBuilder.group({
      nombre: ['', [Validators.required]],
      primerapellido: ['', [Validators.required]],
      segundoapellido: [''],
      telefono: [''],
      email: ['', [Validators.required]],
      fecharegistro: ['', [Validators.required]],
    });
  }

  loadUser(user: User): any {
    this.data = this.formBuilder.group({
      nombre: user.nombre,
      primerapellido: user.primerapellido,
      segundoapellido: user.segundoapellido,
      telefono: user.telefono,
      email: user.email,
      fecharegistro: formatDate(user.fecharegistro, 'dd-MM-yyyy', 'en'),
    });
    this.data.disable();
  }

  deleteUser(idUser): void {
    this.userService.deleteUser(idUser).subscribe(
      (u: User) => {
        this.router.navigate(['administration-panel']);
      },
      (error: any) => {
        Swal.fire({
          icon: 'error',
          text: 'No se ha podido eliminar el usuario',
        });
      }
    );
  }
}
