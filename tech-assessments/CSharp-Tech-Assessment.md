
Q. What are the statements in C# that providing looping.
A. foreach, for, while, do..while

Q. What are the different types of comments?
A. //, /* */, ///

Q. What is a namespace?
A. It is a naming mechanism to prevent object name conflicts

Q. What are the TWO ways of declaring an integer variable
    with an initial value of zero?
A. int i = 0, var i = 0

Q. What is the syntax to initialize a decimal variable to the value 100?
A. `var aDecimal = 100m or 100M

Q. What is required when declaring a variable with `var`?
A. The variable must be initialized

Q. What are the three ways to add 1 to an integer variable `anInt`?
A. anInt++; anInt += 1; anInt = anInt + 1

Q. What does a `using` statement do?
A. Defines a namespace to be searched for object names not fully defined

Q. What is the syntax to check whether the value of A is equal
    to the value of B?
A. A == B

Q. What is `scope`?
A. Defines the lifetime of a variable defined within the scope

Q. What is the difference between value and reference types?
A. Reference types can be NULL by default. Value types cannot
    be NULL by default.

Q. In Net 6.x, how do you define a string variable as nullable?
A. `string? aString;`

Q. What is the approximate range of number that an integer can hold?
A. -2B < X < 2B

Q. What is the difference between using the increment operator
    on the left or right side of a variable?
A. If the variable value is being assigned, using the increment
    operator on the LEFT side will increment the variable then assign
    the value. If used on the RIGHT, the value will be assigned
    then the variable incremented.

Q. What does the CONTINUE statement do?
A. Causes the loop to skip the remaining statements in the body
    and go the the top of the loop for the next item.

Q. What does the BREAK statement do?
A. Causes a loop to terminate immediately.

Q. What is the purpose of the semicolon?
A. It is a statement TERMINATOR. Every statement must end with
    a semicolon to signify the end of the statement.

Q. When is it appropriate to use the TERNARY statement?
A. When a single variable is being assigned one of two values
    depending on a boolean expression.

Q. How is a variable defined with CONST differ from a variable
    defined without CONST?
A. Variables defined with CONST must be initialized and cannot
    be changed after declared.

Q. What are the restrictions applied to a variable that includes
    the READONLY modifier?
A. The variable must be initialized either at declaration time
    or within the constructor of the CLASS. After initialized,
    it cannot be changed.

Q. What are the three types that may exist within a CLASS?
A. Properties, Methods, Constructors

Q. What is the purpose of a CONSTRUCTOR?
A. To initialize properties of a CLASS instance.

Q. What does the access modifier PRIVATE mean?
A. The object is accessible only from within the CLASS
    where it is defined.

Q. What are the three tenets of OOP?
A. Encapsulation, Inheritance, Polymorphism

Q. What is Encapsulation?
A. Defining properties and the methods the operate on those 
    properties and controlling access to those properties and
    methods from other objects

Q. What is Inheritance?
A. Defining a new object by specifying the differences from
    an existing object.

Q. What is Composition?
A. Defining a class by using another class instance as a property
    within the new class.

Q. What elements of a class are inherited in a derived class?
A. All non-private elements are inherited

Q. How would a derived class call the `Print("Yes")` method in the 
    parent class?
A. `base.Print("Yes");`

Q. How would a class constructor that takes zero parameters (i.e. default)
    call a contructor in the same class that takes one integer parameter 
    with a value of 1?
A. `this(1);` 

Q. What is an Interface?
A. Defines a set of methods and properties that must be 
    defined by any CLASS that implements the interface.

Q. What is a STATIC property within a CLASS?
A. A property that exists only once within the 
    CLASS and can be accessible from all instances.

Q. What properties and methods can be accessed by a STATIC method?
A. Only static properties and static methods.

