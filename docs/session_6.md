# Session 6: Bash project

## Goal

## `getopt`

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
