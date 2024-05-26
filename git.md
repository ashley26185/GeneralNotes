 # Modify your remote URL
    git remote set-url origin https://git-repo/new-repository.git

 ## Clone from a Repository
Ctrl + Shift + P --> Clone from Repository URL


## Show current Configuration
```
git config --global -l
git config --global credential.helper wincred

git config credential.helper wincred
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
```
## Useful Links
https://www.azuredevopslabs.com/labs/azuredevops/git/

## Key Commands
List local branches
    git branch

List Remote branches
    git remote -r

List all branches - local and remote and view detailed info
    git branch -vva


## Instructions
I recommend you follow Conventional Commits for commits.
It will be required when onboard to repositories to Jenkins.
https://confluence.emirates.com/display/EKGDPP/1.3.5+Conventional+Commits
Sign In

[28/12/2022 12:42] Aridnei Oliveira Do Carmo
About branches, to make change on master branch you need a Pull Request...
You can use branch names like...
develop/*
hotfix/*
release/*
feature/*
bugfix/*

# Do these steps to clean up a branch
git checkout master
git fetch origin 
git reset --hard origin/main

## Create Branch and Check out
    git branch feature/BRASS
    git checkout feature/BRASS

or

    git checkout -b feature/BRASS

## Add and Commit
git add .
git commit -m ""

## Push to remote and create branch on remote
git push -u origin feature/BRASS

git fetch
https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/Git-pull-vs-fetch-Whats-the-difference
This will load all the remote branches locally so now you can simply access any remote branch via it’s name like a local branch using the checkout command as shown:


Note: You CANNOT UNDO this.
Try git checkout -f this will discard any local changes which are not committed in ALL branches and master



## Process
git pull
git branch -vva

## change environment to the new branch
git checkout new-branch

## Checkout from a remote branch
git checkout -b fix-failing-tests origin/fix-failing-tests
What this does is:

it creates a new branch called fix-failing-tests
it checkouts that branch
it pulls changes from origin/fix-failing-tests to that branch

# commit the change
git add .
git commit -m "add new file"

# push to a new branch
git push --set-upstream origin new-branch


Switching to a remote branch
To checkout a remote branch, you will need to fetch the contents of the branch using git fetch –all first. Then use the same command git checkout RemoteBranchName to switch to remote branch. You might have noticed that it is the same command used to switch to a local branch.

If you want to switch to a remote branch that does not exist as local branch in your local working directory, you can simply execute git switch remoteBranch. When Git is unable to find this branch in your local repository, it will assume that you want to checkout the respective remote branch with the same name. It will then create a local branch with the same name. It will also set up a tracking relationship between your remote and local branch so that git pull and git push will work as intended.

Using git switch vs git checkout
The git switch command replaced git checkout in 2020, although git checkout is still a supported command. The git checkout command performs two functionalities; "switch branch" and "restore working tree files". To separate these two functionalities, Git introduced the git switch command, which replaces the "switch branch" feature of "git checkout".


## This is the one to refer to 
Updated for Git 2.23: For older versions, see the section at the end.

With One Remote
In both cases, start by fetching from the remote repository to make sure you have all the latest changes downloaded.

$ git fetch
This will fetch all of the remote branches for you. You can see the branches available for checkout with:

$ git branch -v -a

...
remotes/origin/test
The branches that start with remotes/* can be thought of as read only copies of the remote branches. To work on a branch you need to create a local branch from it. This is done with the Git command switch (since Git 2.23) by giving it the name of the remote branch (minus the remote name):

$ git switch test
In this case Git is guessing (can be disabled with --no-guess) that you are trying to checkout and track the remote branch with the same name.

With Multiple Remotes
In the case where multiple remote repositories exist, the remote repository needs to be explicitly named.

As before, start by fetching the latest remote changes:

$ git fetch origin
This will fetch all of the remote branches for you. You can see the branches available for checkout with:

$ git branch -v -a
With the remote branches in hand, you now need to check out the branch you are interested in with -c to create a new local branch:

$ git switch -c test origin/test
For more information about using git switch:

$ man git-switch
I also created the image below for you to share the differences, look at how to fetch works, and also how it's different to pull:

enter image description here

Prior to Git 2.23
git switch was added in Git 2.23, prior to this git checkout was used to switch branches.

To checkout out with only a single remote repository:

git checkout test
if there there are multiple remote repositories configured it becomes a bit longer

git checkout -b test <name of remote>/test

 
 # Configure emails and name
    git config --global user.email "you@example.com"
    git config --global user.name "Your Name"

  # Initialize a repository on local
    echo "# otel-python" >> README.md
    git init
    git add README.md
    git commit -m "first commit"
    git branch -M main
    git remote add origin https://github.com/ashley26185/otel-python.git
    git push -u origin main
