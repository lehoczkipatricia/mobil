import { Component, OnInit } from '@angular/core';
import { ShelterInterface } from '../shared/shelter/shelter-interface';
import { ShelterService } from '../shared/shelter/shelter.service';

@Component({
  selector: 'app-shelters',
  templateUrl: './shelters.component.html',
  styleUrls: ['./shelters.component.css']
  
})


export class SheltersComponent implements OnInit {
  zip!: number;
  shelters: ShelterInterface[] = [];
  shelters2: ShelterInterface[] = [];
  constructor(private shelt: ShelterService) { }

  ngOnInit(): void {
    this.getAllShelters();
  }

  getAllShelters() {
    this.shelt.getShelters()
      .subscribe(res => {
        this.shelters = res.data;
        this.shelters.forEach(shelter => {
          this.shelters2.push(shelter);
          // console.log(shelter);
          
        });
      })
  }

}
