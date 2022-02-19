#!/bin/bash

set -e

backup_version=1.0
back_file_name="mail_server-$backup_version-$(date +%Y-%m-%d-%H%M-%Z).tar.gz"

start=$(date '+%s')

includes=(/srv/mail)
includes+=(/ssl)
includes+=(/var/spool/postfix)
includes+=(/var/spool/spamassassin)
includes+=(/var/log)
includes+=(/var/lib/amavis)


backup_command="tar -czpvf $back_file_name ${includes[@]}"

cd /tmp

echo "$backup_command"

if ! $backup_command; then
  status="tar failed"
elif ! mv "/tmp/$back_file_name" /backup/ ; then
  status="mv failed"
else
  status="success: version=$backup_version size=$(stat -c%s /backup/$back_file_name) duration=$((`date '+%s'` - $start)) command='$backup_command'"
fi


logger -t backup "$status"


if [ "0$POST_MASTER_EMAIL" != "0" ]; then

cat << EOF | /usr/lib/dovecot/dovecot-lda -d "${POST_MASTER_EMAIL}" -o "plugin/quota=maildir:User quota:noenforcing"
Auto-Submitted: auto-generated
Date: $(date +'%a, %-d %b %Y %H:%M:%S %z')
To: ${POST_MASTER_EMAIL}
From: Mail Server <NO-REPLY@$(hostname -f)>
Subject: Backup $(date +%Y-%m-%d-%H:%M-%Z)

Server backups have occured on $(hostname -f)

Summary:

    $status

EOF

fi

