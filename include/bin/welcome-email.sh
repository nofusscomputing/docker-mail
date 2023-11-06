#!/bin/sh

set -e

USER=$1

cat << EOF | /usr/lib/dovecot/dovecot-lda -d ${USER} -o "plugin/quota=maildir:User quota:noenforcing"
Auto-Submitted: auto-generated
Date: $(date +'%a, %-d %b %Y %H:%M:%S %z')
From: Postmaster <NO-REPLY@$(hostname -f)>
Subject: New User Welcome

Hi,

This E-Mail has been sent to inform you of some of the ins and outs of this E-Mail server.

Features available to you:
- IMAP Sieve
- Spam automatically sent to your spam folder
- Ability to share your E-mail folders with other users


Quota
=====
Your mailbox has a set quota that should be visible in your E-Mail client. A quota is the storage space that your E-Mails use. It is your responsability to keep you storage below your allocated quota, or you won't be able to send or receive E-Mails.


Spam
====
Spam is defined as unwanted messages, which sometimes contains malicious software. It's advised if you receive a message you think is spam, don't open it. Move it to your spam folder. Any spam that we detect, will automatically delivered to your spam folder. If we miss a spam messages, as stated earlier, please move it to your spam folder.

We have a learning bot that automagically uses your spam folder to learn why it is spam. After our AI learns, it will be better next time at catching the spam messages so you don't have to.

$(if [ "0$POST_MASTER_EMAIL" != "0" ]; then echo "If you have any concerns, please email the postmaster ($POST_MASTER_EMAIL)."; fi )

EOF
