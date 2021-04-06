import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { BlocksComponent } from './components/blocks/blocks.component';
import { BlockDetailComponent } from './components/blocks/containers/block-detail/block-detail.component';
import { BlockFormComponent } from './components/blocks/containers/block-form/block-form.component';
import { BlockListComponent } from './components/blocks/containers/block-list/block-list.component';
import { HomeComponent } from './components/home/home.component';
import { LoginComponent } from './components/login/login.component';
import { UpdateProjectFormComponent } from './components/projects/components/update-project-form/update-form.component';
import { ProjectDetailComponent } from './components/projects/containers/project-detail/project-detail.component';
import { ProjectFormComponent } from './components/projects/containers/project-form/project-form.component';
import { ProjectsListComponent } from './components/projects/containers/projects-list/projects-list.component';
import { RegistrationComponent } from './components/registration/registration.component';
import { NewTaskFormComponent } from './components/tasks/components/new-task-form/new-task-form.component';
import { TaskDetailComponent } from './components/tasks/containers/task-detail/task-detail.component';
import { TaskFormComponent } from './components/tasks/containers/task-form/task-form.component';
import { TaskListComponent } from './components/tasks/containers/task-list/task-list.component';
import { TasksComponent } from './components/tasks/tasks.component';
import { AuthGuard } from './guards/auth.guard';

export const APP_ROUTES: Routes = [
  { path: 'login', component: LoginComponent },
  { path: 'registration', component: RegistrationComponent },
  { path: 'home/:idUser', component: HomeComponent, canActivate: [AuthGuard] },
  {
    path: 'projects/user/:idUsuario',
    component: ProjectsListComponent,
    canActivate: [AuthGuard],
  },
  {
    path: 'projects/user/:idUser/:idProject',
    component: ProjectDetailComponent,
    canActivate: [AuthGuard],
  },
  {
    path: 'projects/new-project',
    component: ProjectFormComponent,
    canActivate: [AuthGuard],
  },
  {
    path: 'projects/update/:idProject',
    component: UpdateProjectFormComponent,
    canActivate: [AuthGuard],
  },
  { path: 'blocks', component: BlocksComponent, canActivate: [AuthGuard] },
  {
    path: 'blocks/new-block',
    component: BlockFormComponent,
    canActivate: [AuthGuard],
  },
  {
    path: 'blocks/:idBlock/user/:idUser',
    component: BlockDetailComponent,
    canActivate: [AuthGuard],
  },
  {
    path: 'blocks/user/:idUsuario',
    component: BlockListComponent,
    canActivate: [AuthGuard],
  },
  { path: 'task', component: TasksComponent, canActivate: [AuthGuard] },
  {
    path: 'task/new-task',
    component: TaskFormComponent,
    canActivate: [AuthGuard],
  },
  {
    path: 'task/user/:idUser',
    component: TaskListComponent,
    canActivate: [AuthGuard],
  },
  {
    path: 'task/:idTask/user/:idUser',
    component: TaskDetailComponent,
    canActivate: [AuthGuard],
  },
  { path: '**', pathMatch: 'full', redirectTo: 'login' },
];

@NgModule({
  imports: [RouterModule.forRoot(APP_ROUTES)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
