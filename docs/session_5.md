# Session 5: File System

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
