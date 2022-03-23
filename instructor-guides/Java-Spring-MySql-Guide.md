# Java/Spring/MySql Rest Service

## Guide

Click `New` > `Spring Starter Project`

Displays `New Spring Starter Project` dialog. Fill in the dialog.

| Field | Value |
| --- | --- |
| Service URL | Ignore |
| Name | Project name (i.e. Prs) |
| Group | Same as Package name |
| Artifact | Same as Name |
| Version | Ignore |
| Description | User defined text |
| Package | Package name for all source (i.e. Prs)

Click `Next`

Check the boxes for:
* MySql Driver
* Spring Data JPA
* Spring Web

Click `Finish`

It will take a few moments to download all the files required for the project. The status will be visible in the lower right corner.

The name of the package will be a folder under `src/main/java`. Assume the package name is `Prs`.

### Defining the application.properties

    spring.jpa.hibernate.ddl-auto=none

These properties define the connection string to MySql along with the username and password to use to connect with. The username and password must be a valid user and have rights to maintain the SQL database.

    spring.datasource.url=jdbc:mysql://localhost:3306/prs
    spring.datasource.username=root
    spring.datasource.password=root

This property defines the nameing of properties in the database. Without this, column names must start with an underscore.

    spring.jpa.hibernate.naming.physical-strategy=org.hibernate.boot.model.naming.PhysicalNamingStrategyStandardImpl

### Creating the model

Right-click on `Prs` then click `New` > `Class`. Give the class a name like `User.java` and click `Ok`.

An empty class opens in the editor.

Create private properties in the class then create both getters and setters for each on. Next add annotations as follows:

    package Prs;

    @Entity
    public class User {
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private int id;
        public int getId() { return id; }
        public void setId(int id) { this.id = id; }

        private String username;
        public String getUsername() { return username; }
        public void setUsername(String username) { this.username = username; }

        ...
    }

Click on each error which should offer to add an import to the class file. The imports should include:

* from javax.persistence: Id, Entity, GeneratedValue, GenerationType

### Creating the repository

The repository is an `interface` rather than a class and it inherites (extends) from `CrudRepository<T1, T2>` where T1 is the model class (i.e. User) and T2 is the type of the primary key (i.e. Integer). It should work fine by just defining the interface. It will be used in the controller.

    package Prs;
    import Prs.User;

    @Repository
    public interface UserRepository extends CrudRepository<User, Integer> { }

Click on the errors and choose to import the classes needed. Only the CrudRepository and Repository classes are needed.

### Creating the controller

The controller is the heart of the system. It defines the routing from a browser requires to methods in the controller.

    package Prs;
    import Prs.UserRepository;
    import Prs.User;

    @CrossOrigin
    @RestController
    @RequestMapping("/api/Users")
    public class UserController {
        @Autowired 
        private UserRepository userRepository;

        @GetMapping("/List")
        public ResponseEntity<Iterable<User>> GetAllUsers() {
            var users = userRepository.findAll();
            return new ResponseEntity<Iterable<User>>(users, HttpStatus.Ok);
        }
    }

In this example, any method called on this controller will have a routing that starts with `/api/Users`. The controller has only one method `GetAllUsers()` which has a mapping of `/List` and returns a collection of `User` instances in the request body which is how all the JSON services return their data. This means that to call this method on the controller, the URL must be `/api/Users/List`.