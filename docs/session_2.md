# Session 2: Basic commands

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
