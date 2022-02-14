#!/bin/sh

set -e

MAILBOX_USER=$1
USER_LOGIN_NAME=$2

if [ "0$MAILBOX_USER" = "0" ]; then 

echo " You must specify a mailbox to share";

elif [ "0$USER_LOGIN_NAME" = "0" ]; then

echo " You must specify a user the mailbox is to be shared with";

else


doveadm acl add -u $MAILBOX_USER Inbox user=$USER_LOGIN_NAME lookup read write write-seen write-deleted insert post expunge create delete
doveadm acl add -u $MAILBOX_USER Archive user=$USER_LOGIN_NAME lookup read write write-seen write-deleted insert post expunge create delete
doveadm acl add -u $MAILBOX_USER Drafts user=$USER_LOGIN_NAME lookup read write write-seen write-deleted insert post expunge create delete
doveadm acl add -u $MAILBOX_USER Sent user=$USER_LOGIN_NAME lookup read write write-seen write-deleted insert post expunge create delete
doveadm acl add -u $MAILBOX_USER Spam user=$USER_LOGIN_NAME lookup read write write-seen write-deleted insert post expunge create delete

cat << EOF | /usr/lib/dovecot/dovecot-lda -d ${$USER_LOGIN_NAME} -o "plugin/quota=maildir:User quota:noenforcing"
Auto-Submitted: auto-generated
Date: $(date +'%a, %-d %b %Y %H:%M:%S %z')
From: Postmaster <NO-REPLY@$(hostname -f)>
Subject: New Shared Mailbox ($MAILBOX_USER)

Hi,

Just letting you known that mailbox $MAILBOX_USER, has been shared with you.

You have visibility of the following folders

- Inbox
- Archive
- Drafts
- Sent
- Spam

EOF


fi

