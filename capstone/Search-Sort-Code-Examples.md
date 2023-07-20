# Search Example

In this example, the `email` property can be null. The highlighted row in the `if()`
statement first checks whether it is null and if so, skips checking to see if it matches
the search value. If it is not null, then it is checked to see if it matches the 
search value.

```ts
import { Pipe, PipeTransform } from '@angular/core';
import { User } from './user.class';

@Pipe({
  name: 'userSrch'
})
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

        // this is an example of checking a property for null
        `(user.email != null && user.email.toLowerCase().includes(criteria.toLowerCase()))` ||
        
        (user.cellPhone != null && user.cellPhone.toString().toLowerCase().includes(criteria.toLowerCase())) ||
        (user.workPhone != null && user.workPhone.toLowerCase().includes(criteria.toLowerCase())) ||
        (user.role != null && user.role.name.toLowerCase().includes(criteria.toLowerCase()))
      ) { selUsers.push(user); }
    });
    return selUsers;
  }

}
```

# Sort Example

Here is an example of the `sort` pipe. It also must check for properties that can be null.
I did this by creating a function called `setValue()`. That function both checks the property
for null values and also returns the non-null value converted to lower case. It the property
is null, the `setValue()` returns an empty string.

```ts
import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'sort'
})
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
```