# Teams for creating the Expense System in Java:

| Red Team  | Blue Team | Green Team |
| ---       | ---       | ---        |
| Lynn      | Jake      | Jacob      |
| Skyler    | Rob       | Jason      |
| Trevor    | Zach      | Tim        |

Each team's goal is to create the application by using only a single repository using the specs defined in the gist which will be posted in the Teams channel.

https://gist.github.com/gpdoud/07c1b96b691f60d1b4ba114bdbe0c498

## Suggestions for getting started.

* One member should create the template project in Java.
    * Define the `application.properties`
    * Create all the packages
    
* Once created, the `main` branch of the app should be pushed up to a GitHub repo.

* In the `setup` of the repo, the other team members should be added as collaborators on the repo so they can push to the same repo.

* The two other members should then `clone` the repository to their machine. (`git clone https://github.com/gpdoud/expense.git`)

* At this point, all members should have identical code on their machines.

* All members should use the SQL Workbench to manually create the database (i.e `create database xxx`)

## How members should make code changes

* To make any code changes, members will start by making a branch from main. The name of the branch should be unique (maybe include the members initials in the branch name)

* All code changes are made **in the new branch** and tested.

* When the coding and testing is complete, the new branch should be staged (`git add`) and committed (`git commit -m "msg"`) and pushed up to the repo (`git push origin new-branch-name`)

* Next the member should log into Github and create a **Pull Request** in the repository to merge their new branch into main.

* The other members should review the Pull Request and, if merging is agreed upon, merge it into main on Github (_the new branch that was merged into main should be deleted_)

* Once merged, ***all*** members must pull the new main branch code down to their machines (`git pull origin main`)

* Members still working on new branches should merge the new main code into their development branch. All changes in development branch must be committed. Within the development branch, (`git merge main`)
