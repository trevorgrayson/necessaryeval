---
title: ENV VARS (Environment Variables)
date: 2020-02-27 23:09:23
tags: 
---

Environment Variables or "ENV vars" are under used and often misunderstood.
They are critical for separating configuration from any code you write. By
learning how to use this SHELL resource in your programs your code will
become more extensible and useful to a larger group of people and environments.

## What is an ENV Var?

Environment Variables are variables for your Terminal Shell. They are passed to every
program you run and can be used by those programs.  If you run commands in your IDE,
these are still in play (there is probably a field that you could define these in.)

Do I have ENV Vars? Yes.  From a terminal, type:

```
env
```

That's all of them!  Ignore some of the gobblety-gook. Get these right and your
work environment will "just work" and feel magical. Some worth pointing out:

- `USER`: Want to default to using your username in your code? How about defaulting to the username of whomever is using the code? Use this variable.
- `HOME`: How many times do you have `/Users/{your_username}/...` pasted in your code? Use this variable. Or maybe you want to use...
- `PWD`: Your Present Working Directory.
- `EDITOR`: Choose what editor application will open when you need to edit a file. (Think git asking for commit message.) `vim`, `nano` are examples, but there is no reason you can't use Sublime or any IDE!
- `PATH`: A `:` separated list of where your terminal looks for programs to run. FUN!
- `PS1`: Change the prompt in your terminal.

## Using ENV Vars

ENV vars do everything you expect a variable to do in any programming environment.  See this example in `bash`, and most shells.

```
# set it
export MYVAR=123

# read it
echo $MYVAR

# remove it!
unset MYVAR

```

These values are useful if you're doing regular tasks in your terminal...

```
curl $MY_FREQUENTLY_USED_SERVICE
```

...and they also are a great way to inject configuration into your programs!  After you "export" your variable 100% of the programs you run in that terminal will get the variable passed to it.  Most programs may ignore it, but your program won't

In python, as an example you can retrieve env vars with:

```
from os import environ

required_var = environ['REQUIRED_VAR']  # will throw a `KeyError` if doesn't exit.

SOME_DEFAULT_VALUE = 456
myvar = environ.get("MYVAR", SOME_DEFAULT_VALUE)
```

`SOME_DEFAULT_VALUE` is optional, it could just be excluded, but if you can do something useful with your program without it defined consider adding a useful default value.  Maybe you need a folder to save data into, no good ideas to put it? `$HOME` may make sense.

This will look for a `DATA_DIR` variable that they could have set, or it will default reasonably to a directory called `data` in their home directory.

```
from os import environ

DEFAULT_DIR = environ.get("HOME") + "/data"
DATA_DIR = environ.get('DATA_DIR', DEFAULT_DIR)
```

Are you pretty sure about some constant value you're setting, but you may change it in the future?  Optional ENV Variable is a slam dunk.  You don't even have to export the variable, you can define it on the same line as your command.

```
DATA_DIR=/var/data/ python myscript.py
```

Usernames, Passwords, sensitive data?  You got it, ENV Vars.

```
USER = environ.get("USER")         # defaults to the username on the computer
PASS = environ.get("MY_APP_PASS")  # not saved into github anymore!!
```

You'll get bored of setting these quickly, and miss the biggest strength of env vars if you don't have your env vars set for you as you open your terminal.  Look in your `$HOME` directory (`ls -al $HOME`) and you'll find "rc" files.  Maybe `.zshrc` or `.bashrc`.  These configuration files are executed whenever you open a new terminal.  You can put any code you'd like run before your sessions start in these files.  `export` your ENV Vars here!

```
# ~/.zshrc
export SERVICE_HOST=whatever.com
```

Now you can always refer to `$SERVICE_HOST` in your terminals or programs!  Save it once, use it always!

By separating the configuration of your app from your code you will be able to quickly reconfigure your code (am I pointing to my local machine, staging or production?) and more easily share config dependent code  with others!
