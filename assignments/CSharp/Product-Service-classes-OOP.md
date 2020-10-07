# Object-oriented programming

The assignment is to create classes for the Widget and Service classes using OOP.

Because the assignment requires creating the classes using Inheritance first then recreating the classes using Composition(Abstraction), you should use a namespace of `CSharp.OOP.Inheritance` for the classes done with inheritance and a namespace of `CSharp.OOP.Composition` for the classes done with composition.

In a ficticious company, they plan to sell their new Widget product along with support for the Widget. The Widget and the Servce classes have a number of things in common:

## Product common properties

* A unique Id [integer]
* Description [string]
* Unit [string] (for example: Each, Dozen, Gross, etc.)
* Price [double]

The two classes require some different properties:

## Widget

* Size: [string] (Small, Medium, Large)
* Model: [string] (Basic, Advanced, Enterprise)

## Service

* WidgetId [integer] (Id of the widget to service)
* ServiceYears [integer]

The price for a widget depends on the size and model purchased. 

| Model | Small | Medium | Large |
| ----- | ----- | ------ | ----- |
| Basic | $50   | $100   | $150  |
| Advanced | $125   | $200   | $275  |
| Enterprise | $250   | $400   | $550  |