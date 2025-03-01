# Session 3: Commands and pipe

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

## `cat`

To display what is in the file.
We can also create a file with it also
we can append something to a file.

To overwrite a file we use the redirect `>`:

```shell
user@host:~/os_lab$ cat > f1.txt
Hello world especially cat.

```

After that, you should press `ctrl+d` (EOF: End Of File).
Then if you `cat` that file again you can see:

```shell
user@host:~/os_lab$ cat f1.txt
Hello world especially cat.
```

Now, if you want to append something to a file we can use the
append redirect (`>>`).

```shell
user@host:~/os_lab$ cat >> f1.txt
Hello me.

```

After you pressed `ctrl+d`, you can check the content
of the file using `cat` again.

```shell
user@host:~/os_lab$ cat >> f1.txt
Hello world especially cat.
Hello me.
```

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

## arguments

## if

## while
