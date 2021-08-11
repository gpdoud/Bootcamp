# Angular Remedial Project

## Purpose
This project is a remedial project for those students that have cumulative assessment score of less than 80%. The purpose is to give the student a chance to raise their cumulative score at or above the 80% mark

## Requirements
The requirement is to create an Angular SPA (with routing) application for the Student table. The application must provide the following component functions which are similar to those component functions for tables in the PRS application:

* student-list
* student-detail (includes button to delete)
* student-edit
* student-create

At startup, the student-list should display and list all the students in the database in a format similar to this:

__CREATE__
| Id | Name | GPA | SAT | In State? | Actions |
| --- | --- | --- | --- | ---       | --- |
| 1 | John Doe | 3.5 | 1200 | Yes | __DETAIL / EDIT__ |
| 2 | Jane Smith | 3.7 | 1400 | No | __DETAIL / EDIT__ |

The CREATE, DETAIL and EDIT actions are links to other components:

* CREATE => student-create.component
* DETAIL => student-detail.component
* EDIT => student-edit.component

The Student table is defined like this:

| Name | Type | Notes |
| --- | --- | --- |
| Id | int | Primary key, identity(1,1) |
| Lastname | string (max 30) | not null |
| Firstname | string (max 30) | not null |
| GPA | decimal (range 0-5.0) | not null |
| SAT | int (range 400-1600) | not null |
| InState | bool | not null |

You will be provided the C# .Net Core back-end code to run. You do not have to create this and you should not change any of this code.

Because there will be only one list component, a menu like the one in the PRS application is NOT needed. No sorting or search of the list is required.

## StudentListComponent

When the application is started, the first thing displayed is the student-list. It should mimic the user-list or vendor-list from the PRS project in that every row in the Student table must be displayed and each row displayed should have a detail and edit action link. At the top of the page should be a link to navigate to the StudentCreateComponent.

## StudentDetailComponent

When the detail action is clicked on a student from the list page, the detail component should simply display all the properties in the student selected. All the values should display as document in the list page.

The detail display should have a button to delete the student. After deleting the student, the display should return to the list page automatically.

## StudentCreateComponent

When the create link at the top of the list page is clicked, the display should provide form controls for all the data in the Student except the **Id** because it is generated in the database. All fields except the **InState** should use `<input>` controls where the **type** is set to either **text** or **number**.

For the boolean property, a **type** of 'checkbox' should be used.

## StudentEditComponent

The edit component should act similarly to the create component except that the selected student from the list page must be read from the database and the data populated on the form before allowing the user to change the data.

# Submitting the project

When complete, the Angular project should be pushed to a GitHub repository and the repository URL sent to the instructor via a private Slack channel. The instructor will `clone` the project and run it again the same back-end provided to the student.

The project will be graded on a 100 point scale and included in with other assessment scores used to calculate the cumulative percentage. A cumulative percentage of 80% is needed.