# Git/GitHub

## Commands

* git status { -s } { -u }
* git init
* git add { filename | filespec | . }...
* git commit { -m message | --amend }
* git remote { add | remove } { origin | other } giturl.git
* git { push | pull } { origin | symbol } { master | other } 
* git branch branchname { -d | -D }
* git checkout { -b } branchname
* git log { -n }
* git clean { -f } // removes unstanged file from working directory; -f : force
* git stash
* undoing changes
    * git reset HEAD filename // unstaging a file
    * git checkout -- filename // discard file changes