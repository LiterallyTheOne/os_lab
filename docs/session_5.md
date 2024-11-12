# Session 5: text editors, grep, regex

## `gedit`

`gedit` is a default text editor for `GNOME`.
It is simple and useful.
It has a good `GUI`.

```shell
gedit
```

## `nano`

Nano is a small and simple text editor for use on the terminal.
It copied the interface and key bindings of the Pico editor but
added several missing features:
* undo/redo
* syntax highlighting
* line numbers
* softwrapping
* multiple buffers
* selecting text by holding Shift
* search-and-replace with regular expressions
* and several other conveniences.

It is pretty handy when it comes to:
* quick edits
* configuration file changes,
* working via ssh

```shell
nano file1.txt
```

Here is a look of it:

![Nano example](figures/nano_example.png)

As you can see options and shortcuts are displayed on the bottom of the terminal.

Useful shortcuts:
* `Ctrl + O`: Save
* `Ctrl + X`: Exit
* `Ctrl + K`: Cuts the entire line
* `Ctrl + U`: Paste at cursor
* `Ctrl + W`: Find 
* `Ctrl + \`: Replace

## `vim`

`Vim` is a powerful and highly configurable text editor that runs in the terminal.
It is based on `Vi`.
It is super effient when you master it.
So many developers love `Vim`.
Most Unix-based operating systems include `Vim` as thier text editor.

### `Vim` modes

`Vim` has different modes:

* Normal mode:
  * For navigation and text manipulation
* Insert mode:
  * For typing text (enter by `i`)
* Visual mode:
  * To select a text (enter by `v`)
* Command mode:
  * To execute commands (enter by `:`)
* Replace mode:
  * To replace existing text by directly writing on it (enter by `R`)

### Open and close

* Open a file: `vim file1.txt`
* Save: `:w`
* Close: `:q`
* Save and close: `:wq`

### Navigation

* `h`: left
* `j`: down
* `k`: up
* `l`: right
* `w`: go to the start of the next word
* `e`: go to the end of the next word
* `b`: go to the start of the previous word
* `gg`: go to the start of the file
* `G`: go to the end-of-art of the file
* `0`: go to the start of the line
* `^`: go to the first non blank character in line
* `$`: go to the end of the line

### editing

* `x`: delete a character under the cursor
* `dw`: delete a word under the cursor

### Insert mode

To enter insert mode there are different options, some of them are:

* `i`: enter insert mode before the cursor
* `a`: enter insert mode after the cursor
* `o`: open a new line and enter insert mode

### Visual mode

To enter visual mode there are different options, some of them are:

* `v`: enter visual mode
* `V`: enter line-wise visual mode
* `ctrl+v`: enter column-wise visual mode


## `ln`

makes links between files.

```shell
ln target link_name
```

For example:

```shell
ln f1.txt ramin/f1.txt
```

different types of links:
* **Hard link**
  * Point to the data to hard drive
* **Symbolic (soft) link**
  * Point to a file 

![hard link vs soft link](figures/hard_vs_soft_links.jpg)


## `grep`

`grep` stands for **Global Regular Expression Print**.
It searches for the patterns that can be found in the given files.

synopsis:

```shell
grep [options] "pattern" filename
```

example:

```shell
grep "error" file1.txt
```

options:

* `-i`: ignore case sensetive
* `-r`: recusrively read all files in a directory
* `-n`: show line numbers with results
* `-c`: count occurrences
* `-v`: invert match

`grep` is mostly used with `|`. 

for example:

```shell
ls -l | grep file1
```

## regex

`Regex` is a sequence of characters that forms a search pattern.

Metacharacter:

* `.`: Match any character
* `^`: Match the start of the line
* `$`: Match the end of the line 
* `*`: Match 0 or more occurrences of the previous element
* `+`: Match 1 or more occurrences of the previous element
* `[]`: character that we want
* `\`: Don't apply the metacharacter
* `{n}`: match exactly n times of the previous element 
* `{n,}`: match n or more times of the previous element
* `{n,m}`: match between n and m occurrences of the previous element

:::{note}
https://regex101.com/ is a really great site to practice regex.
:::