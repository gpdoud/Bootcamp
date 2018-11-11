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

In ConfigureServices()

```
    var connection = @"server=localhost\sqlexpress;database=[xxx];trusted_connection=true;";
    services.AddDbContext<AppDbContext>(opt => opt.UseSqlServer(connection));
```

## Add migration and create database

In Package Manager Console:

```
add-migration ".."
update-database
```

## Add Controller (w/EF)