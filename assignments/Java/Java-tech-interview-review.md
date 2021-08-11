# Java Technical Interview Review

* Java is an object-oriented language
    * Everything is a class
* JVM - Java Virtual Machine
* Files
    * [filename].java - java source file
    * [filename].class - compiled file from java source
    * Only 1 class per file
    * file name must match the class name
* Types
    * integers: int, long
    * characters: char, String
    * boolean: true, false
    * floating point: float, double, BigDecimal
    * enums
    * user-defined: classes
* Classes
    * fields
        * defines the data
        * should be marked `private`
        * public access should be via getters & setters
    * methods
        * user-defined methods
            * may be marked `public`, `private`, or `protected`
            * must define a return type or `void`
            * may take parameters
        * field getters & setters
            * provides public access to value in fields
            * may contain logic in get or set
        * can be overloaded if different parameter types
    * constructors
        * called when initializing a class instance
        * can be overloaded if different parameter types
        * may not define a return type
        * must be named with the class name
    * access modifiers
        * public
        * private
        * protected
* Object-oriented Programming
    * Encapsulation
        * Combining the data and the methods that operate on that data and controlling access to them
    * Inheritance
        * Creating something new by referencing something that exists and specifying only the difference
        * A class may inherit only one class
    * Polymorphism
        * Treating an object as it exists at runtime rather than compile time.
        ```java
        // type at compile time: Account
        // type at runtime: Savings
        Account sav = new Savings();
        ```
    * Composition (sometimes)
        * Using an object as a property within a new object
        ```java
        class Savings {
            // a property instead of inheritance
            Account account = new Account();
        }
        ```
* Interface
    * Defines a contract between two objects
    * A class may implement any number of interfaces
    * When implementing an interface, the class MUST create methods with the same signature as those defined in the interface
* Statements
    * assignment
    * equality
    * declaring a field or variable
        * `int i = 0;` // explicit type declaration
        * `var i = 0;` // implicit type inference (v10)
            * Must be assigned a value
    * if()
    * for(;;) // indexed
    * for(:) // foreach
    * while()
    * do..while()
    * switch()
    * break
    * continue
    * return
* Miscellaneous
    * package
    * imports
    * scope
* Tech tests
    * Tally the numbers from 1 to 50 (inclusive) but only those numbers that are evenly divisible by 3 or 7.
    * Generate the first 15 fibinacci numbers
    * Calculate the change (quarters, dimes, nickels, pennies) from a one dollar bill used to purchase a product costing X cents. 