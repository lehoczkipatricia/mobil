import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class ShelterService {

  host = 'http://192.168.0.53:8000/api/';

  constructor(private http: HttpClient, private router: Router) {

  }

  getShelters() {
    let endpoint = 'shelters';
    return this.http.get<any>(this.host + endpoint)
  }

}
