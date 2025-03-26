FROM ubuntu:latest

WORKDIR /app

RUN apt update -y

RUN apt upgrade -y

RUN apt install vim -y
RUN apt install bc -y
RUN apt install gcc -y
RUN apt install g++ -y

COPY . .

CMD [ "/bin/bash" ]