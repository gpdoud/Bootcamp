# Instructor Alert System (IAS)

This is a software product that I've been thinking about writing myself but have not taken the time to do so.

The purpose of the system is to allow students in a boot camp class to privately communicate with the instructor that the student is keeping up with the pace of the instructor, or the student is having trouble keeping up with the pace, or that the student cannot keep up with the pace.

The way this will work is by providing an application that let the students click on an web application that displays some form of a traffic light (red, yellow, green) and will display simultaneously to the instructor. When started, it will display green, meaning the student indicates that the pace of instruction is just fine and they are keeping up. When yellow is clicked, the student indicates that they are having some difficulty understanding the material and/or keeping up with the instruction. When red is clicked, the student indicates they do not understand the instructor and/or that they are falling behind and cannot keep up with the instruction. The traffic like display for each student will tell the instructor whether to continue the current pace of instruction, slow down to let some students catch up, or pause any new instruction and repeat some instruction.

The instruction's user interface will show the traffic light indicator for all the students at the same time in the form of a dashboard. The instructor may privately request any student to click on the traffic light color that indicates their current status.

## Technology

- It is envisioned that because the student's response must be seen by the instrctor in real time, this will be a web application with a common database. It should follow the same architectural style as the student's capstone project with a SQL Server database, a C#/EF business layer, and an Angular front-end.
- The project must use a GitHub repository.

## Functionality

- A student must sign into the system each day.
- The students interface will start green
- The student simply clicks on any color of the three colors to set the current color
- The student will be prompted to reset their color every 1 hour
- The instructor may reset all or some of the students color to green after changing instruction