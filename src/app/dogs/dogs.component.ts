import { Component, OnInit } from '@angular/core';
import { PetsService } from '../shared/pet/pets.service';
import { Pet } from '../shared/pet/pet';
@Component({
  selector: 'app-dogs',
  templateUrl: './dogs.component.html',
  styleUrls: ['./dogs.component.css']
})
export class DogsComponent implements OnInit {
  pets: Pet[] = [];
  dogs: Pet[] = [];
  constructor(private petsService: PetsService) {}

  ngOnInit() {
    this.getAllPets();
  }

  getAllPets() {
    this.petsService.getPets()
    .subscribe( res => {
      this.pets = res.data;
      this.pets.forEach(pet => {
        if(pet.sname == "kutya" && pet.adopted == false){
          console.log(pet);
          this.dogs.push(pet);
        }
      });
    })
  }
}
