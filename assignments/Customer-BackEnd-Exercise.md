# Assignment: Create Customer JSON Service

Your assignment is to create a JSON service supporting the Customer table. You need to create a class, repository, and controller for the Customer so that the five, standard API calls are available:

* Get all Customers
* Get Customer by primary key
* Add a new Customer
* Update an existing Customer
* Delete a Customer by primary key

| property | Java type | Sql type | Max length |Sql Nullable |
| --- | --- | --- | --- | --- |
| id | int | int | N/A | No |
| name | String | varchar | 30 | No |
| sales | double | decimal | 10,2 | No |
| active | boolean | bit | N/A | No |

## Process

1. Create new Spring Boot Application. Dependencies needed are Web, JPA, and MySQL.
2. Add application.properties (5 of them)3. Create `customer` package folder for class, repository, and controller (you can choose the name)
3. Add the customer package
4. Add the class Customer
5. Add the repository CustomerRepository using CrudRepository (no additional repository methods are needed)
6. Add the controller CustomerController

## APIs

All apis have the base url of `http://localhost:8080`

* [GET] :: _/customers_ - Get all customers
* [GET] :: _/customers/5_ - Get customer with PK of 5
* [POST] :: _/customers_ - Insert customer (customer instance in the request body)
* [PUT] :: _/customers/5_ - Update customer with PK of 5 (customer instance in the request body)
* [DELETE] :: _/customers/5_ - Delete customer with PK of 5

## Testing

Test all the api calls with Postman.