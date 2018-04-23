import { Component, OnInit, Output, EventEmitter, Input } from '@angular/core';
import { Notebook } from '../notebook';
import { Page } from '../page';

@Component({
  selector: 'app-page-list',
  templateUrl: './page-list.component.html',
  styleUrls: ['./page-list.component.css']
})
export class PageListComponent implements OnInit {
  @Input () notebook: Notebook;
  @Output () selectedPage = new EventEmitter<Page>();

  mySelectedPage: Page;

  onSelect(page: Page) {
    this.mySelectedPage = page;
    this.selectedPage.emit(page);
  }

  constructor() { }

  ngOnInit() {
  }

}
