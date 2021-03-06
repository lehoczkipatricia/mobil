import { NgModule, CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { MainComponent } from './main/main.component';
import { NopageComponent } from './nopage/nopage.component';
import { CatsComponent } from './cats/cats.component';
import { DogsComponent } from './dogs/dogs.component';
import { ToknowComponent } from './toknow/toknow.component';
import { SheltersComponent } from './shelters/shelters.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';


import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { AdminComponent } from './admin/admin.component';
import { RegisterComponent } from './register/register.component';
import { CriteriaComponent } from './criteria/criteria.component';
import { ZipfilterPipe } from './shared/pipe/zipfilter.pipe';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';


@NgModule({
  declarations: [
    AppComponent,
    MainComponent,
    NopageComponent,
    CatsComponent,
    DogsComponent,
    ToknowComponent,
    SheltersComponent,
    AdminComponent,
    RegisterComponent,
    CriteriaComponent,
    ZipfilterPipe
  ],
  imports: [
    HttpClientModule,
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    ReactiveFormsModule,
    FormsModule,
    NgbModule

  ],
  providers: [],
  bootstrap: [AppComponent],
  schemas: [CUSTOM_ELEMENTS_SCHEMA]

})
export class AppModule { }
