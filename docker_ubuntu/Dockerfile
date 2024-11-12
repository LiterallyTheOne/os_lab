FROM ubuntu:latest

WORKDIR /app

RUN apt update -y

RUN apt upgrade -y

RUN apt install vim -y

COPY . .

CMD [ "/bin/bash" ]