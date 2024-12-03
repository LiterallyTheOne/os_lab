# Session 9: Bash scripting (while)

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
