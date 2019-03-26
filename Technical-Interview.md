# Technical Interviewing

A way to assess your technical knowledge.

## Sample Questions

### Git/GitHub

Q. What is the Git command to make a newly created folder a repository?

Q. What is the Git command to switch between branches?

Q. You're on a team with multiple programmers working on the same project. You've been notified that two programmers have pushed their changes to GitHub. Explain how you update your project to include their changes?

### SQL Server

        Employee [Id int PK autogen, Name nvarchar(30), JobId FK, Hired DateTime, Salary decimal(18,2), Active bit)

        Job [Id int PK autogen, Description nvarchar(255), DepartmentId FK], PayGrade int]

        Department [Id int PK autogen, Name nvarchar(30)]

Q. What SQL command will retrieve all data for Employees making between 50,000 and 75,000 in ascending name sequence?

Q. What SQL command will display all Employee data by salary descending for those employees with a salary greater than the average of all employees?

Q. For an executive meeting, you're boss needs a query that she can run on demand showing the number of employees in each department ordered in descending order by count but only those departments that have more than 5 employees? 

### C#

Q. Use the **ternary** operator to return "red" if x is greater than 10 else return "blue".

Q. Write the code that will display the even numbers 0 <= x <= 21 on the console.

Q. What is the differences between an abstract class and an interface?

### EntityFramework

Using the information defined for SQL ...

Q. What EF command must be issued after any changes made to the database?

Q. Write the EF method to return all Employees with active = true?

Q. In a section of code in your program, you need to determine if there are any employees making more than $82,000. Write the EF method you would use in your code.

### MVC

Q. In MVC, what does the 'V' stand for and what is its function?



### WebApi

Q. What is the HTTP method 'POST' normally used for?

