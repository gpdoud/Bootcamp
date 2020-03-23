# Angular
    * A Javascript Framework by Google
    * Written in Typescript (a Microsoft product)

## CLI
## Modules
## Components
## Services


## Pipes
    * Async
    * Decimal
    * LowerCase
    * TitleCase
    * Currency
    * Json
    * Percent
    * UpperCase
    * Date
    * KeyValue
    * Slice

### Sort Pipe

import { Pipe, PipeTransform } from '@angular/core';
@Pipe({ name: 'sort' })
export class SortPipe implements PipeTransform {
  transform(arr: any[], column: string, asc: boolean = true): any[] {
    if(arr == null || arr.length == 0) return arr;
    let sortFn = (a: any, b: any): number => {
      let x = this.setValue(a[column]);
      let y = this.setValue(b[column]);
      if (x === y) return 0;
      let mult = asc ? 1 : -1;
      return mult * (x < y ? -1 : 1);
    }
    let sorted = arr.sort(sortFn);
    return sorted;
  }
  setValue = (colVal: any): any => {
    if (colVal == null) return '';
    if (typeof colVal == "number") return colVal;
    return colVal.toString().toLowerCase();
  }
}

### Search Pipe

import { Pipe, PipeTransform } from '@angular/core';
import { User } from './user.class';
@Pipe({ name: 'userSrch' })
export class UserSearchPipe implements PipeTransform {
  transform(users: User[], criteria: string = ''): User[] {
    if(criteria == '') { return users; }
    let selUsers: User[] = [];
    users.forEach(user => {
      if(
        user.id.toString().toLowerCase().includes(criteria.toLowerCase()) ||
        user.username.toLowerCase().includes(criteria.toLowerCase()) ||
        user.firstname.toLowerCase().includes(criteria.toLowerCase()) ||
        user.lastname.toLowerCase().includes(criteria.toLowerCase()) ||
        (user.email != null && user.email.toLowerCase().includes(criteria.toLowerCase())) ||
        (user.cellPhone != null && user.cellPhone.toString().toLowerCase().includes(criteria.toLowerCase())) ||
        (user.workPhone != null && user.workPhone.toLowerCase().includes(criteria.toLowerCase())) ||
        (user.role != null && user.role.name.toLowerCase().includes(criteria.toLowerCase()))
      ) { selUsers.push(user); }
    });
    return selUsers;
  }
}

## Directives
### Attribute Directives (https://angular.io/guide/attribute-directives)
### Structural Directives (https://angular.io/guide/structural-directives)

Can be used to write directives like ngIf.

ng-container (never displayed)
ng-template (injected with using asterisk i.e. *ngIf)
