# Create a JSON service in Spring-boot

modified for git/github lesson - by Greg Doud

These instructors where written on or about October 3, 2018.

These are the instructions for creating the back-end json service using Java, Eclipse, and Spring tools.

## Install STS version of Eclipse from Spring.io

For students that don't have Eclipse installed, it is best to install Eclipse with the Spring tools already installed and configured. That can be downloaded from:

(Eclipse with Spring tools)<https://spring.io/tools>

For those students that already have Eclipse installed, Spring tools can be added to the existing Eclipse instance. The following instructions are from the Eclipse site <https://www.eclipse.org/community/eclipse_newsletter/2018/february/springboot.php>

_You can install the Spring Tools for Eclipse IDE into an existing Eclipse installation using the Eclipse Marketplace. Just open the marketplace client in Eclipse, search for Spring Tools and install the “Spring Tools (aka Spring IDE and Spring Tool Suite)” entry._

## Create new project > Other > Spring Starter Project

To create the project, select *File > New > Other*. Scroll down to find *Spring Boot* folder. Select *Spring Starter Project*.

## Configure the project

## Include JPA, Web, MySql

## Add application.properties

1. Auto create and update the database

    `spring.jpa.hibernate.ddl-auto=none`
    `spring.jpa.hibernate.naming.physical-strategy=org.hibernate.boot.model.naming.PhysicalNamingStrategyStandardImpl`
    `spring.jpa.hibernate.ddl-auto=update`

2. How variable names are parsed

    `spring.datasource.url=jdbc:mysql://localhost:3306/prs?serverTimezone=UTC`
    `spring.datasource.username=root`
    `spring.datasource.password=root`

    `spring.jpa.hibernate.naming.physical-strategy=org.hibernate.boot.model.naming.PhysicalNamingStrategyStandardImpl`

3. MySql DB connection string and authorization`

    `spring.datasource.url=jdbc:mysql://localhost:3306/prsdb`
    `spring.datasource.username=root`
    `spring.datasource.password=root`

## Create package names

    `com.dsi.prs.feature.user`

## Create model

```java
package com.dsi.feature.user;
@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private string username;
    ...
    @Column(name = "isActive")
    private boolean active;
    // constructor with fields
    // getters & setters
}
```

## Create repository

```java
package com.dsi.prs.feature.user;
import org.springframework.data.repository.CrudRepository;
public interface UserRepository extends CrudRepository<User, Integer> {
    User findByUsernameAndPassword(String uname, String pwd);
}
```

## Create controller

```java
package com.maxtrain.prs.web;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.maxtrain.prs.business.user.User;
import com.maxtrain.prs.business.user.UserRepository;
import com.maxtrain.prs.util.JsonResponse;

@CrossOrigin
@Controller
@RequestMapping(path="/Users")
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping(path="/List")
    public @ResponseBody JsonResponse getAllUsers() {
        return new JsonResponse(userRepository.findAll());
    }

    @GetMapping(path="/Get/{id}")
    public @ResponseBody JsonResponse getUser(@PathVariable int id) {
        Optional<User> user = userRepository.findById(id);
        return new JsonResponse(user.isPresent() ? user.get() : null);
    }

    private @ResponseBody JsonResponse saveUser(@RequestBody User user) {
        try {
            userRepository.save(user);
            return new JsonResponse(0, "User Added/Changed.", user, null);
        } catch (DataIntegrityViolationException ex) {
            return new JsonResponse(-1, ex.getRootCause().toString(), null, ex);
        } catch (Exception ex) {
            return new JsonResponse(-2, ex.getMessage(), null, ex);
        }
    }

    @PostMapping("/Create")
    public @ResponseBody JsonResponse addUser(@RequestBody User user) {
        return saveUser(user);
    }
    @PostMapping("/Change")
    public @ResponseBody JsonResponse changeUser(@RequestBody User user) {
        return saveUser(user);
    }
    @PostMapping("/Remove")
    public @ResponseBody JsonResponse removeUser(@RequestBody User user) {
        try {
            userRepository.delete(user);
            return new JsonResponse(0, "User Deleted.", user, null);
        } catch (Exception ex) {
            return new JsonResponse(-2, ex.getMessage(), null, ex);
        }
    }
}
```

## Create json response class

```java
package com.dsi.util;
public class JsonResponse {
    private int code;
    private String message;
    private Object data;
    private Object error;
    // constructors with fields
    // getters & setters
}
```

## Manually create database name

## Run as Spring-boot