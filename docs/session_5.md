# Session 5: File System, case and function

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
