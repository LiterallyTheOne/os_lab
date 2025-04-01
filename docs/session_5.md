# Session 5: File System, case and function

## Goal

Make a file system manager with the menu like below:

1) Create Directory
2) List Files in Directory
3) Create File
4) Write to File
5) Read File
6) Delete File
7) Exit


## File System

Linux file system is a tree-like structure.
The root directory is `/`.
We can say everything in Linux is a file.
In this session we are going to go through the main directories and explain what they are used for.

### `/bin`

`/bin` stands for binary.
It contains the essential binaries which is related to the user.
For example:

* `ls`
* `cp`

In modern Linux distributions, `/bin` is a symbolic link to `/usr/bin`.

### `/sbin`

`/sbin` stands for System Admininstration binaries.
It contains binaries which is only accessable to the `superuser`.
For example:

* `ifconfig`
* `ip`
* `mount`
* `shutdown`
* `fdisk`

### `/boot`

`/boot` contains the files needed to boot the system.
For example:

* `vmlinuz` (Linux kernel)
* `initrd.img` (initial RAM disk image)
* `grub` (bootloader)

### `/dev`

`/dev` contains the device files.
Device files represent hardware devices and pseudo-devices.
For hardware devices we have two types of files:

* block devices (`b`)
  * Data is read/written in blocks
  * For example: hard disks, USB drives, CD-ROMs
* character devices (`c`)
  * Data is read/written one character at a time
  * They have direct access to the hardware
  * For example: keyboard, mouse, serial ports

* `/dev/sda` or `/dev/nvme0n1`
  * First hard disk

* `/dev/stdin`
  * Standard input
* `/dev/stdout`
  * Standard output
* `/dev/stderr`
  * Standard error

* `/dev/pts`
  * Pseudo-terminal (If you open a terminal, it creates a pseudo-terminal)
* `/dev/tty`
  * Terminal device file (represents the terminal)

* `/dev/null`
  * Null device (discards all data written to it)
  * It is used to suppress output
* `/dev/zero`
  * Null device that returns zero bytes
  * It is used to create empty files
* `/dev/full`
  * Null device that returns no space left on device
  * It is used to create files with no space left

* `/dev/random`
  * random number generator
  * Uses true entropy from environmental noise (keyboard, mouse, etc.)
* `/dev/urandom`
  * Non-blocking random number generator
  * It is faster than `/dev/random`

* `/dev/shm`
  * Shared memory
  * It is used for inter-process communication (IPC)

### `/etc`

`/etc` contains the configuration files for the system.

* `/etc/fstab`
  * File system table
  * It contains the information about the file systems
* `/etc/systemd`
  * Systemd configuration files (services)
* `/etc/passwd`
  * User account information
* `/etc/shadow`
  * User password information
* `/etc/group`
  * Group account information
* `/etc/hostname`
  * Hostname of the system
* `/etc/hosts`
  * Hostname resolution
* `/etc/resolv.conf`
  * DNS resolver configuration
* `/etc/sudoers`
  * Sudoers file (user permissions)

### `/home`

`/home` contains the home directories of the users.
For example:

* `/home/ramin`
  * Home directory of user `ramin`

### `/lib`

`/lib` contains the shared libraries needed by the binaries in `/bin` and `/sbin`.
For example:

* `libc.so`
  * C standard library
* `libm.so`
  * Math library
* `libpthread.so`
  * POSIX threads library

### `/media`, `mnt`

Mount points for removable media.

### `/opt`

`/opt` contains optional software packages.
For example:

* `/opt/google`
  * Google software packages

### `/proc`

`/proc` is a virtual file system that contains information about the system and processes.
Each process has a directory in `/proc` with its `PID`.
In each directory, you can find these files:

* `cmdline`
  * Command line arguments of the process
* `cwd`
  * Current working directory of the process
* `environ`
  * Environment variables of the process
* `fd`
  * File descriptors of the process
* `stat`
  * Process status information
* `status`
  * Process status information (human-readable format)

Also in `/proc` you can find:

* `/proc/cpuinfo`
  * Information about the CPU
* `/proc/meminfo`
  * Information about the memory
* `/proc/version`
  * Information about the kernel version
* `/proc/uptime`
  * System uptime
* `/proc/sys`
  * Kernel parameters (sysctl)
* `/proc/vmstat`
  * Virtual memory statistics
* `/proc/devices`
  * Character and block devices recognized by the kernel
* `/proc/diskstats`
  * Disk statistics
* `/proc/partitions`
  * Information about the partitions
* `/proc/loadavg`
  * System load average
* `/proc/config.gz`
  * Compressed kernel configuration file
* `/proc/mounts`
  * Information about the mounted file systems
* `/proc/self`
  * Information about the current process

### `/root`

`/root` is a home directory for the root user.

### `/tmp`

`/tmp` is a directory for temporarily files.

### `/usr`

`/usr` stands for **Unix System Resources** (user).
It contains software and data that is shared among all users.

* `/usr/bin`
* `/usr/sbin`
* `/usr/lib`
* `/usr/local`
* `/usr/share`
* `/usr/include`
* `/usr/src`

### `/var`

`/var` contains variable files like logs and caches.

## `case`

To write a `case` statement in bash script, we can use the following syntax:

```bash
case $variable in
    pattern1)
        # code to execute if variable matches pattern1
        ;;
    pattern2)
        # code to execute if variable matches pattern2
        ;;
    *)
        # default code to execute if none of the patterns match
        ;;
esac
```

For example:

```bash
echo "Enter your name: "
read name
case $name in
    "Ramin")
        echo "Hello, Ramin!"
        ;;
    "Merhan")
        echo "Hello, Mehran!"
        ;;
    *)
        echo "Hello, stranger!"
        ;;
esac
```

Another example with range:

```bash
echo "Enter a number between [1-3]: "
read num
case $num in
[1-3])
    echo "${num}*2=$((num * 2))"
    ;;
*)
    echo "Invalid number"
    ;;
esac
```

## `function`

You can define a function in a bash script in 2 ways:

* first way:

```shell
function_name() {
    # Commands to execute
    # Use arguments with $1, $2, ..., $n for inputs
}
```

```{note}
parantheses should be empty.
```

* second way:

```shell
function function_name {
    # Commands to execute
    # Use arguments with $1, $2, ..., $n for inputs
}
```

For example:

```shell
f1() {
    echo "Hello"
}

f1
```

The example above is a simple function without passing any argument to it.

Another example:

```shell
f2() {
    echo "Hello $1"
}

f2 "Ramin"
```

The code above gets one argument.

Antoher example:

```shell
f3() {
    echo "$(($1 + $2))"
}

f3 2 5
```

The code above takes two arguments and returns the sum of them.
