# Banking Application (For WebApi project)

## Customers
    - Id : int, PK
    - Name : string
    - CardCode : int
    - PinCode : int
    - LastTransactionDate : DateTime
    - CreatedDate : DateTime (default to DateTime.Now)
    - ModifiedDate : DateTime nullable 
    * AddAccount(Checking|Savings)
    * CloseAccount(id)
## Accounts
    - Id : int, PK
    - Type : "CK" for Checking | "SV" for Savings
    - Description : string
    - InterestRate : decimal (default 0.01 or zero if not interest account)
    - Balance : decimal (default to zero)
    - CreatedDate : DateTime (default to DateTime.Now)
    - ModifiedDate : DateTime nullable 
    - CustomerId int (FK to Customer)
## Transactions
    - Id : int, PK
    - AccountId : int (FK to Account)
    - PreviousBalance : decimal
    - TransactionType : string "D" for deposit, "W" for Withdraw
    - NewBalance : decimal
    - Description : string
    - CreatedDate : DateTime (default to DateTime.Now)

## All tables requires the five standard methods
    * GetAll
    * GetByPK
    * Add
    * Update
    * Delete

# Create ATM

Use a console project to create a virtual ATM that 
uses the banking API.

It should start by asking a customer to identify
themselves by entering the cardcode and pincode.

```
$ Enter Card Code : 1234<enter>
$ Enter Pin Code  : 6789<enter>
```

Then there should be a menu showing the customer
what the options are for the ATM. Options should
include:

    * Balance
    * Deposit
    * Withdraw
    * Transfer
    * Show Transactions

Each of these selections will required the customer
to then select the account unless the customer has
only one account. In that case, the one account is
selected automatically