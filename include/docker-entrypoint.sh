#!/bin/bash

set -e

if [ "0$POST_MASTER_EMAIL" != "0" ]; then export MAILTO="$POST_MASTER_EMAIL"; fi

# Populate this file so cron has access to env vars. thanks to https://stackoverflow.com/a/41938139
printenv | grep -v "no_proxy" > /etc/environment


if [ -f "/var/run/amavis/amavisd.pid" ]; then rm /var/run/amavis/amavisd.pid; fi


if [ "$1" == "" ]; then

    echo "Setup server type ($SERVERTYPE)"

    echo "[Information] starting supervisor daemon"
    /usr/bin/supervisord -c /etc/supervisor/supervisord.conf

    bash

fi

# compile sieve scripts
for file in /etc/dovecot/sieve/*.sieve ; 
do 

  sievec $file; 

done


mkdir -p /var/lock/fetchmail

if [ "$1" == "setup" ]; then



if [ ! -f /certs/amavis/dkim/example.org.dkim.pem ]; then

        echo "[WARNING] Creating DKIM Cert, example.org. Consider Creating your own";

        amavisd-new genrsa /certs/amavis/dkim/example.org.dkim.pem 4096;

        chmod g+r /certs/amavis/dkim/example.org.dkim.pem;

        chgrp amavis /certs/amavis/dkim/example.org.dkim.pem;

        amavisd-new showkeys example.org;
    fi


    supervisorctl start amavis;


postconf -e "myhostname = $(`echo hostname -f`)"


    if [ ! -f /certs/dovecot/key.pem ]; then

        echo "[WARNING] Creating Self-signed TLS Cert. Consider using letsencrypt or another trusted CA"

        openssl req  -nodes -new -x509 -keyout /certs/dovecot/key.pem -out /certs/dovecot/cert.pem -subj '/CN=localhost'

    fi

    if [ ! -f /certs/dovecot/dh.pem ]; then

        echo "[Information] Creating DHPEM Key"

        openssl dhparam -out /certs/dovecot/dh.pem 2048

    fi


    echo "[Information] Start dovecot"

    supervisorctl start dovecot


    sed -i -r -e 's/^manpage_directory/#manpage_directory/' /etc/postfix/main.cf.proto

    sed -i -r -e 's/^\$manpage_directory/#$manpage_directory/' /etc/postfix/postfix-files

    sed -i -r -e 's/^\$manpage_directory/#$manpage_directory/' /etc/postfix/postfix-files.d/*


    if [ ! -f /certs/postfix/key.pem ]; then

        echo "[WARNING] Creating Self-signed TLS Cert. Consider using letsencrypt or another trusted CA"

        openssl req  -nodes -new -x509 -keyout /certs/postfix/key.pem -out /certs/postfix/cert.pem -subj '/CN=localhost'

    fi


    echo "[Information] set postfix permissions"

    postfix set-permissions create-missing

    postmap /etc/postfix/header_checks_outbound

    postmap /etc/postfix/header_checks_privacy

    echo "[Information] start postfix"


#    supervisorctl start amavis

    supervisorctl start postfix


else

    exec "$@"

fi

