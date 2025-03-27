# Session 4: Processes

## Goal

Write a script to monitor some specefic apps.

* If the app is not running, notify us.
* Report cpu usage
* Report memory usage
* If the app is taking so much cpu or memory, notify us.

## Bonus



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
| ---- | ----- | ------- |
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

To move files or rename them, we can use `mv`.
It's like **cuttuing** files.

```shell
mv source_path destination_path
```

For example:

```shell
mv f1.txt ramin/f1.txt
```

* `-f`, `--force`
  * Don't notify before overwriting
* `-i`, `--interactive`
  * Notify before overwriting
* `-v`, `--verbose`
  * Explain what is happening
* `-t`, `--target-directory`
  * Move all sources to target directory
* `-u`
  * If an update is needed, keeps the `old` one
* `-b`
  * Creates **backups** of the existing files
* `-n`, `--no-clobber`
  * Do not overwrite an existing file

## `rm`

Removes files and directories.

```shell
rm source_path
```

For example:

```shell
rm f1.txt
```

* `-r`, `--recursive`
  * Removes directories and their content **recursively**
* `-f`, `--force`
  * Force to remove targets, even if they are write-protected or don't exist
* `-i`, `--interactive`
  * Notify before each removal
* `-d`, `--directory`
  * Remove empty directories
* `-v`, `--verbose`
  * Explain what is happening

## `ln`

makes links between files.

```shell
ln target link_name
```

For example:

```shell
ln f1.txt ramin/f1.txt
```

* `-s`, `--symbolic`
  * Make symbolic (soft) links
* `-f`, `--force`
  * Remove existing destination files
* `-i`, `--interactive`
  * Notify before overwriting
* `-v`, `--verbose`
  * Explain what is happening

different types of links:

* **Hard link**
  * Point to the data to hard drive
* **Symbolic (soft) link**
  * Point to a file

![hard link vs soft link](figures/hard_vs_soft_links.jpg)

## `ps`

`ps` is a command to show the active processes.

```shell
ps [OPTION]...
```

For example:

```shell
ps
```

The command above shows the active processes of the current user.
By default it has the following columns:

* `PID`
  * Process ID
* `TTY`
  * Terminal
* `TIME`
  * Time
* `CMD`
  * Command

* `-a`
  * Shows all processes (without session leaders)
* `-e`
  * Shows all processes
* `-f`
  * Shows full format
* `-l`
  * Shows long format
* `-x`
  * Shows processes without terminals
* `-u`
  * Shows processes of the specified user

For example to get more information about the processes which are currently running:

```shell
ps -ef
```

One of the most used option is `aux`.
Despite being deprecated, it is still widely used.

```shell
ps aux
```

Columns in `ps aux` are:

* `USER`
  * User name
* `PID`
  * Process ID
* `%CPU`
  * Percentage of CPU usage
* `%MEM`
  * Percentage of Memory usage
* `VSZ`
  * Virtual memory size
* `RSS`
  * Resident set size
* `TTY`
  * Terminal
* `STAT`
  * Process status
* `START`
  * Start time
* `TIME`
  * CPU time
* `COMMAND`
  * Command

## `tty`

`tty` is a command to show the terminal name.

```shell
tty
```

## `kill`

To `kill` a process we can use the `kill` command.

```shell
kill -signal_number pid
kill -signal_name pid
```

For example:

```shell
kill 1234
```

We have different signals to send to the process, the most used one is `9` which means `SIGKILL`.
For example:

```shell
kill -9 1234
```

## `ctrl + c`

To terminate a process we can use `ctrl + c`.

## `ctrl + z`

To stop a process we can use `ctrl + z`.
The process goes to the background and after that we can contiue it again.

## `fg`

To continue a process which is stopped we can use `fg`.

## `bg`

To see the stopped processes we can use `bg`.

## `awk`

`awk` is a powerful text-processing tool in Linux.

```shell
awk 'pattern { action }' filename
```

We can do so may different things with `awk`.
Some of the basic things are:

* Feild processing
* Filter data

### Field processing

For example:

```shell
echo "s1 s2 s3" | awk '{print $2}'
```

the output will be `s2`.

### Filter data

For example:

```shell
echo -e "BTC 89.12\nETH 42\nDOGE 1.25" | awk '$2 > 30'
```

the output will be:

```text
BTC 89.12
ETH 42
```

### Combination of field processing and filter data

```shell
echo -e "BTC 89.12\nETH 42\nDOGE 1.25" | awk '$2 > 30 {print $1}'
```

## `bc`

`bc` (basic calculator) is a command-line calculator.
In normal bash we can't deal with float numbers.
But with `bc` we can achieve that.

```shell
bc
```

For example:

```shell
echo "2.3 + 5.1" | bc
```

result would be `7.4`.

## `top`

`top` is a powerful tool to monitor system performance in real time.
It shows infromation about the CPU, memory, swap, and processes.

```shell
top
```

We can devide the output of the `top` into two parts:

* Summary
* Processes

### Summary

```text
top - 10:23:45 up 2 days,  3:42,  2 users,  load average: 0.43, 0.57, 0.61
Tasks: 212 total,   2 running, 210 sleeping,   0 stopped,   0 zombie
%Cpu(s):  5.3 us,  1.2 sy,  0.0 ni, 93.2 id,  0.1 wa,  0.0 hi,  0.2 si,  0.0 st
MiB Mem :  7980.3 total,  3256.5 free,  1987.2 used,  2736.6 buff/cache
MiB Swap:  2048.0 total,  2048.0 free,     0.0 used.  5240.2 avail Mem
```

* Current time:
  * The current time.
  * `10:23:45`
* System uptime:
  * How long the system has been running.
  * `up 2 days,  3:42`
* Number of users:
  * The number of users currently logged in.
  * `2 users`
* Load average:
  * The average number of processes in the runnable queue over the last 1, 5, and 15 minutes.
  * `load average: 0.43, 0.57, 0.61`
* Tasks:
  * Total, running, sleeping, stopped, and zombie processes.
  * `Tasks: 212 total,   2 running, 210 sleeping,   0 stopped,   0 zombie`
* CPU usage:
  * `us` (User): time spent running user processes.
  * `sy` (System): time spent running kernel processes.
  * `ni` (Nice): time spent running niced processes.
  * `id` (Idle): time spent idle.
  * `wa` (I/O Wait): time spent waiting for I/O operations to complete.
  * `hi` (Hardware IRQ): time spent servicing hardware interrupts.
  * `si` (Software Interrupts): time spent servicing software interrupts.
  * `st` (Steal): time spent in other operating systems when running in a virtualized environment.
  * `%Cpu(s):  5.3 us,  1.2 sy,  0.0 ni, 93.2 id,  0.1 wa,  0.0 hi,  0.2 si,  0.0 st`
* Memory usage:
  * Total memory, free memory, used memory, and memory used for buffers and cache.
  * `MiB Mem :  7980.3 total,  3256.5 free,  1987.2 used,  2736.6 buff/cache`
* Swap usage:
  * Total swap, free swap, used swap, and available memory.
  * `MiB Swap:  2048.0 total,  2048.0 free,     0.0 used.  5240.2 avail Mem`

### Processes

```text
  PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
 1234 user      20   0  400000  30000   5000 R   12.3  1.2   0:01.23 firefox
 5678 root      20   0  250000  20000   3000 S    2.0  0.8   0:00.56 systemd
```

* `PID`: Process ID.
* `USER`: User who owns the process.
* `PR`: Priority.
* `NI`: Nice value.
* `VIRT`: Virtual memory used by the process.
* `RES`: Resident memory used by the process.
* `SHR`: Shared memory used by the process.
* `S`: Process status.
  * `R`: Running.
  * `S`: Sleeping.
  * `D`: Waiting for I/O.
  * `Z`: Zombie.
* `%CPU`: CPU usage.
* `%MEM`: Memory usage.
* `TIME+`: Total CPU time.
* `COMMAND`: Command name.

### useful shotcuts

* `q`
  * Quit `top`.
* `h`
  * Show help.
* `k`
  * Kill a process.
* `r`
  * Renice a process. (for this you should have root privilages)
* `u`
  * Filter by user.
* `M`
  * Sort by memory usage.
* `P`
  * Sort by CPU usage.
* `m`
  * Toggle memory summary.
* `t`
  * Toggle process summary.
* `1`
  * Toggle CPU summary.
* `c`
  * Toggle command name.
* `i`
  * Toggle idle processes.
* `n`
  * Set the number of processes to show.
* `W`
  * Write the current configuration to a file.
* `Z`
  * Add color theme.
* `z`
  * Toggle color theme.

## `read`

To read input from the user, you can use the `read` command.

For example:

```shell
read name
```

## range

To define a range we can use `{start..end}`.
For example:

```shell
echo {1..5}
```

Output:

```text
1 2 3 4 5
```

We can also add a step to the range.
For example:

```shell
echo {1..5..2}
```

output:

```text
1 3 5
```

## list

To define a list in bash we can do like below:

```shell
list=("apple" "banana" "cherry")
```

To access one of its elements we can use index like below:

```shell
echo ${list[0]}
```

To access all elements of a list in a string we can use `*` like below:

```shell
echo ${list[*]}
```

To accress all elements of a list in a way that we can iterate over them we can use `@` like below:

```shell
echo ${list[@]}
```

## `for`

The main syntanx of `for` loop in bash is like below:

```shell
for variable in list; do
    # your code here
done
```

For example:

```shell
for i in {1..5}; do
    echo $i
done
```

Output:

```text
1
2
3
4
5
```

In the example above we iterate over the range from 1 to 5 and print each number.

To iterate over arguments we can use:

```shell
for arg in "$@"; do
    echo $arg
done
```

To iterate over a list of strings we can use:

```shell
for str in "apple" "banana" "cherry"; do
    echo $str
done
```

To iterate ove all the files in a directory we can use:

```shell
for file in dir1/*; do
    echo file
done
```

To iterate over all the content of a file we can use:

```shell
for line in $(cat filename); do
    echo $line
done
```

To iterate over a predefined list we can use:

```shell
a = ("apple" "banana" "cherry")
for fruit in "${a[@]}"; do
    echo $fruit
done
```

We can also have `c` like for loop.
For example:

```shell
for (( i=0; i<10; i++ )); do
    echo $i
done
```

## `while` statement

The main syntax of `while` in `bash scripting` is:

```shell
while condition; do
    # Your code here
done
```

We can use all the conditions that we could use for the `if` in the `while` as well.

For example:

```shell
i=0
while [ $i -lt 5 ]; do
    echo $i
    i=$((i + 1))
done
```

Output:

```text
0
1
2
3
4
```

On the code above, we have a variable called `i` which initialized to 0.
The `while` loop checks if `i` is less than 5.
If it is, the loop body executes, which prints the value of `i` and then increments `i` by 1 using the `=$((i + 1))` syntax.

We can get all the lines of the file like below:

```shell
while read line; do
    echo $line
done < filename.txt
```

We can have an infinite `while`, like below:

```shell
while true; do
    echo "Infinite loop"
done
```

We can use a command as a condition like below:

```shell
while grep -q "hello" filename.txt; do
    echo "Hello found!"
    sleep 1
done
```

## `break`

You can use the `break` statement inside a `while` loop to exit the loop prematurely.

For example:

```shell
while true; do
    read a
    if [ $a -eq 0 ]; then
        break
    fi
done
```

## `sleep`

The `sleep` command in `bash scripting` is used to pause the execution of a script for a specified number of seconds.
For example:

```shell
sleep 5
echo "5 seconds have passed"
```
