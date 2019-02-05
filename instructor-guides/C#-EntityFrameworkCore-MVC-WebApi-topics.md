# C#, EntityFrameworkCore, MVC, WebApi

* C# created 2001 with .Net Framework
* modeled after C and Java (editorial comment)

## Core Programming

* source - files with text lines of code
* compile - translate source into object code
* link - combine object code into program
* build - compile and link if successful
* debug - run program and examine contents
* variable - name for location in memory that may contain a value
* property - name for a variable inside a class
* method - block of code executable by name
* assignment - copy data into a variable
* loop - doing a block of code multiple times
* increment/decrement - add or subject 1 from variable
* instantiate - create a class object
* call - execute method
* workstation - your development computer
* server - computer accessed by a workstation
* IDE - Integrated Development Environment; development tool

## C#

### Ch 2 - Core C#

    * Visual Studio
        * create project
        * build
        * run { to cursor }
        * breakpoints
        * inspect
    * statements
        * statements end with semi-colons
        * statement blocks with {}
        * comments
            * // comment to end of line
            * /* .. */ multiline comments
            * /// XML docs
        * case sensitive
    * basic program 
        * using
        * namespace
        * class : contains all code
        * Main method
    * variables
        * type name { = value};
            * class variables are initialized to default values
            * local variable must be initialized
        * var : type inference
        * scope : declared inside braces exists till closing brace
    * const int x = 1; // can never change; they are static
    * data types
        * value types: 
            * integers: int, long
            * floating point: float, double, decimal
            * boolean: bool
            * character: char
            * string: string
                * @ : can us single back-slash
                * $ : interpolation
        * reference types
            * strings
            * classes
    * program flow
        * equality test : ==
        * if .. else
        * switch .. case .. default
        * loops
            * for(;;)
            * while()
            * do .. while()
            * foreach()
            * break
            * continue
            * return
    * namespaces
        * alias : using alias = Namespace
    * Main method
        * must exist in one class
        * must be static
        * may return void or int
        * may have string[] parameter
    * Preprocessor directives
        * define & undef
        * if, elif, else, endif
        * warning, error
        * region, endregion
        * line
        * pragma
    * object naming - Pascal case

### Ch 3 - Objects and Types

    * structs
    * classes - most important - reference type
        * fields
        * properties
            * field-backed (_id)
            * auto implement
        * methods
            * overloaded
            * optional parameters
            * variable number of parameters
        * constructors
            * calling others with this
        * static
    * class instances with new
    * access modifiers
        * public
        * private
        * internal (default)
    * value vs reference
    * nullable types
    * enum
        * assign multiple enums with [Flags]
    * partial classes
    * extension methods
        public static class PrintExt { 
            public static void Print(this string message) { 
                Console.WriteLine(message); 
            }
        }
    * class object
        * ToString()
        * GetHashCode()
        * GetType()
        * Equals()

### Ch 4 - Object-Oriented Programming with C#

    * encapsulation, inheritance, polymorphism
    * composition
    * inherit from one class; implement multiple interfaces
    * virtual methods
    * abstract classes and methods
    * constructors of derived classes
    * protected access modifier
    * interfaces
    * is & as operators

### Ch 5 - Generics (creating them)

### Ch 6 - Operators and Casts

    * == equality check // if(boolean = true) { }
    * + string concatenation
    * % modulus
    * [] indexing arrays
    * () casting
    * ?: ternary
    * ?? null coalescing
    * nullable types
    * null conditional // string str = acct?.FirstName
    * typeof, is, as

### Ch 7 - Arrays
    * int[] i // declare array
    * int[] i = new int[5]; // declare and init array
    * int[] i = { 1,2,3,4,5 }; // note semicolon after brace
    * i.Length // size of array; for(;;);
    * use foreach() rather than for()
    * Savings[] savings = new Savings[2]; // arrays of class instances; must init class object
    * Savings[0] = new Savings("Savings");
    * int[,] matrix = new int[3, 3] { {1,2,3}, {4,5,6}, {7,8,9} };
    * Array.Sort(arrayname);
    * class Account : IComparable<Account> {
        public int CompareTo(Account that) {
            // if equal, return 0
            // if this > that; return 1
            // if this < that; return -1;
            // check that for null
        }
      }

### Ch 8 - Delegates, Lambdas, and Events (SKIP)
    * Brief overview of lambda functions

### Ch 9 - String & RegEx

## C# to SQL
    * using System.Data.SqlClient
    * Connection string
    * SqlConnection
    * SqlCommand
    * SqlDataReader


## EntityFrameworkCore

### Ch 30 - ASP.NET Core

### Ch 31 - ASP.NET Core MVC

### Ch 32 - Web API

## MVC
## WebApi