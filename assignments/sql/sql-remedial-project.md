# Remedial Project for SQL

This project is assigned to student that score below the 80% required in the assessment.

## Directions

The student is to create a single script for SQL Server or MySql that will accomplish the following:

* Create a new Database called SqlRemDb

* Create a table named SalesOffice with the following columns:
  * Id (primary key) integer, auto generated by the database
  * Description string, max 30, cannot be null
  * City string, max 30, cannot be null
  * State string, max 2, cannot be null 

* Create a table named SalesPerson with the following columns:
  * Id (primary key) integer, auto generated by the database
  * Code string, max 10, cannot be null, must be unique
  * Name string max 30 cannot be null
  * Sales float cannot be null, defaults to zero
  * IsManager boolean, cannot be null, defaults to true
  * SalesOfficeId (foreign key to SalesOffice) integer, cannot be null

* Add the following rows to the SalesOffice table:

    | Description   | City      | State |
    | ---           | ---       | --- |
    | Northeast     | Boston    | MA |
    | Southeast     | Atlanta   | GA |
    | Southwest     | Phoenix   | AZ |
    | Northwest     | Seattle   | WA |
    | Northcentral  | Chicago   | IL |
    | Southcentral  | Dallas    | TX |

* Add the following rows to the SalesPerson table

    | Code | Name               | Sales | IsManager | SalesOffice |
    | ---  | ---                | ---   | --- | --- |
    | NE01 | Iqra Cohen         | 62952 | N | Northeast |
    | NE02 | Leanne Yates       | 45108 | Y | Northeast |
    | NE03 | Briana Manning     | 17585 | N | Northeast |
    | SE01 | Cecelia Perry      | 47277 | N | Southeast |
    | SE02 | Ariyah Doherty     | 33644 | N | Southeast |
    | SE03 | Avneet Robles      | 45727 | Y | Southeast |
    | SW01 | Cain Harris        | 99687 | Y | Northwest |
    | SW02 | Kristin Hirst      | 94486 | N | Northwest |
    | SW03 | Bo Yu              | 82512 | N | Northwest |
    | NW01 | Amy-Leigh Plant    | 45634 | N | Northwest |
    | NW02 | Chardonnay Rojas   | 19529 | Y | Northwest |
    | NW03 | Karol Clayton      | 26017 | N | Northwest |
    | NC01 | Fenton Tucker      | 64717 | N | Northcentral |
    | NC02 | Siena Derrick      | 15191 | Y | Northcentral |
    | NC03 | Oskar Bradford     | 30223 | N | Northcentral |
    | SC01 | Ellesha Paul       | 17272 | N | Southcentral |
    | SC02 | Floyd Rennie       | 77869 | Y | Southcentral |
    | SC03 | Darrel Andersen    | 12088 | N | Southcentral |

* Write a query that displays the total of all the sales from all offices

* Write a join query that displays the SalesPerson's Name and SalesOffice's description