import { ElementRef, ViewChild, OnChanges, Component, OnInit, Input } from '@angular/core'
import { Subject } from 'rxjs/Subject'
import { Page } from '../page'
import { NoteService } from '../note.service'

import 'rxjs/add/operator/debounceTime'
import 'rxjs/add/operator/distinctUntilChanged'
import 'rxjs/add/operator/mergeMap'
import 'rxjs/add/operator/do'

const SAVING_TIMEOUT = 2000

@Component({
  selector: 'app-page-content',
  templateUrl: './page-content.component.html',
  styleUrls: ['./page-content.component.css']
})
export class PageContentComponent implements OnInit, OnChanges {
  @Input () page: Page;
  @ViewChild('content') contentBox: ElementRef;

  saved = true
  contentChanged = new Subject<string>()

  constructor(private server: NoteService) { }

  ngOnInit() {
    this.contentChanged
      .do(() => this.saved = false)
      .debounceTime(SAVING_TIMEOUT)
      .distinctUntilChanged()
      .mergeMap(save => this.server.updatePage(this.page))
      .subscribe(() => this.saved = true)
  }

  changeContent() {
    // uses the value saved within the object
    this.contentChanged.next('')
  }

  ngOnChanges() {
    if (!this.contentBox)
      return
    this.contentBox.nativeElement.style.height = 0
    this.contentBox.nativeElement.clientHeight
    this.contentBox.nativeElement.style.height = this.contentBox.nativeElement.scrollHeight + 2 + 'px'
  }
}
