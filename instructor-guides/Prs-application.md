# Purchase Request System (PRS)

This is a guide to building the PRS system in .Net & Angular

To organize the entire project, it is recommended to create a folder called `prs` in the `repos` folder. This should **not** be a repository! It is only for organizing the two parts of the project.

## Back-end (C#,EF,MVC,WebApi,Sql Server)

## Front-end (Angular,Typescript)

At this time, the current versions of Angular is v7.1.4.

### Generate the Angular project files

Change directory so that the current directory is `/c/repos/prs`.

From the Git Bash Shell, type:

```
ng new prs-client --routing
```

This will create the default project files including providing support for running as a single-page application (SPA) by providing routing.

### Add required modules

To allow the required functionality, a couple of Angular modules are required:

* **FormsModule** - supports two-way binding
* **HttpClientModule** - supports AJAX calls to back-end service

Navigate to the `prs-client/src/app` folder.

Edit `app.module.ts`.

Add the following import statements to `app.module.ts`.

```
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
```

Once the import statements are added, the class names must be added to the `imports` key in the `@NgModule` decorator.

*Note: The `imports` key will already contain the `BrowserModule` class name. This should remain the 1st class name in the `imports` array list. Add new module names **after** the `BrowserModule`.*

```
imports: [ FormsModule, HttpClientModule ]
```

