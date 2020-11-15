import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ProjectComponent } from './features/project/project.component';
import { ListProjectComponent } from './features/project/containers/list-projects/list-projects.component';
import { ProjectService} from './features/project/services/project.service';
import {HttpClientModule, HttpClient} from '@angular/common/http';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';
import { BlockComponent } from './features/block/block.component';
import { TaskComponent } from './features/task/task.component';
import { UserComponent } from './features/user/user.component';

@NgModule({
  declarations: [
    AppComponent,
    ProjectComponent,
    ListProjectComponent,
    BlockComponent,
    TaskComponent,
    UserComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule
  ],
  providers: [ProjectService],
  bootstrap: [AppComponent]
})
export class AppModule { }
