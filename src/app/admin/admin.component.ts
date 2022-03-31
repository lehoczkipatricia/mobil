import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { Pet } from '../shared/pet/pet';
import { PetsService } from '../shared/pet/pets.service';
import { ShelterInterface } from '../shared/shelter/shelter-interface';
import { ShelterService } from '../shared/shelter/shelter.service';

@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.css']
})
export class AdminComponent implements OnInit {

  newPetForm !: FormGroup
  pets: Pet[] = [];
  cats: Pet[] = [];

  shelters: ShelterInterface[] = [];
  shelters2: ShelterInterface[] = [];

  gender2!: boolean;
  neutered2!: boolean;

  Bname: any = ["sziámi", "kuvasz"];
  bname: any;
  Gender: any = ["hím", "nőstény"];
  gender: any;
  Neutered: any = ["igen", "nem"];
  neutered: any;
  sname!: string;
  shelters_id: any;
  shelter_name!: string;

  petId!: any;
  petBName!: any;
  petPath!: any;
  petName!: any;
  petAge!: any;
  petGender!: any;
  petNeutered!: any;
  petSheltersId!: any;
  petSName!: any;

  constructor(
    private petsService: PetsService,
    private shelt: ShelterService
  ) { }


  ngOnInit(): void {
    this.getAllShelters();
    this.getAllPets();
    this.petsService.getPets();
    this.newPetForm = new FormGroup({
      name: new FormControl(''),
      bname: new FormControl(''),
      age: new FormControl(''),
      gender: new FormControl(''),
      shelters_id: new FormControl(''),
      neutered: new FormControl(''),
      adopted: new FormControl(''),
      sname: new FormControl('')
    });
  }

  getAllPets() {
    this.petsService.getPets()
      .subscribe(res => {
        this.pets = res.data;
        this.pets.forEach(pet => {
          this.cats.push(pet);
          // console.log(pet);
        });
      })
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

  changeBName(e: any) {
    this.bname?.setValue(e.target.value, {
      onlySelf: true,
    });
  }
  changeGender(e: any) {
    this.gender?.setValue(e.target.value, {
      onlySelf: true,
    });
  }
  changeNeutered(e: any) {
    this.neutered?.setValue(e.target.value, {
      onlySelf: true,
    });
  }
  changeShelter(e: any) {
    this.shelters_id?.setValue(e.target.value, {
      onlySelf: true,
    });
  }

  newPet() {
    if (this.newPetForm.value.gender === "hím") {
      this.gender2 = false;
    }
    if (this.newPetForm.value.gender === "nőstény") {
      this.gender2 = true;
    }
    if (this.newPetForm.value.bname === "kuvasz") {
      this.sname = "kutya";
    }
    if (this.newPetForm.value.bname === "sziámi") {
      this.sname = "házi macska";
    }

    if (this.newPetForm.value.neutered === "igen") {
      this.neutered2 = true;
    }
    if (this.newPetForm.value.neutered === "nem") {
      this.neutered2 = false;
    }

    let name = this.newPetForm.value.name;
    let bname = this.newPetForm.value.bname;
    let age = this.newPetForm.value.age;
    let adopted = false;
    let shelters_id = this.newPetForm.value.shelters_id;


    this.petsService.postPets(name, bname, age, this.gender2, adopted, shelters_id, this.neutered2, this.sname)
      .subscribe(res => {
        if (res != 0) {
          alert("Sikeres felvétel");
          window.location.reload();
        } else {
          alert("A felvétel sikertelen!");
        }
      })
  }

  deletePet(id: number) {
    this.petsService.deletePet(id)
      .subscribe(res => {
        if (res != 0) {
          alert("Sikeres törlés");
          window.location.reload();
        } else {
          alert("A törlés sikertelen!");
        }
      })
  }

  onEdit(pet: any) {

    this.newPetForm.controls['name'].setValue(pet.name);
    this.newPetForm.controls['bname'].setValue(pet.bname);
    this.newPetForm.controls['age'].setValue(pet.age);
    this.newPetForm.controls['gender'].setValue(pet.gender);
    this.newPetForm.controls['shelters_id'].setValue(pet.shelters_id);
    this.newPetForm.controls['neutered'].setValue(pet.neutered);
  }

  updatePet() {
    let adopted = false;
    this.petId = Number(this.petId);
    this.petName = this.petName.toString();
    this.petBName = this.petBName.toString();
    this.petAge = Number(this.petAge);

    this.petSheltersId = Number(this.petSheltersId);
    this.petSName = this.petSName.toString();



    this.petsService.updatePets(this.petId, this.petName, this.petBName, this.petAge, this.petGender, adopted, this.petSheltersId, this.petNeutered)
      .subscribe(res => {
        if (res != 0) {
          alert("Sikeres frissítés!");
          // window.location.reload();
        } else {
          alert("A frissítés sikertelen!");
        }
      })
  }

}
