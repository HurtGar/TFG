import { formatDate } from '@angular/common';
import { Component, Input, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { User } from 'src/app/models/user.model';
import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'app-user-view',
  templateUrl: './user-view.component.html',
  styleUrls: ['./user-view.component.scss'],
})
export class UserViewComponent implements OnInit {
  @Input() user: User;
  userId: string;
  data: FormGroup;

  constructor(
    private userService: UserService,
    private router: Router,
    private formBuilder: FormBuilder
  ) {
  }

  ngOnInit(): void {
    this.createForm();
    this.userId = localStorage.getItem('userId');
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

  
}
