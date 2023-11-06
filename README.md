<div align="center" width="100%">


# No Fuss Computing - Docker Mail Server

<br>

![Project Status - Active](https://img.shields.io/badge/Project%20Status-Active-green?logo=gitlab&style=plastic)

<br>

![Gitlab forks count](https://img.shields.io/badge/dynamic/json?label=Forks&query=%24.forks_count&url=https%3A%2F%2Fgitlab.com%2Fapi%2Fv4%2Fprojects%2F33611657%2F&color=ff782e&logo=gitlab&style=plastic) ![Gitlab stars](https://img.shields.io/badge/dynamic/json?label=Stars&query=%24.star_count&url=https%3A%2F%2Fgitlab.com%2Fapi%2Fv4%2Fprojects%2F33611657%2F&color=ff782e&logo=gitlab&style=plastic) [![Open Issues](https://img.shields.io/badge/dynamic/json?color=ff782e&logo=gitlab&style=plastic&label=Open%20Issues&query=%24.statistics.counts.opened&url=https%3A%2F%2Fgitlab.com%2Fapi%2Fv4%2Fprojects%2F33611657%2Fissues_statistics)](https://gitlab.com/nofusscomputing/projects/docker-mail/-/issues)

![GitHub forks](https://img.shields.io/github/forks/NoFussComputing/docker-mail?logo=github&style=plastic&color=000000&labell=Forks) ![GitHub stars](https://img.shields.io/github/stars/NoFussComputing/docker-mail?color=000000&logo=github&style=plastic) ![Github Watchers](https://img.shields.io/github/watchers/NoFussComputing/docker-mail?color=000000&label=Watchers&logo=github&style=plastic)

<br>

This project is hosted on [Gitlab](https://gitlab.com/nofusscomputing/projects/docker-mail) and has a read-only copy hosted on [Github](https://github.com/NoFussComputing/docker-mail).


----

.**Stable Branch**

![Gitlab build status - stable](https://img.shields.io/badge/dynamic/json?color=ff782e&label=Build&query=0.status&url=https%3A%2F%2Fgitlab.com%2Fapi%2Fv4%2Fprojects%2F33611657%2Fpipelines%3Fref%3Dmaster&logo=gitlab&style=plastic) ![branch release version](https://img.shields.io/badge/dynamic/yaml?color=ff782e&logo=gitlab&style=plastic&label=Release&query=%24.commitizen.version&url=https%3A%2F%2Fgitlab.com%2Fnofusscomputing%2Fprojects%2Fdocker-mail%2F-%2Fraw%2Fmaster%2F.cz.yaml)

----

.**Development Branch**

![Gitlab build status - development](https://img.shields.io/badge/dynamic/json?color=ff782e&label=Build&query=0.status&url=https%3A%2F%2Fgitlab.com%2Fapi%2Fv4%2Fprojects%2F33611657%2Fpipelines%3Fref%3Ddevelopment&logo=gitlab&style=plastic) ![branch release version](https://img.shields.io/badge/dynamic/yaml?color=ff782e&logo=gitlab&style=plastic&label=Release&query=%24.commitizen.version&url=https%3A%2F%2Fgitlab.com%2Fnofusscomputing%2Fprojects%2Fdocker-mail%2F-%2Fraw%2Fdevelopment%2F.cz.yaml)

----

<br>

</div>

links:

- [Issues](https://gitlab.com/nofusscomputing/projects/docker-mail/-/issues)

- [Merge Requests (Pull Requests)](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests)


## Features

This docker container is intended to be a fully fledged E-Mail Server. Dovecot acts as the IMAP Server and Local Delivery agent. Postfix is intended to be the MTA utilising Dovecot's LMTP service for local delivery. User management is via LDAP and a working directory server is required to use this image.


- Mail Server - _Dovecot_

    - IMAP Server on tcp/993

    - Acts as Local Delivery Agent (LDA) via LMTP

    - Group E-Mail Boxes

    - Mail Aliasing. _(User can have multiple E-Mail Addresses)_

    - Ability to Share Mailboxes

    - redirection of spam to Spam folder

    - manage sieve server

    - New user welcome email


- SMTP Server _Postfix_

    - Acts as Mail Transfer Agent (MTA)

    - filters file extensions

    - [Remove/cleans headers](https://gitlab.com/nofusscomputing/projects/docker-mail/-/blob/master/include/etc/postfix/header_checks_privacy) that contain potentially sensitive information

    - Spam filtering

    - [DKIM key signing](pages/dkim.md) _Note: [Key length requirements](https://datatracker.ietf.org/doc/html/rfc6376#section-3.3.3)_


- General Features:

    - Automatic Backups of container data

    - rotation of old logs

    - All Data exposed as separate docker volumes so you don't loose data


## Using this container

Currently this container is **not ready for production.**


### Useful Commands

Share a Mailbox

``` bash
doveadm acl add -u {user_name_sharing} INBOX user={user to share with} lookup read write write-seen write-deleted insert post expunge create delete admin

```

or you can use the provided helper script `group-mailbox.sh {user_name_sharing} {user to share with}`. This command will share the all of the default folders _Archives, Drafts, Inbox, Sent, Spam and Trash_.

| :alert: NOTE!! |
|:----|
| `{user_name_sharing}` must be specified as a full E-Mail address. <br> `{user to share with}` must be specified as the user name only (without the `@domainname.tld`)|
