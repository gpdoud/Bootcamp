# Creating WebApi/EF/Core in Visual Studio

## Create .Net Core - Api project

## Install SQL Server support

`install-package Microsoft.EntityFrameworkCore.SqlServer`

## Create models

1. Create `Models` folder
2. Create models
3. Create AppDbContext

```
public AppDbContext : DbContext {
    public AppDbContext(DbContextOptions<App> context) : base(context) {}

    public DbSet<[Model]> [Models] { get; set; }
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