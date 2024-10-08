# Session 3: Docker basics

## Introduction

<!--
Docker:
* Open source
* Platform
* Helps:
  * Run
  * Ship
  * Deploy
* Separate application from infrastructure
* Control infrastructure way easier
* Because of methodologies
  * Reduce time between coding and production

* Portable
* lightweight
-->

Docker is an Open source platform.
It helps you to **run**, **ship** and **deploy**
your application.
It separates application from infrastructure to
assist you to deliver your software quicker.
Also, it gives you so many capabilities to control
your infrastructure way easier.
It has a great methodology that reduces the time
between coding and production.
It is lightweight and portable, which makes it super
great to run them anywhere.

## Install Docker

To Install docker we have so many options.
For the purpose of learning the best way to
install docker is via docker desktop.
It contains `Docker Daemon`, `Docker client`
and `Docker Compose` which we are going to work with a lot.
Also, it has a UI to control All the things that we need.

To start with docker desktop you can use this
[link](https://docs.docker.com/get-started/introduction/get-docker-desktop/).

## Run an example

Now that we have everything set up, we can run an example
in our terminal of choice.
Open a terminal and type the code below:

```shell
docker run -i -t --name u1 ubuntu /bin/bash
```

If you don't have the `Ubuntu` image already,
it would download it then it attaches a `bash` in it.
We are going to learn about the `options` and the `arguments`
of this command more.

Right now, You should see a `bash terminal` opening up
for you which you can run `bash` commands in it.

## Docker Architecture

![docker architecture](figures/docker_architecture.jpg)

As you can see in the picture above, the basic
architecture of docker consists of three main components:

* Client
* Docker host
* Registry

Docker uses a client-server architecture.
Docker daemon listens to the Docker client.
Both Docker daemon and Docker client can run
on the same machine.
But we can have remote Docker daemon as well.
the communication between the Docker daemon and Docker client
is through **REST API**.
We are going to discuss more about them.

### Docker Daemon

The **docker daemon** (`dockerd`) listens to the API requests and
manages Docker objects such as images, containers, networks
and volumes.

### Docker Client

Docker client (`docker`) is the main way that users
interact with Docker.

### Docker Registry

A docker registry stores DockerImages.
The default Register is [Docker Hub](https://hub.docker.com/).
When we use `docker pull`, `Docker Daemon` pulls the required

## Docker Hub

You can access [Docker Hub](https://hub.docker.com/) in your
browser.
For example, we can take a look at [Python image](https://hub.docker.com/_/python).
There are different tags which each one represents different
meaning.

<!-- 
TODO: add more details about each tag
for example: alpine, bullseye, bookworm
-->

## Image

Image is a template with instructions for creating
a Docker container.
If we want to make our own image, we can use `DockerFile`
to achieve that goal.

## Container

Container is a runnable instance of a Docker image.
You can create, start, stop, move or delete a container
using api.

## Basic commands

### `docker pull`

`docker pull` pulls an image from Docker registry.
For example:

```shell
docker pull ubuntu
```

The command above downloads `ubuntu` from Docker registry.

### `docker run`

`docker run` runs the given image.
First argument is the image that we want to make
a container out of and the second argument is the command
that we want it to execute.

There are some important options that we should know about

* `-i`: Interactive, keeps STDIN open if not attached.
* `-t`: Allocates a pseudo-TTY
* `--name`: To give a name to a container
* `--rm`: Automatically remove the container and all of its 
  has created.
* `-p`: publish a container's port to host

for example:

```shell
docker run -it --name u1 ubuntu /bin/bash
```

### `docker ps`

`docker ps` shows us a list of containers
(default running).
For example:

```shell
docker ps

CONTAINER ID   IMAGE     COMMAND       CREATED          STATUS          PORTS     NAMES
67a6f03640a1   ubuntu    "/bin/bash"   13 seconds ago   Up 12 seconds             u1
```

An important option of `docker ps` is:

* `-a`: All containers

### `docker stop`

`docker stop` stops one or more containers.
For example:

```shell
docker stop u1
```

The command above stops `u1` which we created it before
from running.

### `docker rm`

`docker rm` Removes one or more containers.

```shell
docker rm u1
```

This remove the container that we made previously.

### `docker images`

`docker images` lists images.
For example:

```shell
docker images

ubuntu latest c22ec0081bf1 3 weeks ago 101MB
```

### `docker rmi`

`docker rmi` removes one or more images.

## DockerFile

`DockerFile` is a text document that contains a series
of instructions that tells docker how to build a
`Docker image`.
When a `Docker image` is created it becomes read-only,
if we want to make a change in it, we should build another one.

### layers