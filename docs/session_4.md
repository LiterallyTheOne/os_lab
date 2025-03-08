# Session 4

## `chmod`

Is a command to change the permissions of a file or directory.

```shell
chmod [OPTION]... MODE[,MODE]... FILE...
```

In Linux, each file or directory has three types of permisssions:

* read (r)
* write (w)
* execute (x)

And each file or directory has three types of users:

* owner (user) (u)
* group (g)
* others (o)

for example if we have `rwxr-xr--` it means:

* owner can read, write and execute
* group can read and execute
* others can only read

With `chmod` we can change these permissions.
There are two ways to change the permissions:

### Symbolic method

In symbolic method, we can use the following symobls to controll users:

* `u` for user (owner)
* `g` for group
* `o` for others
* `a` for all

Also we can use the following symbols to change permissions:

* `+` to add permission
* `-` to remove permission
* `=` to set permission

And we can use these symbols for the permissions themselves:

* `r` for read
* `w` for write
* `x` for execute

For example:

```shell
chmod u+x file
```

In the example above we have added execute permission to the owner of the file.

Another example:

```shell
chmod g-w file
```

In the example above we have removed write permission from the group of the file.

Another example:

```shell
chmod a=rw file
```

In the example above we have set read and write permissions for all users (owner, group, others).

### Numberic method

In this method we use numbers to change the permissions.

| read | write | execute |
|------|-------|---------|
| 4    | 2     | 1       |

For example:

```shell
chmod 754 file
```

In the example above we have set read, write and execute permissions for the owner of the file,
read and execute permissions for the group
and read permission for others.

* 7 = 4 + 2 + 1 = rwx
* 5 = 4 + 1 = rx
* 4 = 4 = r

## Use chmod instead of `sh` or `bash` for our executable scripts

Now we can use `chmod` to make our scripts executable.
Previously we used `sh` or `bash` to run our scripts.
The only thing that we should do is at first line of our script add the following line:

```shell
#!/bin/bash
```

This line tells the system to use `bash` to run the script.

Then we can use `chmod` to make the script executable for the owner of the file:

```shell
chmod u+x script.sh
```

## `mv`

## `rm`

## `top`

## `ps`

## `ln`

## `read`

## `for`

## `while`

## `switch case`
