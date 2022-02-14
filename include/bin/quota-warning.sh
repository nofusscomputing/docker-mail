#!/bin/sh

PERCENT=$1
USER=$2

cat << EOF | /usr/lib/dovecot/dovecot-lda -d $USER -o "plugin/quota=maildir:User quota:noenforcing"
Auto-Submitted: auto-generated
Date: $(date +'%a, %-d %b %Y %H:%M:%S %z')
From: Postmaster <NO-REPLY@$(hostname -f)>
Subject: Mailbox Quota Warning

Hi,

Just wanted to let you know that Your mailbox is now $PERCENT% full.

Note: This is an automated message. Please do not respond to it.

TIP: 

EOF
