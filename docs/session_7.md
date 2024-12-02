# Session 7: user control and bash scripting

## `useradd`

To add a new user in Linux, you can use the `useradd` command.

```shell
sudo useradd [options] username
```

for example:

```shell
sudo useradd -m username
```

The command above, creates a new user named `username`.
The `-m` option tells `useradd` to create a home directory for the new user.

Options:
* `-m`, `--create-home`
  *  Create a home directory for the new user.
* `-d`, `--home-dir /path/to/home`
  *  Specify the path to the home directory.
* `-s`,`--shell /bin/bash`
  *  Set the default shell for the new user.
* `-G`, `--groups`
  *  Add groups to the new user.
* `-c`, `--comment`
  *  Set the comment for the new user.

```{note}
To see if a user is created or not you can use the following command:

`cat /etc/passwd | grep username`

```

## `passwd`

To set a password for a user, you can use the `passwd` command.

```shell
sudo passwd username
```

it will get prompt to enter and confirm the new password.


## `usermod`

To modify an existing user in Linux, you can use the `usermod` command.

```shell
sudo usermod [options] username
```

For example:

```shell
sudo usermod -aG sudo username
```

The `-aG` option tells `usermod` to append the new user to the existing groups.

Options:
* `-a`, `--append`
  *  Append the new user to the existing groups.
* `-G`, `--groups`
  *  Add groups to the new user.
* `-c`, `--comment`
  *  Set the comment for the new user.
* `-d`, `--home-dir /path/to/home`
  *  Specify the path to the home directory.
* `-s`,`--shell /bin/bash`
  *  Set the default shell for the new user.
* `-g`, `--group`
  *  Change the primary group of the existing user.
* `-e`, `--expire-date YYYY-MM-DD`
  *  Set the password expiration date.
* `-l`, `--login-name username`
  *  Change the login name of the existing user.
* `-L`, `--lock-passwd`
  *  Lock the password for the existing user.
* `-U`, `--unlock-passwd`
  *  Unlock the password for the existing user.
* `-u`, `--user-id uid` 
  *  Change the user ID of the existing user.

## `userdel`

To delete a user in Linux, you can use the `userdel` command.

```shell
sudo userdel username
```

For example:

```shell
sudo userdel -r username
```

The command above, deletes the user named `username`.
The `-r` option tells `userdel` to remove the home directory of the new user.

Options:
* `-r`, `--remove`
  *  Remove the home directory of the existing user.
* `-f`, `--force`
  * Force delete the user without prompting for confirmation.

## `date`

To display the current date and time, you can use the `date` command.

```shell
date [+format]
```

For example:

```shell
date +"%Y-%m-%d %H:%M:%S"
```

The format string is used to specify how the date should be displayed. For example, `%Y-%m-%d %H:%M:%S` displays the date and time in the format of `YYYY-MM-DD HH:MM:SS`.

## Bash scripting

You can use bash scripting to automate tasks on Linux.

First let's create a new file with `.sh` extension:

```shell
touch script.sh
```

Then you can write your bash script in this file.
For example, here is a simple script that prints "Hello World!" to the console:

```shell
#!/bin/bash

echo "Hello World!"
```

The example above, uses the shebang line (`#!/bin/bash`) to specify the interpreter for the script.
The `echo` command is used to print a message to the console.

To make the script executable, you can use the `chmod` command:

```shell
chmod u+x script.sh
```

Now you can run the script by executing it with the `./script.sh` command. 

the output would be like below:

```text
Hello World!
```

## `echo`

To display text on the console, you can use the `echo` command.

For example:

```shell
echo "Hello World!"
```

## `read`

To read input from the user, you can use the `read` command.

For example:

```shell
read name
```

## Define a variable

You can define a variable in bash using the `=` operator.

For example:

```shell
a="Operating System Laboratory"
```

## Get the value of a variable

You can get the value of a variable using the `$` symbol.

For example:

```shell
echo $a
```

```{note}
`$` is good if you want to only use the variables content.
for more advanced features you should use `${}`.
```

## `${}`

In bash scripting, `${}` is used to access variables and perform operations on them.

For example:

```shell
echo "We are in ${a}!"
```

output:

```text
We are in Operating System Laboratory!
```

There are multiple advantages that `${}` has over `$`:

* can extend it easier: `${a}another`
* You can manipulate string with it
  * slicing: `${a:0:5}` -> "Oper"
  * substring replacement: `${a/Operating/new}` -> "new System Laboratory!"
  * length: `${#a}` -> 21
* default value: `${var:-default_value}` -> `default_value` if `var` is not set.
* working with arrays: `${array[0]}` -> first element of the array.


## Arguments

You can pass arguments to a bash script when you run it.

For example:

```shell 
./script.sh "Hello" "World"
```

The code above passes two arguments `"Hello"` and `"World"` to the `script.sh` file.
You can access these arguments in your script using `$1`, `$2`, etc.

For example if we have a script like this:

```shell
#!/bin/bash

echo "First argument: $1"
echo "Second argument: $2"
```

the output of `./script.sh "Hello" "World"` would be:

```text
First argument: Hello
Second argument: World
```

* `$0`: the name of the script.
* `$1`, `$2`, etc.: the individual arguments passed to the script.
* `$#`: the number of arguments passed to the script.
* `$@`: all the arguments passed to the script as a list.
* `$*`: all the arguments passed to the script as a single string.


## Write a backup script

Now lets write a script that backups the files of the given directory.
The result directory should be in this format:

* `backup-YY-MM-DD-HH-MM-SS)`

the code for doing that would be something like below:

```shell
#! /bin/bash

# name our directory
target_dir="backup-$(date +%Y-%m-%d-%H-%M-%S)"

# create the backup directory
mkdir $target_dir

# copy all files from the source directory to the target directory
cp -r $1 $target_dir

echo "done"
```