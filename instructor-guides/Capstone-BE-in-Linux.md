# Creating the BE capstone in Linux (dotnet & VSC)

Using Terminal

1. Create folder
2. Create .sln
    dotnet new sln -o .
3. Create .csproj
    dotnet new api -n prs-server -o prs-server
4. Create `Models` folder in project
5. Added required NuGet packages (terminal)
    dotnet add package Microsoft.EntityFrameworkCore.Tools
    dotnet add package Microsoft.EntityFrameworkCore.SqlServer
6. Create connection string in appsettings.json
    "ConnectionStrings": {
        "AppDbContext": "server=localhost,1433;database=db;uid=sa;pwd=p@ssw0rd1!;"
    }