import { Component } from '@angular/core';
import { Notebook } from './notebook';
import { Page } from './page';
import { NoteService } from './note.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  notebooks: Notebook[] = []

  selectedNotebook: Notebook;
  selectedPage: Page;

  constructor(private server: NoteService) {
    if (this.server.loggedIn())
      this.fetchNotebooks()
    else {
      let cred = prompt('user:password').split(':')
      this.server.login(cred[0], cred[1])
        .subscribe(() => this.fetchNotebooks())
    }
  }

  fetchNotebooks() {
    this.server.getMyNotebooks().subscribe(data => this.notebooks = data)
  }

  onSelect(notebook: Notebook) {
    this.server.getPagesForNotebook(notebook).subscribe(pages => {
      notebook.pages = pages;
      this.selectedNotebook = notebook;
      this.selectedPage = null;
    })
  }

  addNotebook() {
    let title = prompt('Title?')
    if (!title)
      return
    this.server.createNotebook(title).subscribe(notebook => {
      this.notebooks.push(notebook)
    })
  }

  addPage() {
    let title = prompt('Title?')
    if (!title)
      return
    this.server.createPage(title, this.selectedNotebook).subscribe(page => {
      this.selectedNotebook.pages.push(page)
    })
  }
}
