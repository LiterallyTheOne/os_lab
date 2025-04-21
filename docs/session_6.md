# Session 6: Bash project

## Goal

## `shift`

`shift` shifts the arguments to the left.

```bash
shift # shifts the arguments by 1
shift n # shifts the arguments by n
```

For example:

If we have:

```bash
my_program apple banana orange
```

```bash
echo $1 # apple
shift
echo $1 # banana
```

## `set`

`set` does mainly two things:

* change shell behavior
* set positional parameters

### Change shell behavior

To change the behavior of shell we can use `set` with options.
Two of them are:

* `-e`
  * Exit immediately if a command exits with a non-zero status
* `-x`
  * Print each command before executing it

```bash
set -e
echo hi
false # exits with 1
echo goodbye
```

output:

```text
hi
```

### set positional arguments

To set positional arguments we can use something like below:

```bash
set -- apple banana orange
```

The command above replaces the current arguments with
`apple`, `banana` and `orange`.
So for example, right now apple is in `$1`.

If we use set without any arguments, it shows all shell variables.

## `eval`

`eval` evaluates and executes an string as a bash command.
It could be dangerous, so be careful about the command you are
passing to `eval` to run.

```bash
eval command
```

For example:

```bash
eval "echo hi"
```

output:

```text
hi
```

## `getopt`

`getopt` is a command line that helps us to parse the arguments.
It can deal with short (for example: `-e`) and long (for example: `--example`) options.

```bash
getopt [options] optstring parameters
```

* `optstring`:
  * String of valid option characters
* `parameters`
  * list of arguments to be parsed ("$@").

```{important}
If an option needs and arguemnt, we put `:` after that.
For example: "e:".
```

The most used format that is being used is:

```bash
getopt -o "a:bc" --long "alpha:,beta,gamma" -- "$@"
```

In the format above we have 3 short options (`-a`, `-b`, `-c`)
and 3 long options (`--alpha`, `--beta`, `--gamma`).
`-a` or `--alpha` option needs an additional argument because of
the `:` that has after it.
As you can see the long options are being separated by `,`.
Because we set options with the `-o`,
so we put `--` for `optstring`.
For the parameters to be parsed, we put "$@",
so all the arguemnts are being sent to the command.

A full example of it would be something like that:

```bash
#!/bin/bash
options=$(getopt -o a:bc --long alpha:,beta,gamma -- "$@")

eval set -- "$options"

while true; do
    case "$1" in
    -a | --alpha)
        echo "Option a: $2"
        shift 2
        ;;
    -b | --beta)
        echo "Option b"
        shift
        ;;
    -c | --gamma)
        echo "Option c"
        shift
        ;;
    --)
        shift
        break
        ;;
    *)
        echo "Invalid option"
        exit 1
        ;;
    esac
done

echo "Remaining arguments: $@"
echo "Number of remaining arguments: $#"
```

For example, if we use a code like below:

```bash
./s6_parsing_arguments 42 -a "bash scripting" -b 25
```

The output would be like below:

```text
Option a: bash scripting
Option b
Remaining arguments: 42 25
Number of remaining arguments: 2
```

In the code above,
at `options=$(getopt -o a:bc --long alpha:,beta,gamma -- "$@")` line as descibed
before we set the options that we need.
Then, at `eval set -- "$options"` line, we set the **parsed options**
as the new arguments of our script.
After that, with a `while`, we go trough all the new arguments to do
the necessary things needed for each one.( we go to the next argument using `shift`)

## `PATH`

`PATH` is an environmental variable that tells the system
where to look for executable files.
If we want our current `shell` to know about our executable
program we should add the directory of it to `PATH`.
In `PATH` addresses are separated with `:`.
For example:

```shell
export PATH=$PATH:/my/path
```

In the example above, we added `/my/path` to the `PATH` variable.
The reason that we wrote `export PATH=$PATH:/my/path` instead of
simply writing `PATH=$PATH:/my/path` is that we want all the
subprocesses of that `shell` also have the updated `PATH`.

If we don't want to repeat the process of adding `my/path` to
`PATH`, we can simply add it to our shell config file.
If you are using `bash` it's in `~/.bashrc` and if you are
using `zsh` it's in `~/.zshrc`.
For example:

```shell
echo "export PATH=$PATH:/my/path" >> ~/.bashrc
```

The example above adds `export PATH=$PATH:/my/path` at the
bottom of `~/.bashrc` file.
Now anytime you make a new terminal `/my/path` will be added
to your `PATH` variable.

## `man` page
