# Session 6: Bash project

## Goal

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

## `man` page
