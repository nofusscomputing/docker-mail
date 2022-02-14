#!/bin/bash

set -e

start=$(date '+%s')

POSTMASTER="${1}"

# for testing script
#POSTMASTER=postmaster@example.org

HAM_REPORT=''

SPAM_REPORT=''

for i in /srv/mail/* ; do
  if [ -d "$i" ]; then

    HAM_REPORT=$(printf "$HAM_REPORT\n\nMailbox: $i\n    $(sa-learn --ham --showdots --no-sync $i/mail/cur)\n")

    SPAM_REPORT=$(printf "$SPAM_REPORT\n\nMailbox: $i\n    $(sa-learn --spam --showdots --no-sync $i/mail/Spam/cur)\n")

  fi
done


if [ "0$POST_MASTER_EMAIL" != "0" ]; then

cat << EOF | /usr/lib/dovecot/dovecot-lda -d "${POST_MASTER_EMAIL}" -o "plugin/quota=maildir:User quota:noenforcing"
Auto-Submitted: auto-generated
Date: $(date +'%a, %-d %b %Y %H:%M:%S %z')
To: ${POST_MASTER_EMAIL}
From: Mail Server <NO-REPLY@$(hostname -f)>
Subject: Spam Learning Report $(date +%Y-%m-%d-%H:%M-%Z)

Command: /bin/spam-learn.sh

Scan duration: $((`date '+%s'` - $start))


****************** Ham Scan ******************
$HAM_REPORT



****************** Spam Scan ******************

$SPAM_REPORT

EOF

fi
