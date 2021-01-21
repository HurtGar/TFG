import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { HttpClientModule } from '@angular/common/http';

// Services
import { ProjectsService } from './services/projects.service';

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
    BlockRowComponent
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    AppRoutingModule,
    HttpClientModule,
  ],
  providers: [ProjectsService],
  bootstrap: [AppComponent],
})
export class AppModule {}
