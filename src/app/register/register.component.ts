import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService } from '../shared/auth/auth.service';
import {NgbDateStruct, NgbCalendar} from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {

  registerForm !: FormGroup
  model!: NgbDateStruct;
  month!:string;
  day!:string;

  constructor(
    private auth: AuthService,
    private router: Router
  ) { }

  ngOnInit(): void {
    this.registerForm = new FormGroup({

      user: new FormControl('', [Validators.required, Validators.pattern('[a-zéáűőúöüóA-ZÉÁŰŐÚÖÜÓ0-9]+')]),
      pass: new FormControl('', Validators.required),
      pass2: new FormControl('', Validators.required),
      email: new FormControl('', [Validators.required, Validators.email]),
      birth: new FormControl('', Validators.required)
    });
  }
  register(){

    if (this.model.month <10) {
      let month1 = this.model.month.toString();
      this.month = "0"+month1;
    }else{
      this.month = this.model.month.toString();
    }

    if (this.model.day<10 ) {
      let day1 = this.model.day.toString();
      this.day = "0"+day1;
    } else {
      this.day = this.model.day.toString();
    }
    let year = this.model.year.toString();

    let birth = year +"-"+ this.month +"-"+ this.day;
    let email = this.registerForm.value.email;
    let user = this.registerForm.value.user;
    let pass = this.registerForm.value.pass;
    let pass2 = this.registerForm.value.pass2;


    console.log(email, user, pass, pass2, birth)

    this.auth.register(user, pass, pass2, email, birth)
    .subscribe(res => {
      console.log(res);
      if (res.token != 0) {
        alert("Sikeres regisztráció!");
        localStorage.setItem('currentUser', 
        JSON.stringify({token: res.token, name: res.name})
        );
        this.router.navigate(['main']);
      }else{
        alert("A regisztráció sikertelen!");
      }
    })
  }

}