import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

// Services
import { ProjectsService } from './services/projects.service';
import { BlockService } from './services/block.service';
import { TaskService } from './services/task.service';
import { StatusService } from './services/status.service';
import { PriorityService } from './services/priority.service';
import { UserService } from './services/user.service';
import { AuthenticationService } from './services/authentication.service';
// Components
import { NavbarComponent } from './components/shared/navbar/navbar.component';
import { SidenavComponent } from './components/shared/sidenav/sidenav.component';
import { FooterComponent } from './components/shared/footer/footer.component';
import { ProjectsComponent } from './components/projects/projects.component';
import { BlocksComponent } from './components/blocks/blocks.component';
import { TasksComponent } from './components/tasks/tasks.component';
import { HomeComponent } from './components/home/home.component';
import { ProjectRowComponent } from './components/projects/components/project-row/project-row.component';
import { ProjectsListComponent } from './components/projects/containers/projects-list/projects-list.component';
import { ProjectDetailComponent } from './components/projects/containers/project-detail/project-detail.component';
import { ProjectViewComponent } from './components/projects/components/project-view/project-view.component';
import { BlockAvailableComponent } from './components/projects/components/block-available/block-available.component';
import { TasksAvailableComponent } from './components/projects/components/tasks-available/tasks-available.component';
import { BlockDetailComponent } from './components/blocks/containers/block-detail/block-detail.component';
import { BlockViewComponent } from './components/blocks/components/block-view/block-view.component';
import { BlockListComponent } from './components/blocks/containers/block-list/block-list.component';
import { BlockRowComponent } from './components/blocks/components/block-row/block-row.component';
import { TaskListComponent } from './components/tasks/containers/task-list/task-list.component';
import { TaskDetailComponent } from './components/tasks/containers/task-detail/task-detail.component';
import { TaskRowComponent } from './components/tasks/components/task-row/task-row.component';
import { TaskViewComponent } from './components/tasks/components/task-view/task-view.component';
import { NewProjectFormComponent } from './components/projects/components/new-project-form/new-form.component';
import { UpdateProjectFormComponent } from './components/projects/components/update-project-form/update-form.component';
import { ProjectFormComponent } from './components/projects/containers/project-form/project-form.component';
import { BlockFormComponent } from './components/blocks/containers/block-form/block-form.component';
import { NewBlockFormComponent } from './components/blocks/components/new-block-form/new-block-form.component';
import { UpdateBlockFormComponent } from './components/blocks/components/update-block-form/update-block-form.component';
import { TaskFormComponent } from './components/tasks/containers/task-form/task-form.component';
import { NewTaskFormComponent } from './components/tasks/components/new-task-form/new-task-form.component';
import { UpdateTaskFormComponent } from './components/tasks/components/update-task-form/update-task-form.component';
import { RegisterHoursComponent } from './components/tasks/components/register-hours/register-hours.component';
import { ProjectHistoryComponent } from './components/projects/components/project-history/project-history.component';
import { BlockHistoryComponent } from './components/blocks/components/block-history/block-history.component';
import { TaskHistoryComponent } from './components/tasks/components/task-history/task-history.component';
import { RegistrationComponent } from './components/registration/registration.component';
import { LoginComponent } from './components/login/login.component';
import { RegisterService } from './services/register-service.service';

@NgModule({
  declarations: [
    AppComponent,
    NavbarComponent,
    SidenavComponent,
    FooterComponent,
    ProjectsComponent,
    BlocksComponent,
    TasksComponent,
    HomeComponent,
    ProjectRowComponent,
    ProjectsListComponent,
    ProjectDetailComponent,
    ProjectViewComponent,
    BlockAvailableComponent,
    TasksAvailableComponent,
    BlockDetailComponent,
    BlockViewComponent,
    BlockListComponent,
    BlockRowComponent,
    TaskListComponent,
    TaskDetailComponent,
    TaskRowComponent,
    TaskViewComponent,
    ProjectFormComponent,
    UpdateProjectFormComponent,
    NewProjectFormComponent,
    BlockFormComponent,
    NewBlockFormComponent,
    UpdateBlockFormComponent,
    TaskFormComponent,
    NewTaskFormComponent,
    UpdateTaskFormComponent,
    RegisterHoursComponent,
    ProjectHistoryComponent,
    BlockHistoryComponent,
    TaskHistoryComponent,
    RegistrationComponent,
    LoginComponent,
  ],
  imports: [
    FormsModule,
    BrowserModule,
    BrowserAnimationsModule,
    AppRoutingModule,
    HttpClientModule,
    ReactiveFormsModule,
  ],
  providers: [
    ProjectsService,
    BlockService,
    TaskService,
    StatusService,
    PriorityService,
    UserService,
    AuthenticationService,
    RegisterService
  ],
  bootstrap: [AppComponent],
})
export class AppModule {}
