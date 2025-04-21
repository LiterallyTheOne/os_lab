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

## `eval`

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
