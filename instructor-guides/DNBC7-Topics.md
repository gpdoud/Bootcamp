## F Aug 30 (PM Lab)
* Generic Collections (List<T>, Dictionary<T,T>, SortedDictionary<T,T>, Stack<T>, Queue<T>)
* switch statement
* enum
* casting
## M Sep 2 Labor day
## T Sep 3
* OOP
  * Geometric shapes: quad, rect, sqr
    class Quad {
        List<int> sides = new List<int>();
        public Quad(int s1, int s2, int s3, int s4) {
            foreach(var s in new int[] { s1, s2, s3, s4 }) {
                sides.Add(s);
            }
        }
    }
  * Employee, Manager
  * Banking
## W Sep 4
* OOP
* Interfaces
  * Dependency Injection: Multiple languages
* Exceptions
  * try .. catch .. finally
## TH Sep 5
* Exceptions (add to banking app)
* C# to SQL
## F Sep 6
* C# to SQL
## M Sep 9
AM
* C# to SQL
PM
* MSTest
  * Expected vs Actual results
  * Domain - all possible inputs
  * EndPoints (always includes zero)
* Test Driven Development
## T Sep 10
* LINQ
  * Query vs Method syntax
```
var rs = from i in ints
            where i % 2 == 0
            select i;

var rs = ints.Where(i => i % 2 == 1);

var users = from User user in UserList
            where user.IsAdmin
            orderby user.Lastname descending
            select user;

var join = from o in orders
           join c in customers
            on o.CustomerId equals c.Id
           select new {
             Customer = c.Name,
             Order = o.Description,
             Date = o.Date,
             Total = o.Total
           };
```
  * Lamdas
* Extension methods
## W Sep 11
* EntityFramework
```  
install-package Microsoft.EntityFrameworkCore.Tools
install-package Microsoft.EntityFrameworkCore.Design
install-package Microsoft.EntityFrameworkCore.SqlServer
install-package Microsoft.EntityFrameworkCore.Proxies
install-package Microsoft.AspNetCore.Cors

scaffold-dbcontext [connStr] [provider] -DataAnnotations
[connStr] = "server=localhost\sqlexpress;database=PrdDb7;trusted_connection=true;"
[provider] - Microsoft.EntityFrameworkCore.SqlServer
```
  * Add optionsBuilder.UseLazyLoadingProxies() before SqlServer in DbContext
## TH Sep 1
* EntityFramework
## F Sep 13
* HTML/CSS/JS/JSON
## M Sep 16
* HTML/CSS/JS/JSON
## T Sep 17
* MVC
## W Sep 18
* PRS BE
## TH Sep 19
* PRS BE
## F Sep 20
* PRS BE

* % modulus
* break & continue
* nullable types
* ?? null coalescing
* delegates