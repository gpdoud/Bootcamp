# Creating WebApi/EF/Core in Visual Studio

This document is instructional for building a C#/EF/WebApi .Net Core back-end service.

## Create .Net Core - Api project

If Visual Studio is not running, start it.

Select FILE > NEW > PROJECT.

Select Visual C# > Web.

Select ASP.NET Core Web Application. 

Enter a Name for the project and a name for the solution. 

Make sure the Location points to the folder that you want to create the project in. 

Also make sure Make directory for solution and Create new Git repository are both checked. 

Click OK.

In the New ASP.NET Core Web Application, make sure the two drop-down lists at the top say .NET Core and ASP.NET Core 2.1. 

Click API. 

Uncheck the box for Configure for HTTPS. 

If Authentication shows anything other than No Authentication, click Change Authentication and click No Authentication then click OK. 

Back to the New ASP.NET Core Web Application, Click OK.

## Install SQL Server support

Open the Package Manager Console.

Add support for SQL Server.

At PM> type `install-package Microsoft.EntityFrameworkCore.SqlServer` and enter.

```
Restoring packages for C:\repos\...\WebApiEfCoreProject.csproj...
Installing NuGet package microsoft.entityframeworkcore.sqlserver 2.1.4.
Committing restore...
Writing lock file to disk. Path: C:\repos\...\obj\project.assets.json
Restore completed in 410.55 ms for C:\repos\...\WebApiEfCoreProject.csproj.
Successfully uninstalled 'Microsoft.EntityFrameworkCore 2.1.1' from WebApiEfCoreProject
Successfully uninstalled 'Microsoft.EntityFrameworkCore.Abstractions 2.1.1' from WebApiEfCoreProject
Successfully uninstalled 'Microsoft.EntityFrameworkCore.Analyzers 2.1.1' from WebApiEfCoreProject
Successfully uninstalled 'Microsoft.EntityFrameworkCore.Relational 2.1.1' from WebApiEfCoreProject
Successfully uninstalled 'Microsoft.EntityFrameworkCore.SqlServer 2.1.1' from WebApiEfCoreProject
Successfully uninstalled 'System.Diagnostics.DiagnosticSource 4.5.0' from WebApiEfCoreProject
Successfully installed 'Microsoft.EntityFrameworkCore 2.1.4' to WebApiEfCoreProject
Successfully installed 'Microsoft.EntityFrameworkCore.Abstractions 2.1.4' to WebApiEfCoreProject
Successfully installed 'Microsoft.EntityFrameworkCore.Analyzers 2.1.4' to WebApiEfCoreProject
Successfully installed 'Microsoft.EntityFrameworkCore.Relational 2.1.4' to WebApiEfCoreProject
Successfully installed 'Microsoft.EntityFrameworkCore.SqlServer 2.1.4' to WebApiEfCoreProject
Successfully installed 'System.Diagnostics.DiagnosticSource 4.5.1' to WebApiEfCoreProject
Executing nuget actions took 629.28 ms
Time Elapsed: 00:00:04.8226450
```

Add support for lazy loading

PM> type `install-package Microsoft.EntityFrameworkCore.Proxies`

```
Restoring packages for C:\repos\dnbc5\prs\prs-server-solution\prs-server\prs-server.csproj...
  GET https://api.nuget.org/v3-flatcontainer/microsoft.entityframeworkcore.proxies/index.json
  OK https://api.nuget.org/v3-flatcontainer/microsoft.entityframeworkcore.proxies/index.json 55ms
  GET https://api.nuget.org/v3flatcontainer/microsoft.entityframeworkcore.proxies/2.2.2/microsoft.entityframeworkcore.proxies.2.2.2.nupkg
  OK https://api.nuget.org/v3flatcontainer/microsoft.entityframeworkcore.proxies/2.2.2/microsoft.entityframeworkcore.proxies.2.2.2.nupkg 31ms
Installing Microsoft.EntityFrameworkCore.Proxies 2.2.2.
Installing NuGet package microsoft.entityframeworkcore.proxies 2.2.2.
Committing restore...
Writing lock file to disk. Path: C:\repos\dnbc5\prs\prs-server-solution\prs-server\obj\project.assets.json
Restore completed in 2.05 sec for C:\repos\dnbc5\prs\prs-server-solution\prs-server\prs-server.csproj.
Successfully installed 'Castle.Core 4.2.1' to prs-server
Successfully installed 'Microsoft.EntityFrameworkCore.Proxies 2.2.2' to prs-server
Successfully installed 'System.ComponentModel 4.3.0' to prs-server
Successfully installed 'System.ComponentModel.Primitives 4.3.0' to prs-server
Successfully installed 'System.ComponentModel.TypeConverter 4.3.0' to prs-server
Successfully installed 'System.Diagnostics.TraceSource 4.3.0' to prs-server
Executing nuget actions took 774.07 ms
Time Elapsed: 00:00:03.0766288

```

Add support for disabling CORS (needed for testing with Angular)

PM> type `install-package Microsoft.AspNetCore.Cors`

```
Restoring packages for C:\repos\dotnetcore\vs\TestingLogRepository\TestingLogRepository\TestingLogRepository.csproj...
Installing NuGet package Microsoft.AspNetCore.Cors 2.1.1.
Committing restore...
Writing lock file to disk. Path: C:\repos\dotnetcore\vs\TestingLogRepository\TestingLogRepository\obj\project.assets.json
Restore completed in 452.43 ms for C:\repos\dotnetcore\vs\TestingLogRepository\TestingLogRepository\TestingLogRepository.csproj.
Executing nuget actions took 1.01 sec
Time Elapsed: 00:00:01.8329104
```

_Note: It is possible that the version numbers may be different._

## Create models

Add a `Models` folder at the project level.

Create the models needed for the database.

Add attributes to model properties. Most common are:

    * StringLength(xx)
    * Required
    * Unique(name = "IDX_IndexName", IsUnique = true)

Create AppDbContext.

```
public AppDbContext : DbContext {
    public AppDbContext(DbContextOptions<App> context) : base(context) {}

    public DbSet<[Model1]> [Model1s] { get; set; }
    public DbSet<[Model2]> [Model2s] { get; set; }
    ...
}
```

## Modify Startup.cs

In ConfigureServices(..)

```
    // add SQL Server support
    var connection = @"server=localhost\sqlexpress;database=[xxx];trusted_connection=true;";
    services.AddDbContext<AppDbContext>(opt => {
        opt.UseLazyLoadingProxies();
        opt.UseSqlServer(connection);
    });

    // enable CORS support
    services.AddCors();   
    services.AddMvc();
```

In Configure(..)

```
   app.UseCors(opt => opt.AllowAnyOrigin().AllowAnyHeader().AllowAnyMethod().AllowCredentials());
   app.UseMvc();
```

## Add migration and create database

In Package Manager Console:

```
add-migration ".."
update-database
```

If the add-migration displays a yellow warning to upgrade from 2.1.1 to 2.1.4, execute this command:

```
install-package Microsoft.EntityFrameworkCore.Tools -version 2.1.4
```

## Add Controller (w/EF)

The controller contains the code to execute when calls are made to the server. VS can generate very good template code especially for EntityFramework and WebApi. Each controller should be generated for the template code. The template code contains five methods (the examples assume the controller is users):

1. [GET] /api/users - Retrieves all users
2. [GET] /api/users/5 - Retrieves the user with the primary key of 5
3. [POST] /api/users - Adds the user instance (passed in the body of the request)
4. [PUT] /api/Users/5 - Updates the user with the primary key of 5 (passed in the body of the request)
5. [DELETE] /api/users/5 - Removes the user with primary key of 5

Right click on Controllers in Solution Explorer and select ADD > Controller

From the dialog, select API Controller with actions, using Entity Framework.

From the next dialog, in the Model class, select one of the class in the Models folder

In the Data context class, select the AppDbContext class

The name in the Controller name textbox will be automatically generated. It can be changed, but should reflect the plural version of the model picked in the top dropdown list.

Add the EnableCores attribute with the policy create in Startup.cs

```
[EnableCors("AllowAnyOrigin")]
```
