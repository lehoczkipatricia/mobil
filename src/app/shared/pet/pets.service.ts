import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Pet } from './pet';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';


@Injectable({
  providedIn: 'root'
})
export class PetsService {

  host = 'http://localhost:8000/api/';

  constructor(private http: HttpClient) {

   }

//   getPets(): Observable<Pet[]> {
//     let endpoint = 'pets';
//     let url = this.host + endpoint;
//     return this.http.get<Pet[]>(url);
// }

getPets() {
  let endpoint = 'pets';
    return this.http.get<any>(this.host + endpoint)
}

}
