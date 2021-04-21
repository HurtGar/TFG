import { Component, Input, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Task } from 'src/app/models/task.model';
import { TaskService } from 'src/app/services/task.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-register-hours',
  templateUrl: './register-hours.component.html',
  styleUrls: ['./register-hours.component.scss'],
})
export class RegisterHoursComponent implements OnInit {
  @Input() task: Task;
  data: FormGroup;
  error: any = { isError: false };
  constructor(
    private taskService: TaskService,
    private formBuilder: FormBuilder
  ) {
    this.createForm();
  }

  ngOnInit(): void {}

  get horasEstimacion(): any {
    return (
      this.data.get('horasestimacion').invalid &&
      this.data.get('horasestimacion').touched
    );
  }

  createForm(): any {
    this.data = this.formBuilder.group({
      horasestimacion: ['', Validators.required],
      horasactuales: [''],
      horasregistradas: [''],
    });
    this.data.get('horasregistradas').disable();
  }

  loadHours(): any {
    this.data.setValue({
      horasregistradas: this.task.horasactuales,
      horasestimacion: this.task.horasestimacion,
      horasactuales: this.task.horasactuales,
    });
  }

  registerHours(): any {
    if (this.data.invalid) {
      return Object.values(this.data.controls).forEach((control) => {
        control.markAsTouched();
      });
    }

    const formObject = this.data.getRawValue();
    JSON.stringify(formObject);

    this.taskService.registerTaskHours(this.task.idtarea, formObject).subscribe(
      (t: Task) => {
        window.location.reload();
      },
      (error: any) => {
        Swal.fire({
          icon: 'error',
          text: 'Error al registrar horas. Inténtelo de nuevo.',
        });
      }
    );
  }
}
