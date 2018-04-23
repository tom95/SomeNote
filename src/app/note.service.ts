import { Injectable } from '@angular/core'
import { HttpClient, HttpHeaders } from '@angular/common/http'
import { Page } from './page'
import { Notebook } from './notebook';

import 'rxjs/add/operator/mergeMap'

const API_ROOT = 'http://localhost:4567'

interface LoginReply {
  token: string
}

@Injectable()
export class NoteService {
  token: string = null

  constructor(private http: HttpClient) {
    this.token = localStorage.token
  }

  loggedIn() {
    return !!this.token;
  }

  login(name: string, password: string) {
    return this.http.post<LoginReply>(API_ROOT + '/login', {name, password})
      .mergeMap(data => this.saveToken(data.token))
  }

  saveToken(token: string) {
    localStorage.token = token
    this.token = token
    return token
  }

  getMyNotebooks() {
    return this.http.get<Notebook[]>(API_ROOT + '/notebook', this.httpConfig())
  }

  deleteNotebook(notebook: Notebook) {
    return this.http.delete(API_ROOT + '/notebook/' + notebook.id, this.httpConfig())
  }

  deletePage(page: Page) {
    return this.http.delete(API_ROOT + '/page/' + page.id, this.httpConfig())
  }

  getPagesForNotebook(notebook: Notebook) {
    return this.http.get<Page[]>(`${API_ROOT}/notebook/${notebook.id}/pages`, this.httpConfig())
  }

  createPage(title: string, notebook: Notebook, content='') {
    return this.http.post<Page>(API_ROOT + '/page', {notebook: notebook.id, content, title}, this.httpConfig())
  }

  createNotebook(title: string) {
    return this.http.post<Notebook>(API_ROOT + '/notebook', {title}, this.httpConfig())
  }

  updateNotebook(notebook: Notebook) {
    return this.http.put<Notebook>(API_ROOT + '/notebook/' + notebook.id, {title: notebook.title}, this.httpConfig())
  }

  updatePage(page: Page) {
    return this.http.put<Page>(`${API_ROOT}/page/${page.id}`, {title: page.title, content: page.content}, this.httpConfig())
  }

  movePage(page: Page, toNotebook: Notebook) {
    return this.http.put<Page>(`${API_ROOT}/page/${page.id}`, {notebook: toNotebook.id}, this.httpConfig())
  }

  httpConfig() {
    return {
      headers: new HttpHeaders({
        'Authorization': this.token
      })
    }
  }
}
