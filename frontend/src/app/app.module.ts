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
    ProjectDetailComponent
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
