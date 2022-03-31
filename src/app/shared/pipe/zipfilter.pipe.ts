import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'zipfilter'
})
export class ZipfilterPipe implements PipeTransform {

  transform(shelters: any[], filter: number): any {

    if(!shelters || !filter){
      return shelters;
    }
    return shelters.filter(shelter => {
      return shelter.shelter_zip == filter;
    });
  }
}
