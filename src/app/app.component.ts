import { Component } from '@angular/core';
import { NOTEBOOKS } from './mock-notebooks';
import { Notebook } from './notebook';
import { Page } from './page';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'Notebook';
  notebooks = NOTEBOOKS;

  selectedNotebook: Notebook;
  selectedPage: Page;

  onSelect(notebook: Notebook) {
    this.selectedNotebook = notebook;
    this.selectedPage = null;
  }
}
