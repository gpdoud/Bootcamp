# Assignment: Create Certificate of Deposit

This assignment is using OOP to create a new product for the bank. It requires creating the `Account` class first. Students should use the `Banking` project.

If you have questions, send a message via Teams.

## Functional requirements

The bank will have a product called a `Certificate of Deposit` usually abbreviated as `CD`. 

A CD requires the customer to leave the money in the account for a period of time before 
it can and must be withdrawn. The customer cannot withdraw any money before the withdrawal date.

    Hint!: Even when using `Inheritance`, you can override the Withdraw method in the CD class. If a withdraw is attempted, you must check if the current date (i.e. DateTime.Now) is less than (before) the Withdraw Date. If so, the withdraw is not allowed and should display a message that the withdraw cannot be made until the withdraw date.

    To do so, add `virtual` to the Withdraw method in the Account class:

    public virtual bool Withdraw(decimal amount) { .. }

    Create a Withdraw method in the CD class but use override instead of virtual:

    public override bool Withdraw(decimal amount) { .. }

    Inside the body of the Withdraw method in the CD is where you do the check to see if the current date is less then the withdraw date.

There will be only a single deposit. Once the account is funded, no additional money can be deposited. 

    Hint!: So the CD class will need a Deposit method that overrides the Deposit in Account. Use the same technique as was done for the Withdraw method of annotating the Account's Deposit method with 'virtual' and the CD's Deposit method with 'override'

    Once money is deposited, no additional money can be deposited. So if a deposit is attempted in the CD class and the balance is greater than zero, the deposit should fail.

## Interest on CD

It is an interest-bearing account similar to `Savings`. 

The customer chooses the length of time in months the money will remain in the account. 
Choosing a longer term CD gets a higher interest rate. When the duration 
of the CD is complete, the money must be withdrawn after interest is paid. 

The interest rate on the CD is based on the number of months the money will remain in the CD. The interest rate for the CD is as follows:

| Months | Rate |
| ------ | ---- |
| 12     | 1%   |
| 24     | 2%   |
| 36     | 3%   |
| 48     | 4%   |
| 60     | 5%   |

The length of all CDs must be for one of these durations.

    Hint: You could create a constructor that has the number of months as a parameter. Then in the body of the constructor, use a set of  `if()` statements or a `switch()` statement to set the interest rate for the CD.

## Creating the CD class

Because the money in the CD must remain for a period of time, the `CD` class must contain the interest rate and two datetime properties. They are:

1. The date the deposit was made
2. The date the withdraw can be made.

The withdrawal date is calculated from the deposit date and the number of months of the CD. For example, if a 12 month CD is deposited on January 1, 2021, the withdrawal date would be Jan 1, 2022. An attempted withdrawal made during 2021 would not be allowed and the Withdraw method would display a message to the user that money cannot be withdrawn.

    Hint!: The DATETIME class has a number of methods to manipulate dates and times

## Calculation of Interest

The calculation of interest would be done the same as the `Savings` account.

The class must have a property to hold the interest rate. It should store the interest rate per year as a decimal number (i.e. 0.05 = 5%).

The interest is calculated monthly but the bank may wish to pay the interest every 3, 6, or 12 months.

The forumla for calculating interest is:

    InterestToBePaid = Balance * (InterestRate / 12) * NumberOfMonths

* **InterestToBePaid** - The amount of interest earned based on the interest rate and the number of months
* **Balance** - The amount of money in the account
* **InterestRate** - The rate of interest per year as a decimal number
* **12** - Because interest is calcuated monthly and there are 12 months in the year and the interest rate 
rate is for 12 months, to calculate the interest for 1 monthly, the interest rate is divided by 12.
* **NumberOfMonths** - The number of months to pay interest for

Good luck.