import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService } from '../shared/auth.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {

  registerForm !: FormGroup

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
    let email = this.registerForm.value.email;
    let user = this.registerForm.value.user;
    let pass = this.registerForm.value.pass;
    let pass2 = this.registerForm.value.pass2;
    let birth = this.registerForm.value.birth;

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
  logpage(){
    this.router.navigate(['main']);
  }
}