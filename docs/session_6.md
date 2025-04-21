# Session 6: Bash project

## `&`

If we put `&` at the end of a command,
it puts that command in the background.
For example:

```bash
sleep 5 &
```

## `$!`

It contains the pid of the last executed background process.
For example:

```bash
sleep 5 &
echo $!
```

output would be a number that represents the pid of that process.

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

To write a manual page for our shell script,
we can create a file with the extension of `.1`
(for example: s6_parsing_arguments.1)
then with its own syntax we can complete our
manual file.
Some of the most important syntaxes are:

| Directive | Purpose                                |
| --------- | -------------------------------------- |
| .TH       | Title Header                           |
| .SH       | Section Header                         |
| .B / .BR  | Bold (or Bold-then-Roman)              |
| .TP       | Tagged paragraph (for options listing) |
| \fI...\fR | Italic / return to normal              |

So if we want to write a manual page for the script that we
wrote in the `getopt` section, it would be something like below:

```text
.TH s6_parsin_arguments 1 "April 21, 2025" "1.0" "User commands"
.SH NAME
s6_parsing_arguments \- parses the options
.SH SYNOPSIS
\fBs6_parsing_arguments\fR [\fIoptions\fR] [\fIarguments\fR]
.SH DESCRIPTION
Takes some specific arguments and parse them.

.BR \-a , \-\-alpha " " \fIvalue\fR

Option alpha.
Also takes a value.

.BR \-b , \-\-beta

Option beta.

.BR \-c , \-\-gamma

Option gamma.

.SH EXAMPLES
s6_parsing_arguments 42 -a "bash scripting" -b 25

.SH AUTHOR
Written by Ramin Zarebidoky.

.SH COPYRIGHT
MIT license.

.SH SEE ALSO
\fIgetopt\fR.
```

I would recommend you to use an template and build your
manual over on that template.

After You have your manual file ready, you should
put that in a place that the `man` command could find it.
To do so you can follow these steps:

* Put your manual file in a directory named `man1`.
  * For example: `/home/user/manuals/man1/s6_parsing_arguments.1`
* Add the line below to `~/.manpath`. (if `~/.manpath` doesn't exist make one)
  * `MANDATORY_MANPATH /home/user/manuals`
  * change `/home/user/manuals` to your desired path.
* Run `mandb` in a terminal.
  * This code adds your manual to the manuals recognizeable
  by `man`.
* Run `man s6_parsing_arguments` to see your manual

## Project

Make a project that runs some specefic codes and tell us its details.

```{note}
In the description below, we assume the name of our script file is `s6`
```

Commands:

* `run` `"command"`:
  * takes a command and run it
  * For example: `s6 run "ls -l"`
* `history`
  * shows the history of the commands that we ran.
  * For example: `s6 history`
* `current`
  * shows the processes that are currently running with their ram and cpu usage
  * For example: `s6 current`

Options:

* `-s`, `--seconds`=<ins>INTEGER</ins>

Example:

s6 run  

### Some options to look after

| command | option |
| ------- | ------ |
| `date`  | `+%s`  |
| `date`  | `-u`   |
| `date`  | `-d`   |
| `ps`    | `-p`   |