# Assignment: Create classes using Composition and calculate order total 

This assignment's focus is on building classes using Composition. The goal is to build the classes and calculate the total of an order of different types of widgets.

Our company sells widgets and we have three different widgets: bronse, silver, and gold. The price of each one is different as defined in this table:

| Widget | Price |
| ------ | ----: |
| Bronse | $20   |
| Silver | $90   |
| Gold   | $500  |

We've received an order for widgets from a customer and we want to tell the customer what the total cost will be. Here is the order:

| Widget | Quantity |
| ------ | :------: |
| Bronse | 3        |
| Silver | 7        |
| Gold   | 9        |

A class called `Product` and an interface called `IProduct` have already been built. You should take advantage of these in your work. There is also an enumeration called `ModelType` which is the type used for the `Model` of the widget.

Your task is to create the `BronseWidget`, `SilverWidget`, and `GoldWidget` classes using Composition. As these three classes will need to be loaded into a collection with a common type, they should implement the `IProduct` interface.

Remember that using Composition means you'll need to create a property within each class that is an instance of the `Product` class. Any functionality provided by the `Product` class should be used rather than recreated in the various widget classes.

Once the three widget classes are created, in the Program.Main method, I suggest you create a generic collection class, load the appropriate number of each type of widget, iterate through the collection getting the price for each type of widget and add that to a total.

Use the `Console.WriteLine` statement to print out the total for the order. The correct total should be **5190**.

You can do this. Good luck!

```csharp
    public enum ModelType { Bronse, Silver, Gold };

    public class Product {

        public string Code { get; set; }
        public string Name { get; set; }
        public ModelType Model { get; set; } 

        public double GetPrice() {
            return Model switch
            {
                ModelType.Bronse => 20,
                ModelType.Silver => 90,
                ModelType.Gold => 500,
                _ => 0 // everything else
            };
        }

        public Product() { }
    }
```

```csharp
    public interface IProduct {

        public double GetPrice();

    }
```