# Session 3: Commands and pipe

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

## Arguments

You can pass arguments to a bash script when you run it.

For example:

```shell
sh script.sh "Hello" "World"
```

The code above passes two arguments `"Hello"` and `"World"` to the `script.sh` file.
You can access these arguments in your script using `$1`, `$2`, etc.

For example if we have a script like this:

```shell
echo "First argument: $1"
echo "Second argument: $2"
```

the output of `./script.sh "Hello" "World"` would be:

```text
First argument: Hello
Second argument: World
```

* `$0`: the name of the script.
* `$1`, `$2`, etc.: the individual arguments passed to the script.
* `$#`: the number of arguments passed to the script.
* `$@`: all the arguments passed to the script as a list.
* `$*`: all the arguments passed to the script as a single string.

## See the output of the last command

With `$?` we can see the output of the last command.

* 0 means success
* greated than 0 means failure.

## test commands

The test command is used to check if a condition is true or false.
It returns 0 (success) if the condition is true and non-zero (failure) otherwise.

```shell
[ condition ]
```

```{important}
Be careful about the spaces around `[` and `]`.
```

For example:

```shell
a="hello"
[ $a == "hello" ];
echo $?
```

output:

```text
0
```

In the example above, first we put "hello" in variable called `a`.
Then we use the `==` operator to check if `a` is equal to `"hello"`.
After that we print the output of the last command to see what was the result.
In this case the output would be `0`, which means the condition was true.

Options:

* `-eq`: equal to (`[ $a -eq 1]`)
* `-ne`: not equal to (`[ $a -ne 1]`)
* `-lt`: less than (`[ $a -lt 1]`)
* `-gt`: greater than (`[ $a -gt 1]`)
* `-le`: less than or equal to (`[ $a -le 1]`)
* `-ge`: greater than or equal to (`[ $a -ge 1]`)
* `-f`: file exists (`[ -f filename ]`)
* `-d`: directory exists (`[ -d dirname ]`)

```{note}
You can use `!` before a test command to invert its result. (`! [ $a -eq 1 ]`)
```

## `if`

The main syntanx of `if` in bash is like below:

```shell
if conditon; then
    # your code here
fi
```

For example:

```shell
if [ $a == "hello" ]; then
    echo "Hello!"
fi
```

In the example above, we check if `a` is equal to `"hello"`, using `test command`.
If the condition is true, it prints "Hello!".

For condition we can use other commands which also return 0 (success) or non-zero (failure).
Which we are going to talk about it in further.

## `else`

The `else` statement is used to specify what should happen if the condition in the `if` statement is false.
It is optional and can be used with any number of `if` statements.

```shell
if conditon; then
    # your code here
else
    # your code here
fi
```

For example:

```shell
if [ $a == "hello" ]; then
    echo "Hello!"
else
    echo "Goodbye!"
fi
```

In the example above, if `$a` is not equal to `"hello"`, it prints "Goodbye!".

## `elif`

The `elif` statement is used to specify what should happen if the condition in
the first `if` statement is false and another condition is true.
It can be used with any number of `if` statements.

```shell
if conditon; then
    # your code here
elif other_condition; then
    # your code here
else
    # your code here
fi
```

For example:

```shell
if [ $a == "hello" ]; then
    echo "Hello!"
elif [ $b == "world" ]; then
    echo "World!"
else
    echo "Goodbye!"
fi
```

In the example above, if `$a` is not equal to `"hello"` and `$b` is not equal to `"world"`, it prints "Goodbye!".

## Arethmetic operators

Bash supports arithmetic operations, if want to use them we should put the numbers in double parentheses `(( ))`.

For example:

```shell
a=10
b=20
sum=$((a + b))
echo $sum
```

output:

```text
30
```

It suppports all arithmetic operators like `+`, `-`, `*`, `/`, `%`, etc.

We can also use it for comparison:

For example:

```shell
a=20
b=10
(( a > b ))
echo $?
```

Output:

```text
0
```

So we can use it as a conditon in `if` statement as well.

For example:

```shell
if (( a > b )); then
    echo "a is greater than b"
```
