# Session 2: Basic commands

## Goal

* make a simple backup script

### Bonus point

* add a date to the name of the backup directory

## Some necessary things in terminal

When you open up a `terminal` in `Ubuntu`
These are things that you see by default

```shell
user@host:~$
```

* `user`
* `@`
* `host`
* `:`
* `~` : This indicates the Home directory of the current user
* `$`: We are in a user mode

## Command structure

Every command in linux follows a structure, like below:

```shell
command [options] [arguments]
```

for example:

```shell
ls -l /etc
```

* `Command`: `ls`
* `Option`: `-l`
  * Options can be more complicated
* `Argument`: `/etc`

## `ls`

ls stands for List.
It displays the list of files in the target directory.
It takes a path as an argument.
If we don't give it an argument, it shows the list
of files in the current directory:

```shell
user@host:~$ ls
Desktop Documents Music Pictures Public Videos
```

With an argument we can display our target directory,
for example:

```shell
user@host:~$ ls os_lab
dir1 dir2 f1.txt f2.txt
```

### `-l`

It shows us more details about the files.

for example:

```shell
user@host:~$ ls -l os_lab
total 8
drwxrwxr-x 2 user group 4096 Oct  1 21:59 dir1
drwxrwxr-x 2 user group 4096 Oct  1 21:59 dir2
-rw-rw-r-- 1 user group    0 Oct  1 21:59 f1.txt
-rw-rw-r-- 1 user group    0 Oct  1 22:00 f2.txt
```

Analyzing this is necessary, and we should learn how to
understand it.

* `total 8`: total blocks needed to store that file.
  similar results when we use `ls -s`. Be careful that is
  not recursive. `du` can be used to get disk usage.

* `drwxrwxr-x`: we can see it as 2 parts for now:
  * `d`: file type, it can be:
    * `-`: Normal file
    * `d`: Directory
    * `l`: Link file
    * `c`: character file
    * `b`: block file
  * `rwxrwxr-x`: shows permissions that we are going to discuss
      it later.
* `user`: which user owns the file
* `group`: which group it belongs to
* `4096`: size that is needed to store it
* `Oct 1 21:59`: creation date
* `dir1`: name of the file

### `-a`

It shows all the files, even if they are hidden.
It also shows the current directory (`.`) and parent
directory (`..`).
For example:

```shell
user@host:~$ ls -a os_lab
. .. dir1 dir2 f1.txt f2.txt .hf.txt
```

In the example above `.hf.txt` is a hidden file.
Hidden files in `Linux` are mostly start with `.`.

### Combinations

We can combine options in a command for example:

```shell
user@host:~$ ls -la os_lab
total 16
drwxrwxr-x  4 ramin ramin 4096 Oct  1 22:48 .
drwxr-x--- 36 ramin ramin 4096 Oct  1 22:33 ..
drwxrwxr-x  2 ramin ramin 4096 Oct  1 22:10 dir1
drwxrwxr-x  2 ramin ramin 4096 Oct  1 21:59 dir2
-rw-rw-r--  1 ramin ramin    0 Oct  1 21:59 f1.txt
-rw-rw-r--  1 ramin ramin    0 Oct  1 22:00 f2.txt
-rw-rw-r--  1 ramin ramin    0 Oct  1 22:48 .hf.txt
```

### More options

There are more options that can be used.

## `man`

`man` stands for manual.
We can use it to get the manual of the most
`Linux` commands.

For example:

```shell
user@host:~$ man ls
```

`man` supports `vi` basic commands.
(You can press `H` to enter the help and see all the capabalities).
For example to search in a `man` window we can use, `/` followed by the pattern.
To search **list**, we can use: `/list`.
(`n` goes to the next result and `Shift+n` goes to the previous result).

## `mkdir`

To create a new directory.

for example:

```shell
user@host:~$ mkdir dir3
```

### `-p`

This option helps us to create the parent
directories if they don't exist.

```shell
user@host:~$ mkdir dir4/dir5
```

## `touch`

To create a new file we can use `touch`.

```shell
touch file
```

For example:

```shell
touch example.txt
```

In the example above, a file with the name of `example.txt` is created.

## `cd`

This command helps us to change the working directory.

for example:

```shell
user@host:~$ cd os_lab
user@host:~/os_lab$
```

All paths in Linux are started with `root`(`/`).
Different directories are separated with `/`.

* If we want to change to the parent directory:
  * `cd ..`
* Move to `root directory`:
  * `cd /`

## `clear`

To clear the terminal.

## `cp`

To copy file or directory from the source to destination path.

```shell
cp source_path destination_path
```

For example:

```shell
cp f1.txt ramin/f1.txt
```

To copy a directory we can use `-r` option, which stands for `recursive`.

Important options:

* `-r`, `--recursive`
  * To copy recursively, can be used to copy directories
* `-f`, `--force`
  * If the desitination file cannot be oppend, remove it and try again
* `-l`, `--link`
  * Create a `hard link` instead of copying
* `-v`, `--verbose`
  * Explain what is happening
* `-i`, `--interactive`
  * Notifies us if we want to overwrite  
* `-p`
  * Keeps the ownership, timestamps
* `-u`
  * If an update is needed, keeps the `old` one

## echo

To print something in the terminal.

```shell
echo hi
```

## define a variable

To define a variable we can simply use `=`.
For example:

```shell
a="Hello"
```

## Get the value of a variable

To get the value of a variable, we can use `$`.
For example:

```shell
echo $a
```

## ${}

`${}` is like `$` but with more advanced features.
For example:

```shell
a="Operating System Laboratory"
echo "Hello: ${a}"
```

There are multiple advantages that ${} has over $:

* can extend it easier: ${a}another
* You can manipulate string with it
  * slicing: ${a:0:5} -> "Oper"
  * substring replacement: ${a/Operating/new} -> "new System Laboratory!"
* length: ${#a} -> 21
* default value: ${var:-default_value} -> default_value if var is not set.
* working with arrays: ${array[0]} -> first element of the array.

## Command substitution

You can use command substitution `$()` to get the output of a command.

For example:

```shell
a=$(ls)
```

## Backup script

Now let's put all the things that we have learned together and
write a script that anytime that we run it, it takes a backup
of a certain directory by copying all the content of it.
