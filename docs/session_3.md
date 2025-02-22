# Session 3: Commands and pipe

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
