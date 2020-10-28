# Technical Interviewing & Whiteboarding

## Prep

* Know the company
* Job description (technology stack, niche tools)
* Recruiters or HR people
* Avoid foreign recruiters
* What is the recruiters relationship with the decision maker
* How close is their relationship with the company
* Have you placed people here
* Ask about names of team leads
* Want to know the tech and culture of the:
  * Team
  * Company
  * Decision maker
* "Conway's Game of Life"
* Do mock projects in the company's technologies

## Assessments

* Examples:
  * HackerRank (Kroger)
  * Create a mock application (Abercrombie & Fitch)
  * Game of Life (Fuse)
  * Compusci (RHA)
* How much time to you have?
* Is the assessment timed?
* When do you need to have it done?
* What tech stack to you recommend?
* Browser-based IDEs
  * Solidity / Remax IDE
  * Codepen.io
  * Codewars

## Oral Tech

* Explain the four principles of OOP. (Encapsulation, Inheritance, Polymorphism, Composition/Abstraction)
* Define a class. (An object containing properties and methods)
* Name three paradymes of programming (Object-oriented [C#], Procedural [C], Functional [F#])
* What is a foreign key? (A column in one table that is also a primary key in another table)
* What are the types of join in SQL? (Inner, outer, left, right, union, cross)
* Why use XML rather than JSON? (To support systems that don't support JSON)
* Describe the difference between XML and JSON web services?
* What is MVC? (Model/View/Controller)
* What is a null pointer exception? (Calling a property or method on a null object)

## Whiteboarding

### SQL

Customer

  * Id (int, PK)
  * Name (str)
  * City (str)
  * State (str)
  * Sales (int)

Order
  * Id (int, PK)
  * Description (str)
  * CustomerId (int?, nullable, FK{Customer.Id})
  * Total (int)


Display all rows and all columns from the Customer table

Display only the Name and Sales from the Customer table

Display all columns from the Customer table but only rows where the State is OH, IN, KY

Display Customer name, Order description & total from the Customer and Order tables

Display Customer name, the count of the number of Orders displayed as Orders for each Customer

Display Customer name, the count of the number of Orders displayed as Orders for each Customer
    but only for customers with more than 10 orders

### CSharp

Create a method to calculate the average of the numbers 9 <= x < 35 and print
    the answer to the console

Create a method to sum the numbers from 1 <= x <= 75 that are evenly divisible
    by 7 or 11

Create a method to generate the fibinacci sequence less than 50.

Create a method to convert a Celcius temperature to Fahrenheit. F = (9/5 * C) + 32;

Create a method to convert a Fahrenheit temperature to Celcius. C = 5/9 * (F - 32);

Create a method to print the largest and smallest number in this array: 
    [450, 285, 267, 148, 846, 946, 605, 883, 826, 258, 301, 130, 354, 226, 899]