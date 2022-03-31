import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
    host = 'http://192.168.0.53:8000/api/';
    constructor(
      private http: HttpClient,
      private router: Router
      ) { }

      register(user: string, pass: string, pass2: string, email: string, birth: string) {

        let authData = {
          user: user,
          email: email,
          password: pass,
          confirm_password: pass2,
          birth: birth
        }
        let data = JSON.stringify(authData);

        let headerObj = new HttpHeaders({
          'Content-Type': 'application/json'
        });

        let header = {
          headers: headerObj
        }

        let endpoint = 'register';
        let url = this.host + endpoint;
        return this.http.post<any>(url, data, header);
      }


    login(user: string, password: string) {
      console.log(user)
      console.log(password)

      let authData = {
        user: user,
        password: password
      }
      let data = JSON.stringify(authData);

      let headerObj = new HttpHeaders({
        'Content-Type': 'application/json'
      });

      let header = {
        headers: headerObj
      }

      let endpoint = 'login';
      let url = this.host + endpoint;
      return this.http.post<any>(url, data, header);
    }

    isLoggedIn(){
      if(localStorage.getItem('currentUser') === null){
        return false;
      }
      let data:any = localStorage.getItem('currentUser');
      let currentUser = JSON.parse(data);
      let token = currentUser.token;
      return token;
    }

    logout(){
      if(localStorage.getItem('currentUser') === null){
        return;
      }
      let data:any = localStorage.getItem('currentUser');
      console.log(data);
      localStorage.removeItem('currentUser');
      let currentUser = JSON.parse(data);
      console.log(data);
      let token = currentUser.token;

      let headerObj = new HttpHeaders({
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + token
      });
      let httpOption = {
        headers: headerObj
      };
      let endpoint = 'logout';
      let url = this.host + endpoint;

      return this.http.post<any>(url, '', httpOption)
      .subscribe(res => {
        console.log(res);
        this.router.navigate(['main']);
      })
    }
    isAdmin(){
      let data:any = localStorage.getItem('currentUser');
      let currentUser = JSON.parse(data);
      // console.log(currentUser.admin);
    }
  }

  

