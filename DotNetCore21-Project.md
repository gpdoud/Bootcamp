# Create WebAPI Core 2.1

## Create Project

```
dotnet new webapi -o [name]
```

This create a new project in a new folder.

Response 'Yes' to the message about adding assets to build and debug.

## Run the project

Select `DEBUG > START DEBUGGING (F5)`

This does the build and executes the program.

Open the browser and enter the URL https://localhost:5001/api/Values

The browser should display:

```
["value1","value2"]
```

The browser address line will probably show an error indicating that the address is not secure. It is safe to ignore this for now.

## Add EntityFramework

Edit the project file (*.csproj) and to the following PackageReference tag

```
<PackageReference Include="Microsoft.AspNetCore.App" />
```

add the `version="2.1.2"` attribute.

```
<PackageReference Include="Microsoft.AspNetCore.App" version="2.1.2" />
```

Click the RESTORE button to fix the unresolved references.

## Add a model

Create a new `Models` folder.

Create the `Models/User.cs` file.

```
using System;

namespace User.Models {

    public class User {

        public int Id { get; set; }
        public string Name { get; set; }
        public bool Active { get; set; } = true;
        public DateTime DateCreated { get; set; } = DateTime.Now;

        public User() {}
    }
}
```

Create the `Models/AppDbContext.cs` file.

```
using System;
using Microsoft.EntityFrameworkCore;

namespace User.Models {

    public class AppDbContext : DbContext {

        public AppDbContext(DbContextOptions<AppDbContext> options) 
            : base(options) {}

        public DbSet<User> Users { get; set; }

    }
}
```

## Register the context for dependency injection

Change the `Startup.cs` file.

1. Add this line to the top of the ConfigureService constructor:

```
services.AddDbContext<AppDbContext>(opt => opt.UseInMemoryDatabase("UserDb"));
```

2. Comment out all lines in the Configure method except this one:

```
app.UseMvc();
```

## Create the controller

Create the `Controllers/UsersController.cs` file

1. Create the class

The class name should be the plural version of the name of the model it controls ending with `Controller`. So if the model is `User`, the controller name would be `UsersController`.

The controller class must inherit from `ControllerBase`.

```
public class UsersController : ControllerBase
```

2. Add required class attributes

Add the Router attribute to set the base url to access the controller methods

```
[Route("api/[controller]")]
```

This route defines that all routes after the base url will be `api/` then the controller class name WITHOUT THE CONTROLLER suffix. So if the controller class name is `UsersController`, the url would be `.../api/users`.

Add the ApiController attribute.

```
[ApiController]
```