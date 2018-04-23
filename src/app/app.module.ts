import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';

import { AppComponent } from './app.component';
import { PageListComponent } from './page-list/page-list.component';
import { PageContentComponent } from './page-content/page-content.component';


@NgModule({
  declarations: [
    AppComponent,
    PageListComponent,
    PageContentComponent
  ],
  imports: [
    BrowserModule,
    FormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
