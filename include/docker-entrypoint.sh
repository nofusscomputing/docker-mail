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


if [ "$1" == "setup" ]; then


postconf -e "myhostname = $(`echo hostname -f`)"


    if [ ! -f /ssl/dovecot/key.pem ]; then

        echo "[WARNING] Creating Self-signed TLS Cert. Consider using letsencrypt or another trusted CA"

        openssl req  -nodes -new -x509 -keyout /ssl/dovecot/key.pem -out /ssl/dovecot/cert.pem -subj '/CN=localhost'

    fi

    if [ ! -f /ssl/dovecot/dh.pem ]; then

        echo "[Information] Creating DHPEM Key"

        openssl dhparam -out /ssl/dovecot/dh.pem 4096

    fi


    echo "[Information] Start dovecot"

    supervisorctl start dovecot


    sed -i -r -e 's/^manpage_directory/#manpage_directory/' /etc/postfix/main.cf.proto

    sed -i -r -e 's/^\$manpage_directory/#$manpage_directory/' /etc/postfix/postfix-files

    sed -i -r -e 's/^\$manpage_directory/#$manpage_directory/' /etc/postfix/postfix-files.d/*


    if [ ! -f /ssl/postfix/key.pem ]; then

        echo "[WARNING] Creating Self-signed TLS Cert. Consider using letsencrypt or another trusted CA"

        openssl req  -nodes -new -x509 -keyout /ssl/postfix/key.pem -out /ssl/postfix/cert.pem -subj '/CN=localhost'

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

