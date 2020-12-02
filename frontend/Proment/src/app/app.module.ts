import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ProjectComponent } from './features/project/project.component';
import { ListProjectComponent } from './features/project/containers/list-projects/list-projects.component';
import { ProjectService} from './features/project/services/project.service';
import { BlockComponent } from './features/block/block.component';
import { TaskComponent } from './features/task/task.component';
import { UserComponent } from './features/user/user.component';
import { CoreModule } from './core/core.module';

@NgModule({
  declarations: [ // Componentes que tiene nuestro programa.
    AppComponent,
    ProjectComponent,
    ListProjectComponent,
    BlockComponent,
    TaskComponent,
    UserComponent
  ],
  imports: [  //Módulos que vamos a utilizar.
    CoreModule,
    AppRoutingModule
  ],
  providers: [ProjectService],  //Para servicios.
  bootstrap: [AppComponent] //Por donde vamos a iniciar el proyecto.
})
export class AppModule { }
