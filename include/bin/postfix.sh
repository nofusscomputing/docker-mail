#! /bin/bash

trap "service postfix stop" SIGINT
trap "service postfix stop" SIGTERM
trap "service postfix reload" SIGHUP

service postfix start

# wait until postfix is dead (triggered by trap)
while kill -0 "$(< /var/spool/postfix/pid/master.pid)"
do
  sleep 5
done

