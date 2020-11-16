# Capstone - Front-end

This is a guide book on how to build the front-end, capstone project. It will not be a step-by-step tutorial but a general guide of which Angular objects to create in what order.

1. Starting in the `repos` folder, create the Angular object. Be sure to include the switch to include **routing**. Optionlly you can include the switch to exclude the test files from being created. This will create a new folder in the `repos` folder and create all the files and folders in that new folder.

2. Edit the `app.module.ts` file and all the imports the class names for the `HttpClientModule` and `FormsModule`.
3. Edit the `app.component.html` file and clear all the template html that came with the file and put the pseudo-html tag so that all routed components are rendered in the `app.component.html`.
4. Create folders in the `app` to stored all the classes, services, pipes, and components for the `user`, `vendor`, `product`, `request`, and `requestline` or `lineitem`.
0. Create a folder under `app` called `core` to hold miscellaneous objects.
0. Using the **cli**, generate _components_ in the `core` folder for: `home`, `about`, `e404`.

## Menu

1. Create a folder called `menu` under `app`

0. To create the application menu, you'll need to create a menu class that defines the data for each menu item. The menu class will have properties for: display and route. Both are strings. Display is what shows on the page and route is a path in the app routing on which component to navigate to.
0. There will be a menu component and a menuitem component which will work together to create and render the menu on the page. You may render the menu without the menuitem component if you wish.
0. Create an array of menu class data with every item in the array representing a single item in the menu. Make sure to include a menu item for the `home` and `about` components.
0. Render the menu horizontally on the page using the `<nav>`, `<ul>`, `<li>`, and `<a>` tags. Make sure to space the menu items apart evenly.
0. It will take some CSS styling to make the menu display correctly.

## app-routing

1. To the app-routing module, add the imports and decorator values for the `home` and `about` components.

0. Fill the `routes` array with the special first and last route paths.
0. You want to navigate to the `home` component with a route of `/home`
0. You want to navigate to the `about` component with a route of `/about`

## Home and About Components

1. Edit the `home` and `about` components and add the pseudo-html tag to render the menu at the top of the html of each component

## Creating the basic `user`, `vendor`, `product`, and `request` objects

>In this section, the instructions will use the `user` as an example. Each of these four objects would be create similarly.

1. Create or generate the user.class.ts file
    - Make sure to set default values for all non-nullable properties like numbers and booleans.

0. Generate the service for the object. The basic functions needed are:
    - get all rows
    - get a single row by primary key
    - insert
    - update
    - delete
0. Generate the user-list component
    - display all the user instances in a table as soon as the component displays
0. Generate the user-detail component
    - The user clicks the `detail` link on a user instance in the user-list component
    - The component reads the id from the route
    - Using the id, a read by primary key returns the instance of the user
    - The user is rendered using a table with two columns where the left columns are the labels and the right columns are `<input>` tags that display data from the user.
    - The component displays a button named `Delete` which will delete the user instance and return to the user-list.
0. Generate the user-create component
    - Display an empty form containing the user properites
    - The user data is filled in by the user
    - The `Save` button is clicked and the user instance is added. When successful, the user-list is displayed
0. Generate the user-edit component
    - The user clicks the `edit` link on a user instance in the user-list component
    - The component reads the id from the route
    - Using the id, a read by primary key returns the instance of the user
    - The user is rendered using a table with two columns where the left columns are the labels and the right columns are `<input>` tags that display data from the user.
    - The user data is modified by the user
    - The `Save` button is clicked and the user instance is changed. When successful, the user-list is displayed

## Additional service and component functions required

### user

1. Create a login() function in the user.service

    - Pass in a username and password
    - Read for a single user with the username and password.
    - Return the user instance if found or a 404 error is not found
0. Generate the user-login component
    - Displays a textbox for username and a textbox for password and include a `Login` button
    - The username and password is entered and the `Login` button is clicked
    - Call the `Login` service function passing the username and password

### vendor

No additional methods needed

### product

No additional methods needed

### request

#### service

1. Create a `requests(id)` function to retrieve all requests in review status but not owned by the user whose primary key is `id`.

0. Create a `review(req)` function to set the request `req` to review or approved based on the request total
0. Create a `approve(req)` function to set the request `req` to approved
0. Create a `reject(req)` function to set the request `req` to rejected. When rejected, a request must include text in the `rejectionReason` property

#### component

1. Create a `request-lines` component. 

    - This component will selected from an action on the `request-list` component and it will display some properties from the selected request. At a minimum, the request properties `id`, `description`, `status`, `total`, and the `username` from the user that owns the request. 

    - At the top of this component, there should be a `Create` link that navigates to a `requestline-create` component.

    - On the component, there should be a `Review` button. It can be placed in the area of the request properties or at the bottom of the page. When clicked, the component should call the `review(req)` function in the service.
    
    - In addition, all the `requestlines` or `lineitems` attached to the request are displayed in a list format with each line having actions: `edit` and `delete`.

        - Clicking `edit` will call the component that edits a `requestline` or `lineitem`

        - Clicking `delete` will allow the user to confirm the delete then remove the `requestline` or `lineitem` from the request

0. Create a `request-review-list` component.

    - This component will display a list of requests in `REVIEW` status

    - Each request will have an action called 'Review' which when clicked will navigate to the `request-review-item` component.

0. Create a `request-review-item` component

    - This component will display a request and its lines in the same display as the `request-lines` component except that no maintenance links are allowed. In essence, the changes are permitted to the request data or the lines on the request. There is no `Review` button on this component.

    - Two additional buttons are displayed at the bottom of the page: `Approve` and `Reject`

        - The `Approve` button will call the `approve(res)` function causing the status of the request to change to `APPROVED`

        - The `Reject` button will call the `reject(res)` function causing the status of the request to change to `REJECTED`. If a request is rejected, the reviewer is REQUIRED to enter some text in the `rejectionReason` property. A textbox for this data must be provided to the reviewer either displaying constantly on the page or can be revealed dynamically when the `Reject` button is clicked.

### requestitem or lineitem

> The `Requestline` or `Lineitem` does NOT need a list component that displays _every_ `Requestline` on a page. Requestlines will always be display for the request they are attached to. The `request-lines` component fulfills the roll of displaying a list of requestline items

1. Create the `requestline-create` component.

    - This component will create a new requestline and attach it to the request from where it was called. The component will display only a select list of products and a textbox quantity to the user along with a `Save` button.

    - _Note: Because the new requestline is attached to the request automatically and is not selected by the user, the requestId must be passed to this component via the route. This requires that the route to this component include a variable for the **request id**. The `requestId` foreign key in the requestline must be set using the value passed in via the route. Without doing so, the `requestId` will be zero and the create will fail._

    - When the requestline is created successfully, navigate back to the `request-lines` component.

0. Create the `requestline-edit` component

    - This is a standard edit component which displays the requestline, allows the user to change the product and/or quantity, click the `Save` button, and, when successfully, navigate back to the `request-lines` component.