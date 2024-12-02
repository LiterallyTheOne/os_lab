# Session 7: user control and bash scripting

## `useradd`

To add a new user in Linux, you can use the `useradd` command.

```shell
sudo useradd [options] username
```

for example:

```shell
sudo useradd -m username
```

The command above, creates a new user named `username`.
The `-m` option tells `useradd` to create a home directory for the new user.

Options:
* `-m`, `--create-home`
  *  Create a home directory for the new user.
* `-d`, `--home-dir /path/to/home`
  *  Specify the path to the home directory.
* `-s`,`--shell /bin/bash`
  *  Set the default shell for the new user.
* `-G`, `--groups`
  *  Add groups to the new user.
* `-c`, `--comment`
  *  Set the comment for the new user.

```{note}
To see if a user is created or not you can use the following command:

`cat /etc/passwd | grep username`

```

## `passwd`

To set a password for a user, you can use the `passwd` command.

```shell
sudo passwd username
```

it will get prompt to enter and confirm the new password.


## `usermod`

To modify an existing user in Linux, you can use the `usermod` command.

```shell
sudo usermod [options] username
```

For example:

```shell
sudo usermod -aG sudo username
```

The `-aG` option tells `usermod` to append the new user to the existing groups.

Options:
* `-a`, `--append`
  *  Append the new user to the existing groups.
* `-G`, `--groups`
  *  Add groups to the new user.
* `-c`, `--comment`
  *  Set the comment for the new user.
* `-d`, `--home-dir /path/to/home`
  *  Specify the path to the home directory.
* `-s`,`--shell /bin/bash`
  *  Set the default shell for the new user.
* `-g`, `--group`
  *  Change the primary group of the existing user.
* `-e`, `--expire-date YYYY-MM-DD`
  *  Set the password expiration date.
* `-l`, `--login-name username`
  *  Change the login name of the existing user.
* `-L`, `--lock-passwd`
  *  Lock the password for the existing user.
* `-U`, `--unlock-passwd`
  *  Unlock the password for the existing user.
* `-u`, `--user-id uid` 
  *  Change the user ID of the existing user.

## `userdel`

To delete a user in Linux, you can use the `userdel` command.

```shell
sudo userdel username
```

For example:

```shell
sudo userdel -r username
```

The command above, deletes the user named `username`.
The `-r` option tells `userdel` to remove the home directory of the new user.

Options:
* `-r`, `--remove`
  *  Remove the home directory of the existing user.
* `-f`, `--force`
  * Force delete the user without prompting for confirmation.


