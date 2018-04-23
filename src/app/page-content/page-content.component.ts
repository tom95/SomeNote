import { Component, OnInit, Input } from '@angular/core';
import { Page } from '../page';

@Component({
  selector: 'app-page-content',
  templateUrl: './page-content.component.html',
  styleUrls: ['./page-content.component.css']
})
export class PageContentComponent implements OnInit {
  @Input () page: Page;

  constructor() { }

  ngOnInit() {
  }

}
