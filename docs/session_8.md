# Session 8: Bash scripting (if, for)

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





