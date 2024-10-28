# Session 4: Linux commands and Pipe

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