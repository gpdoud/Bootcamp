# ExpenseDb-Specs: Specifications for Expense App & Db (v1.0 : 9/18/2022)

## Revision History

* v1.0 - Initial release

## Overview

The Expense database is designed to support the functions of the Expense Reporting System (ERS).

## Employee

The `Employee` table provides two functions:

1. Provides authentication for users wishing to use the ERS
2. Provides ownership for `Expenses` created (who created and 'owns' them)

| Name          | Type     | Null | Len | Unique | PK  | FK  | Def | Gen | Notes |
| ----          | ----     | ---- | --- | ------ | --- | --- | --- | --- | ----- |
| Id            | Integer  | No   | N/A | Yes    | Yes | No  | No  | Yes | 1,1   |
| Name          | String   | No   | 30  | No     | No  | No  | No  | No  |       |
| Email         | String   | No   | 50  | Yes    | No  | No  | No  | No  |       |
| Password      | String   | No   | 30  | No     | No  | No  | No  | No  |       |
| Admin         | Boolean  | No   | N/A | No     | No  | No  | No  | No  |       |
| ExpennsesDue  | Currency | No   | N/A | No     | No  | No  | No  | No  |       |
| ExpennsesPaid | Currency | No   | N/A | No     | No  | No  | No  | No  |       |

Notes:

* The `Email` column must be unique for all rows though it is not the PK.

### Methods: (other than generated methods)

* Login(email, password) : [GET: /api/employees/email/password] - Authenticates a user by email and password combination. This method reads the employees table for the email and password passed in and returns the instance if found; otherwise returns NotFound.

## Expense

The `Expense` table is the heart of the ERS. Together with a collection of `Expenseline`
rows makes up the employee's list of expense. It has xxx functions:

1. Provides the grouping for all the items being requested.
2. Provides the employee that created the expense
3. Provides the total amount of all the items being expensed

| Name            | Type     | Null | Len  | Unique | PK  | FK  | Def | Gen | Notes |
| ----            | ----     | ---- | ---  | ------ | --- | --- | --- | --- | ----- |
| Id              | Integer  | No   | N/A  | Yes    | Yes | No  | No  | Yes | 1,1   |
| Description     | String   | No   | 80   | No     | No  | No  | No  | No  |       |
| Status          | String   | No   | 10   | No     | No  | No  | Yes | No  | Def 'NEW'    |
| Total           | Currency | No   | 11,2 | No     | No  | No  | Yes | No  | Def 0 |
| EmployeeId      | Integer  | No   | N/A  | No     | No  | Yes | No  | No  | FK to Employee |

Notes:

* The `EmployeeId` is automatically set to the Id of the logged in employee.
* Neither `Status` nor `Total` may be set by the user. These are set by the application only.
* The `Total` is auto calculated by adding up all the lines currently on the expense
* There should be a virtual `Employee` instance in the Expense to hold the FK
instance when reading a Expense
* There should be a virtual collection of `Expenseline` instances in the Expense to
hold the collection of lines related to this expense.

### Methods: (other than generated methods)

* PayExpense(expenseId) : [PUT: /api/expenses/pay/5] - Pays the expense pointed to by expenseId. This function must:
    * change the status of the expense to "PAID" and 
    * add the expense total to the employee's ExpensesPaid and 
    * subtract the expense total from the employee's ExpensesDue.
* UpdateEmployeeExpensesDueAndPaid(employeeId) : [Private] - Recalculates the employee's ExpensesDue and ExpensesPaid
    by summarizing all the expenses totals that are due and those that are paid.
* GetApprovedExpenses() : [GET: /api/expenses/approved] - Retrieves all expenses with a status of APPROVED
* GetExpensesInReview() : [GET: /api/expenses/review] - Retrieves all expenses with a status of REVIEW
* ReviewExpense(expense) : [PUT: /api/expenses/review/5] - Sets the Status property to APPROVED if the Total property
    is less than or equal to 75; else sets Status to REVIEW
* ApproveExpense(expense) : [PUT: /api/expenses/approve/5] - Unconditionally sets the Status property to APPROVED
* RejectExpense(expense) : [PUT: /api/expenses/reject/5] - Unconditionally sets the Status property to REJECTED

## Item

The `Item` table provides two functions:

1. Provides the list of products that can be added to a `ExpenseLine`
2. Provides the name and price of items

| Name       | Type    | Null | Len  | Unique | PK  | FK  | Def | Gen | Notes |
| ----       | ----    | ---- | ---  | ------ | --- | --- | --- | --- | ----- |
| Id         | Integer | No   | N/A  | Yes    | Yes | No  | No  | Yes | 1,1   |
| Name       | String  | No   | 30   | No     | No  | No  | No  | No  |       |
| Price      | Decimal | No   | 11,2 | No     | No  | No  | No  | No  |       |

Notes:

None

## Expenseline

The `Expenseline` table implements a many-to-many relationship between the expense and item tables. Each expense
can have multiple expenselines and every expense can have multiple lines. This means that every expense can be related
to multiple items and each item can be related to multiple expenses.

The `Expenseline` holds all the items for a particular request.

| Name            | Type    | Null | Len  | Unique | PK  | FK  | Def | Gen | Notes |
| ----            | ----    | ---- | ---  | ------ | --- | --- | --- | --- | ----- |
| Id              | Integer | No   | N/A  | Yes    | Yes | No  | No  | Yes | 1,1   |
| Quantity        | Integer | No   | N/A  | No     | No  | No  | Yes | No  | def to 1 |
| ExpenseId       | Integer | No   | N/A  | No     | No  | Yes | No  | No  | FK to Expense |
| ItemId          | Integer | No   | N/A  | No     | No  | Yes | No  | No  | FK to Item |

Notes:

* `Quantity` must be greater than or equal to zero (cannot be negative)
* There should be a virtual `Item` instance in the ExpenseLine to hold the FK
instance when reading an ExpenseLine for the Item
* There should be a virtual `Expense` instance in the Expenseline to hold the FK
instance when reading a Expenseline for the Expense. _To resolve the cyclicial
error that will occur, add the attribute (System.Text.Json) [JsonIgnore] before the Expense
instance property_

### Methods: (other than generated methods)

* RecalculateExpenseTotal(expenseId) : [PRIVATE] - Recalculates the Total property whenever an insert, update, or delete occurs to the Expenselines attached to the expense. This method is private and cannot be called from outside the class. It should still be executed asynchronously. It should be called from the PUT, POST, and DELETE methods only AFTER the SaveChangesAsync() is called in those methods.

