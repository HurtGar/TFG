import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { BlocksComponent } from './components/blocks/blocks.component';
import { BlockDetailComponent } from './components/blocks/containers/block-detail/block-detail.component';
import { BlockFormComponent } from './components/blocks/containers/block-form/block-form.component';
import { BlockListComponent } from './components/blocks/containers/block-list/block-list.component';
import { HomeComponent } from './components/home/home.component';
import { UpdateProjectFormComponent } from './components/projects/components/update-project-form/update-form.component';
import { ProjectDetailComponent } from './components/projects/containers/project-detail/project-detail.component';
import { ProjectFormComponent } from './components/projects/containers/project-form/project-form.component';
import { ProjectsListComponent } from './components/projects/containers/projects-list/projects-list.component';
import { NewTaskFormComponent } from './components/tasks/components/new-task-form/new-task-form.component';
import { TaskDetailComponent } from './components/tasks/containers/task-detail/task-detail.component';
import { TaskFormComponent } from './components/tasks/containers/task-form/task-form.component';
import { TaskListComponent } from './components/tasks/containers/task-list/task-list.component';
import { TasksComponent } from './components/tasks/tasks.component';

export const APP_ROUTES: Routes = [
  { path: 'home/:idUser', component: HomeComponent },
  { path: 'projects/user/:idUsuario', component: ProjectsListComponent },
  {
    path: 'projects/user/:idUser/:idProject',
    component: ProjectDetailComponent,
  },
  {
    path: 'projects/new-project',
    component: ProjectFormComponent,
  },
  {
    path: 'projects/update/:idProject',
    component: UpdateProjectFormComponent,
  },
  { path: 'blocks', component: BlocksComponent },
  { path: 'blocks/new-block', component: BlockFormComponent },
  { path: 'blocks/:idBlock/user/:idUser', component: BlockDetailComponent },
  { path: 'blocks/user/:idUsuario', component: BlockListComponent},
  { path: 'task', component: TasksComponent },
  { path: 'task/new-task', component: TaskFormComponent },
  { path: 'task/user/:idUser', component: TaskListComponent },
  { path: 'task/:idTask/user/:idUser', component: TaskDetailComponent },
  { path: '**', pathMatch: 'full', redirectTo: 'home' },
];

@NgModule({
  imports: [RouterModule.forRoot(APP_ROUTES)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
