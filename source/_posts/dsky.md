---
title: dsky
date: 2020-02-27 23:09:23
tags:
---

Let's talk about you.  You're a developer. You work on several projects. You
use version control, probably git, and you have stuff you need to get done.
Writing code, in multiple projects. Running, testing, and serving these projects.
And you probably even are stumbling through conjuring up some weird incantations
to get stuff done in the command line.  `dsky` has some solutions for you.


## The Concept of DSKY 

The basic concept of Apollo 11's computer, DSKY, was that you can specify any 
unique task with only a NOUN and a VERB.

`dsky` is a NOUN VERB language for expressing what you would like to do in your 
projects.

Read up about the history of [DSKY](https://en.wikipedia.org/wiki/Apollo_Guidance_Computer#DSKY_interface)
on this anniversary year of Apollo 11!

### NOUNs

Presently NOUNs are exclusively git repos. 

For any command, DSKY will:

* attempt to `cd` into ~/projects/$NOUN
* if the folder doesn't exist, it will try to go to your `$REPO` and download a 
project `$NOUN`.
* if it found the folder, it will attempt to `git fetch` to notify you of 
updates to the codebase.

### VERBs

What would you like to do?

* isgo - PROJECT INITIALIZING - in a microservice world, why are you checking things out?
* Execute anything.
  * `compile`, `test`, `package`, `deploy` projects
* github - go to the project's github page
* (e)dit   - cd to the project's directory, and open your favorite `$EDITOR`

#### isgo

PROJECT INITIALIZING. This is core benefit to this system, and it involves several stages of 
your dev cycle. Let's say you decide to work on a project. It could be yet another time, or
your very first time working on it.  Why do you have to distinguish? Just define the project,
which can usually be one name. This name is probably the project's name in git. This project
is `humane-api` or probably `trevorgrayson/humane-api` to you, since you're not working on it.

`dsky trevorgrayson/humane-api isgo` will:

1. confirm the project is local on your computer. check it out if necessary. 
2. change to the directory of the project, as we will be working in it.
3. fetch any updates to the code base, and print them on screen when possible.
this is your "news" update for the project. what have your co-contributors been doing?
4. display the status of the current checkout. what did your forget to check in last time?
what weird branch are you on?
5. command prompt. get to work.

see the `install` section if you want to personalize this a bit better.

#### github

```
dsky $PROJECT_NAME github
```

general status of project

```
dsky $PROJECT_NAME stat
```

List of open PRs.

```
dsky $PROJECT_NAME pr
```

checkout remote branch or tag

```
dsky $PROJECT_NAME checkout $TAG
```

## Getting Started

### Install `dsky`

`dsky` is a single file bash script.  You will want to install it somewhere in 
your `$PATH`.  What's your [$PATH]()? This will work if you have write access 
to the first directory in your `$PATH`. 

Feel free to `curl` or `wget` it into a different folder.

```
curl necessaryeval.com/dsky > `echo $PATH | cut -d: -f1`/dsky
```

### env variables

Here are some good variables to have set for these projects, or in general.

```
export PROJECTS=$HOME/projects
export GIT_HOST=git@github.com
export GIT_USER=grevrtrayson

alias dsky=". dsky" # will let dsky change your directory for you.
```
`export GIT_HOST` into your ENV, or set it [perminantly]().

#### $REPO

