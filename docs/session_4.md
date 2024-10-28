# Session 4: Linux commands and File system

## `touch`

To create a new file.
For example:

```shell
user@host:~/os_lab$ touch example.txt
```

The code above creates a file called `example.txt`.

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



## `wc`

To get the **newline**, **word**, and **byte** counts of a file.
For example if we have a file like below

```text
line 1
line 2
line 3
line 4
line 5
```

If I run `wc` on it, it would be something like this:

```shell
user@host:~/os_lab$ touch example.txt
       4      10      34 example.txt
```

To explain the output, we can say we have **4** `\n` (newlines),
**10** words and **34** bytes(every character **1** byte, we have **6**
characters in each line, by having **5** lines it results in **6x5=30**
Also we have 4 `\n`, so it becomes **30+4=34**).

options:

* `-c`, `--bytes`: byte counts
* `-m`, `--chars`: character counts
* `-l`, `--lines`: newline counts
* `-w`, `--words`: word counts

## `more`

Display the contents of a file in terminal.
The program closes when we reach `EOF`.

```shell
user@host:~/os_lab$ more example.txt
```

Some handy shortcuts:

* `space`: continue
* `q`: quit

## `less`

It is similar to `more` with more features.
`less` is not required to read the entire file
before starting (loads chunks of the file),
so it has a better performance on reading large files.
It has a search and `vi` like navigation.

```shell
user@host:~/os_lab$ less example.txt
```

Some handy shortcuts:

* `g`: go to the top of the file
* `G`: go to the bottom of the file
* `/`: search forward
* `?`: search backward
* `q`: quit

## `head`

Outputs the first part of the file.
By default, it shows the first 10 lines.

```shell
user@host:~/os_lab$ head example.txt
```

options:

* `-n`: outputs the first n lines

## `tail`

Outputs the last part of the file.
By default, it shows the last 10 lines.

```shell
user@host:~/os_lab$ tail example.txt
```

options:

* `-n`: outputs the first n lines

## Redirect output to a file `>`

With `>` we can redirect an output of a `command` to a `file`.

```shell
command > file.txt
```

for example:

```shell
ls -l > r1.txt
```

In the example above we have redirected the output of `ls -l` to
a file with the name of `r1.txt`.

## Redirect input to a file `<`

With `<` we can redirect a file as an `input` to a `command`.

```shell
command < file.txt
```

for example:

```shell
ws -l < r1.txt
```

In the example above, we have redirected a file to
`wc -l` to see how many lines does it have.

## Pipe (`|`)

If we want to redirect the output of one command to another one,
we can use `|`.

```shell
command1 | command2
```

For example, we know `ls -l` shows the file and directory names
in lines with more details.
We can pass the output of it to `wc -l` to see how many lines
the output of `ls -l` has.

```shell
ls -l | wc -l
```

## `grep`

## regex

## Linux File System

<!--

	•	Hierarchical structure: The Linux file system is organized in a tree-like structure, with the root directory / at the top.
	•	Root directory (/): The base of the file system, all directories and files stem from this point.
	•	Common directories:
	    •	/bin: Essential binaries (executables) for system operation.
	    •	/boot: Files required to boot the system.
	    •	/dev: Device files (e.g., disks, peripherals).
	    •	/etc: Configuration files for system-wide settings.
	    •	/home: User directories, each user has their own subdirectory (e.g., /home/username).
	    •	/lib: Shared libraries needed by the binaries in /bin and /sbin.
	    •	/media or /mnt: Mount points for external file systems (e.g., USB drives, network storage).
	    •	/opt: Optional add-on software.
	    •	/proc: Virtual file system providing process and system information.
	    •	/root: Home directory for the root (superuser).
	    •	/sbin: System binaries for administrative tasks.
	    •	/tmp: Temporary files (often cleared at reboot).
	    •	/usr: Contains user utilities and applications.
	    •	/var: Variable files like logs, caches, and spool files.
	•	File types:
	    •	Regular files: Normal data files.
	    •	Directories: Containers for other files.
	    •	Device files: Represent hardware devices (block or character devices).
	    •	Links: Can be symbolic (soft) or hard, used to reference other files.
	    •	Sockets and pipes: For inter-process communication.
	•	Permissions:
	    •	Three types: read (r), write (w), and execute (x).
	    •	Assigned to three groups: owner, group, and others.
	•	Mounting: File systems (e.g., external drives, partitions) must be mounted to a directory before use.
	•	Inodes: Each file has an inode that stores metadata like file size, permissions, and ownership, but not the filename.
	•	File systems types:
	    •	ext4: Most common default file system in Linux.
	    •	xfs, btrfs, zfs: Other advanced file systems with specific features.
	•	Everything is a file: In Linux, almost everything is treated as a file, including hardware devices, processes, and sockets.

-->

### Hierarchical structure

Linux File System is like a tree.
Add the root of this tree called
`root` directory which is represented by `/`.
All the directories and files are stem from
`root` directory.
To give an **absolute** address of a file we can simply
start with root, for example, `/home/ramin/example.txt`

:::{note}
Install `tree` and find the most practical arguments.
Also explain the output of it.
:::

```text
.
|-- bin -> usr/bin
|-- boot
|-- dev
|   |-- console
|   |-- core -> /proc/kcore
|   |-- fd -> /proc/self/fd
|   |-- full
|   |-- mqueue
|   |-- null
|   |-- ptmx -> pts/ptmx
|   |-- pts
|   |-- random
|   |-- shm
|   |-- stderr -> /proc/self/fd/2
|   |-- stdin -> /proc/self/fd/0
|   |-- stdout -> /proc/self/fd/1
|   |-- tty
|   |-- urandom
|   `-- zero
|-- etc
|   |-- alternatives
|   |-- apt
|   |-- bash.bashrc
|   |-- bindresvport.blacklist
|   |-- cloud
|   |-- cron.d
|   |-- cron.daily
|   |-- debconf.conf
|   |-- debian_version
|   |-- default
|   |-- dpkg
|   |-- e2scrub.conf
|   |-- environment
|   |-- fstab
|   |-- gai.conf
|   |-- gnutls
|   |-- group
|   |-- group-
|   |-- gshadow
|   |-- gshadow-
|   |-- host.conf
|   |-- hostname
|   |-- hosts
|   |-- init.d
|   |-- issue
|   |-- issue.net
|   |-- kernel
|   |-- ld.so.cache
|   |-- ld.so.conf
|   |-- ld.so.conf.d
|   |-- legal
|   |-- libaudit.conf
|   |-- login.defs
|   |-- logrotate.d
|   |-- lsb-release
|   |-- machine-id
|   |-- mke2fs.conf
|   |-- mtab -> /proc/mounts
|   |-- networks
|   |-- nsswitch.conf
|   |-- opt
|   |-- os-release -> ../usr/lib/os-release
|   |-- pam.conf
|   |-- pam.d
|   |-- passwd
|   |-- passwd-
|   |-- profile
|   |-- profile.d
|   |-- rc0.d
|   |-- rc1.d
|   |-- rc2.d
|   |-- rc3.d
|   |-- rc4.d
|   |-- rc5.d
|   |-- rc6.d
|   |-- rcS.d
|   |-- resolv.conf
|   |-- rmt -> /usr/sbin/rmt
|   |-- security
|   |-- selinux
|   |-- shadow
|   |-- shadow-
|   |-- shells
|   |-- skel
|   |-- subgid
|   |-- subgid-
|   |-- subuid
|   |-- subuid-
|   |-- sysctl.conf
|   |-- sysctl.d
|   |-- systemd
|   |-- terminfo
|   |-- update-motd.d
|   `-- xattr.conf
|-- home
|   `-- ubuntu
|-- lib -> usr/lib
|-- media
|-- mnt
|-- opt
|-- proc
|   |-- 1
|   |-- 303
|   |-- buddyinfo
|   |-- bus
|   |-- cgroups
|   |-- cmdline
|   |-- config.gz
|   |-- consoles
|   |-- cpuinfo
|   |-- crypto
|   |-- device-tree -> /sys/firmware/devicetree/base
|   |-- devices
|   |-- diskstats
|   |-- docker
|   |-- driver
|   |-- execdomains
|   |-- filesystems
|   |-- fs
|   |-- interrupts
|   |-- iomem
|   |-- ioports
|   |-- irq
|   |-- kallsyms
|   |-- kcore
|   |-- key-users
|   |-- keys
|   |-- kmsg
|   |-- kpagecgroup
|   |-- kpagecount
|   |-- kpageflags
|   |-- loadavg
|   |-- locks
|   |-- meminfo
|   |-- misc
|   |-- modules
|   |-- mounts -> self/mounts
|   |-- net -> self/net
|   |-- pagetypeinfo
|   |-- partitions
|   |-- pressure
|   |-- self -> 303
|   |-- slabinfo
|   |-- softirqs
|   |-- stat
|   |-- swaps
|   |-- sys
|   |-- sysrq-trigger
|   |-- sysvipc
|   |-- thread-self -> 303/task/303
|   |-- timer_list
|   |-- tty
|   |-- uptime
|   |-- version
|   |-- vmallocinfo
|   |-- vmstat
|   `-- zoneinfo
|-- root
|-- run
|   |-- lock
|   `-- systemd
|-- sbin -> usr/sbin
|-- srv
|-- sys
|   |-- block
|   |-- bus
|   |-- class
|   |-- dev
|   |-- devices
|   |-- firmware
|   |-- fs
|   |-- kernel
|   `-- module
|-- tmp
|-- usr
|   |-- bin
|   |-- games
|   |-- include
|   |-- lib
|   |-- libexec
|   |-- local
|   |-- sbin
|   |-- share
|   `-- src
`-- var
    |-- backups
    |-- cache
    |-- lib
    |-- local
    |-- lock -> /run/lock
    |-- log
    |-- mail
    |-- opt
    |-- run -> /run
    |-- spool
    `-- tmp
```

### Common directories

#### `/bin`

Contains essential binaries (executables) for system operations.
For example, if we `ls`, `/bin` directory, we can see that
`pwd`, `ls`, `cp`, etc. are in it.

#### `/boot`

Contains the files that is needed to `boot` our system.
For example `GRUB` stores the files required for booting
in `/boot`.

<!-- TODO: fact check -->

#### `/dev`

`/dev` contains the device files.
These files can be **Character files**, **Block files** or **links**.




<!-- TODO: Complete it even more -->