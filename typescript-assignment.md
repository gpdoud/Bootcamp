# Typescript Assignment

This assignment is to create a display of your favorite restaurants using Typescript.

## Requirements

1. All code must be Typescript.
2. Create a source file for a class 'Restaurants' containing:
    * A property: Id (integer)
    * A property: Name (string)
    * A property: Recommended (boolean)
    * A constructor to initialize all properties
    * A method called print() that will display all fields via a call to 'console.log()'
3. Create a source file for a class 'Mainline'. It should create an array of Restaurant instances from the following data:
<table>
  <tr><th>Id</th><th>Name</th><th>Recommended</th><th>Phone</th></tr>
  <tr><td>1</td><td>Rusty Bucket</td><td>true</td><td>111-1111</td></tr>
  <tr><td>2</td><td>Slim Chickens</td><td>true</td><td>222-2222</td></tr>
  <tr><td>3</td><td>Jimmy Johns</td><td>false</td><td>333-3333</td></tr>
  <tr><td>4</td><td>Five Guys</td><td>true</td><td>444-4444</td></tr>
  <tr><td>5</td><td>Skyline</td><td>false</td><td>555-5555</td></tr>
</table>

4. Iterate through the array calling 'print()' for each to display all data for each restaurant

5. Transpile the Typescript files

6. Execute by calling 'node Mainline.js'

## Submitting the assignment

Use Git to make the project a repository. Stage, commit, and push to a GitHub repository. Slack the .git url via the class Slack channel.

I will clone your repository to my machine. I'll transpile the two source files and run 'node Mainline.js' to review the output.
