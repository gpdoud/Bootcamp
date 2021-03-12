# Dealer Car Ef/WebApi/Server

Create a Asp.Net Ef WebApi server for car dealers. This project is the same type of project as the PRS back-end project. Testing should be done with Postman for all controller methods.

When complete, push the work to your GitHub account and send me that URL to the project via a DM Slack message.

## Dealer Table

The `Dealer` table provides these functions:

1. Identifies the dealership
2. Keeps a count of the number of cars in the dealership inventory

| Name      | Type    | Null | Len | Unique | PK  | FK  | Def | Gen | Notes |
| ----      | ----    | ---- | --- | ------ | --- | --- | --- | --- | ----- |
| Id        | Integer | No   | N/A | Yes    | Yes | No  | No  | Yes | 1,1   |
| Code      | String  | No   | 30  | Yes    | No  | No  | No  | No  |       |
| City      | String  | No   | 30  | No     | No  | No  | No  | No  |       |
| State     | String  | No   | 30  | No     | No  | No  | No  | No  |       |
| Phone     | String  | Yes  | 12  | No     | No  | No  | No  | No  |       |
| Email     | String  | Yes  | 255 | No     | No  | No  | No  | No  |       |
| CarCount  | Integer | No   | N/A | No     | No  | No  | No  | No  |       |

Notes:

* The `Code` column must be unique for all rows though it is not the PK.

### Methods: (other than generated methods)

* IncrementCount(DealerId) - Increases the CarCount property for the dealer.
* DecrementCount(DealerId) - Decreases the CarCount property for the dealer.

## Car Table

The `Car` table provides these functions:

1. Identifies each car available from the dealer
2. Keeps a status about each car
3. Records each cars' purchase price, sale price, and calculated profit

| Name        | Type    | Null | Len | Unique | PK  | FK  | Def | Gen | Notes |
| ----        | ----    | ---- | --- | ------ | --- | --- | --- | --- | ----- |
| Id          | Integer | No   | N/A | Yes    | Yes | No  | No  | Yes | 1,1   |
| DealerId    | Integer | No   | N/A | No     | No  | Yes | No  | No  |       |
| Vin         | String  | No   | 17  | Yes    | No  | No  | No  | No  |       |
| Make        | String  | No   | 30  | No     | No  | No  | No  | No  |       |
| Model       | String  | No   | 30  | No     | No  | No  | No  | No  |       |
| Trim        | String  | No   | 12  | No     | No  | No  | No  | No  |       |
| Year        | Integer | No   | N/A | No     | No  | No  | No  | No  |       |
| Status      | String  | No   | 12  | No     | No  | No  | No  | No  |       |
| Cost        | Decimal | No   | N/A | No     | No  | No  | No  | No  |       |
| SalePrice   | Decimal | No   | N/A | No     | No  | No  | No  | No  |       |
| Profit      | Decimal | No   | N/A | No     | No  | No  | No  | No  |       |

Notes:

* The `Code` column must be unique for all rows though it is not the PK.
* The `Status` of the car can be: 
  - `RECEIVED` - the car has been received by the dealership but is not ready to sell
  - `FORSALE` - the car is on the lot and ready to sell
  - `SOLD` - the car has been sold but not yet picked up
  - `DELIVERED` - the car has been picked up by the buyer and is no longer on the lot 
* The `Cost` is the amount the dealership paid for the car
* The `SalePrice` is the amount the dealership sold the car for.
* The `Profit` is `SalePrice` minus `Cost` which must be calculated at time of sale

### Methods: (other than generated methods)

* Received(car) - Adds the car to the dealer's inventory and marks status to `RECEIVED`. Adding a car to inventory requires adding to the `CarCount` in the `Dealer` table.
* ForSale(car) - Sets the car `Status` to `FORSALE`
* Sold(car) - Sets the car `Status` to `SOLD`. `Profit` column must be calculated by subtracting the `Cost` from the `SalePrice`
* Delivered(car) - Sets the car `Status` to `DELIVERED`. Removing the car from inventory requies subtracting from the `CarCount` in the `Dealer` table.

