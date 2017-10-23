FROM ubuntu:16.04

ENV PASSWORD_LENGTH_BASE=14
ENV PASSWORD_RANGE=10

RUN TMP_NUM=$(od -A n -t u4 -N 4 /dev/urandom) \
 && export PASSWORD_LENGTH=$(($TMP_NUM % $PASSWORD_RANGE + $PASSWORD_LENGTH_BASE)) \
 && useradd foo \
 && export PASSWORD=$(cat /dev/urandom | tr -dc '[:graph:]' | fold -w $PASSWORD_LENGTH | head -n 1 | sort | uniq) \
 && echo "foo:${PASSWORD}" | chpasswd \
 && export SHADOW=$(cat /etc/shadow | grep foo | sed -e 's/foo://' | sed -e 's/:.*//') \
 && echo "\n\n" \
 && echo "YOUR PASSWORD: ${PASSWORD}" \
 && echo "YOUR SHADOW: ${SHADOW}\n"
 
