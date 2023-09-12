# Banking Application (For WebApi project)

# Customers
    - Id : int, PK
    - Name : string
    - CardCode : int
    - PinCode : int
    - LastTransactionDate : DateTime
    - CreatedDate : DateTime (default to DateTime.Now)
    - ModifiedDate : DateTime nullable 
# Accounts
    - Id : int, PK
    - Type : "CK" for Checking | "SV" for Savings
    - Description : string
    - InterestRate : decimal (default 0.01 or zero if not interest account)
    - Balance : decimal (default to zero)
    - CreatedDate : DateTime (default to DateTime.Now)
    - ModifiedDate : DateTime nullable 
    - CustomerId int (FK to Customer)
# Transactions
    - Id : int, PK
    - AccountId : int (FK to Account)
    - PreviousBalance : decimal
    - TransactionType : string "D" for deposit, "W" for Withdraw
    - Description : string
    - CreatedDate : DateTime (default to DateTime.Now)