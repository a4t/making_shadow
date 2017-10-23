# making_shadow

## Description
Create password and get shadow script.

## Requirement
- docker
- docker-compose

## Usage

```
$ docker-compose build
Building mksha
Step 1/4 : FROM ubuntu:16.04
 ---> xxxxxxxxxxxxxx
Step 2/4 : ENV PASSWORD_LENGTH_BASE 14
 ---> Running in xxxxxxxxxxxxxx 
 ---> xxxxxxxxxxxxxx 
Removing intermediate container xxxxxxxxxxxxxx 
Step 3/4 : ENV PASSWORD_RANGE 10
 ---> Running in xxxxxxxxxxxxxx 
 ---> xxxxxxxxxxxxxx 
Removing intermediate container xxxxxxxxxxxxxx 
Step 4/4 : RUN TMP_NUM=$(od -A n -t u4 -N 4 /dev/urandom)  && export PASSWORD_LENGTH=$(($TMP_NUM % $PASSWORD_RANGE + $PASSWORD_LENGTH_BASE))  && useradd foo  && export PASSWORD=$(cat /dev/urandom | tr -dc '[:graph:]' | fold -w $PASSWORD_LENGTH | head -n 1 | sort | uniq)  && echo "foo:${PASSWORD}" | chpasswd  && export SHADOW=$(cat /etc/shadow | grep foo | sed -e 's/foo://' | sed -e 's/:.*//')  && echo "\n\n"  && echo "YOUR PASSWORD: ${PASSWORD}"  && echo "YOUR SHADOW: ${SHADOW}\n"
 ---> Running in xxxxxxxxxxxxxx



YOUR PASSWORD: password
YOUR SHADOW: shadow 

 ---> xxxxxxxxxxxxxx 
Removing intermediate container xxxxxxxxxxxxxx 
Successfully built xxxxxxxxxxxxxx 
Successfully tagged makingshadow_mksha:latest
```
