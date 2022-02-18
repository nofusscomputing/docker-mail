FROM debian:bullseye-slim


LABEL \
  #org.opencontainers.image.created="" \ # set during build with $(date --rfc-3339=seconds) \
  org.opencontainers.image.authors="No Fuss Computing" \ 
  #org.opencontainers.image.url="" # $CI_PROJECT_URL/-/releases/$CI_COMMIT_TAG set during build from url\
  #org.opencontainers.image.documentation="" # $CI_PROJECT_URL/pages Set URL during build \
  #org.opencontainers.image.source="" # $CI_PROJECT_URL Set URL during build \
  #org.opencontainers.image.version="" \ # $(cz -n cz_nfc version --project) ) Set during build from .cz.yml
  #org.opencontainers.image.revision="" # $CI_COMMIT_SHA set during build from git commit \
  org.opencontainers.image.vendor="No Fuss Computing" \
    #License(s) under which contained software is distributed as an SPDX License Expression.
  org.opencontainers.image.licenses="" \
  org.opencontainers.image.title="No Fuss Computings docker mail server" \
  org.opencontainers.image.description="A Complete mailserver in a container"



# Install dependencies
RUN apt update && DEBIAN_FRONTEND=noninteractive apt -y --no-install-recommends install \
      curl \
      gpg \ 
      gpg-agent \ 
      apt-transport-https \
      ca-certificates \
      supervisor

RUN curl https://repo.dovecot.org/DOVECOT-REPO-GPG | gpg --import && \
    gpg --export ED409DA1 > /etc/apt/trusted.gpg.d/dovecot.gpg

RUN echo "deb https://repo.dovecot.org/ce-2.3-latest/debian/bullseye bullseye main" > /etc/apt/sources.list.d/dovecot.list

RUN apt update && DEBIAN_FRONTEND=noninteractive apt -y --no-install-recommends install \
        # System Apps
      cron \
      rsyslog \
      logrotate \
        # Dovecot
      dovecot-core=2:2.3.18-4+debian11 \
      dovecot-imapd=2:2.3.18-4+debian11 \
      dovecot-lmtpd=2:2.3.18-4+debian11 \
      dovecot-ldap=2:2.3.18-4+debian11 \
      dovecot-sieve=2:2.3.18-4+debian11 \
      dovecot-managesieved=2:2.3.18-4+debian11 \
        # Postfix
      postfix=3.5.6-1+b1 \
      postfix-ldap=3.5.6-1+b1 \
      libsasl2-modules \
      sasl2-bin \
        # Amavis
      amavisd-new=1:2.11.1-5 \
      spamassassin=3.4.6-1 \
      spamc=3.4.6-1 \
        # Amavis decoders
      arj bzip2 cabextract cpio file gzip nomarch pax unzip zip xzdec lrzip lzop rpm2cpio unrar-free p7zip-full lz4 \
#      clamav=0.103.5+dfsg-0+deb11u1 \
#      clamav-daemon=0.103.5+dfsg-0+deb11u1 \
      libmailtools-perl=2.21-1 \
      fam=2.7.0-17.3 \
      libnet-dns-perl=1.29-1 \
        # Fetchmail
      fetchmail=6.4.16-4+deb11u1 \
        # Perl Modules for fetchmail.pl
        # DBI
      libdbix-easy-perl \
        # LockFile::Simple
      liblockfile-simple-perl \
        # DBD::mysql
      libclass-dbi-mysql-perl \
        # Sys::Syslog
      liblogger-syslog-perl \
        # LockFile::Simple
      libio-lockedfile-perl \
        # DKIM
      opendkim=2.11.0~beta2-4 \
      opendkim-tools=2.11.0~beta2-4 \
        # SPF
      postfix-policyd-spf-python=2.9.2-1


# Cleanup, remove cron jobs not required
RUN rm -f /etc/cron.d/e2scrub_all \
    && rm -f /etc/cron.daily/apt-compat \
    && rm -f /etc/cron.daily/dpkg \
    && rm -f /etc/cron.daily/logrotate


COPY include/ /

RUN chmod +x /docker-entrypoint.sh \
      # Create vmail user for system
    && groupadd -g 5000 vmail \
    && useradd -g vmail -u 5000 vmail -d /var/vmail \
      # Ensure Backup directory is created
    && mkdir /backup \
    && chown root:root /backup \
    && chmod 700 /backup \
      # create SSL directory for ssl certificates
    && mkdir -p /certs \
      # Ensure scripts are executable
    && chmod +x /bin/backup.sh \
      # Dovecot related commands
    && mkdir -p /srv/mail \ 
    && chown vmail:vmail /srv/mail \
    && chmod 765 -R /srv/mail \
    && mkdir -p /certs/dovecot \
    && chown dovecot:dovecot -R /etc/dovecot/ \
    && chgrp postfix -R /etc/dovecot/sieve/ \
    && chmod 0755 -R /etc/dovecot/sieve/ \
      # ensure dovecot related scripts are executable
    && chmod +x /bin/quota-warning.sh \
    && chmod +x /bin/welcome-email.sh \
    && chmod +x /bin/group-mailbox.sh \
    && chmod 744 /etc/dovecot/dovecot-acl \
      # Postfix related commands
    && usermod -a -G vmail postfix \
    && mkdir -p /certs/postfix \
    && ln -s /etc/dovecot/dovecot-ldap.conf.ext /etc/dovecot/dovecot-ldap-userdb.conf.ext \
      # ensure postfix related scripts are executable
    && chmod +x /bin/postfix.sh \
      # check if needed
    && mkdir -p /var/spool/postfix/private/dovecot \
    && chown postfix:postfix /var/spool/postfix/private/dovecot \
    && chown vmail:vmail /var/lib/dovecot \
      # Spammassassin related Commands
    && mkdir -p /var/spool/spamassassin \
    && chmod 777 /var/spool/spamassassin \
      # Ensure spamassassin related scripts are executable
    && chmod +x /bin/spam-learn.sh \
       # fetchmail.pl setup
    && curl -o /bin/fetchmail.pl https://raw.githubusercontent.com/postfixadmin/postfixadmin/8f20c96278a694a7e0bb570f1d56c208105e5a14/ADDITIONS/fetchmail.pl \
    && chmod +x /bin/fetchmail.pl \
    && mkdir -p /var/run/fetchmail \
    && mkdir -p /var/lock/fetchmail \
      # Amavis DKIM related commands
    && mkdir -p /certs/amavis/dkim/ \
    && chown root:amavis /certs/amavis/dkim/ \
    && chmod 750 /certs/amavis/dkim/
        

# Setup data volumes
VOLUME /srv/mail /certs /var/spool/spamassassin /backup /var/log

# Configure postfix
RUN postconf -e "maillog_file=/var/log/postfix.log" \
  # Postfix to use dovecot LMTP
  && postconf -e "virtual_transport=lmtp:unix:private/lda" \
  #       # Only allow a user to send from email address' they own
  #    && postconf -e "smtpd_sender_login_maps=ldap:/etc/postfix/ldap/smtpd_sender_login_maps" \
  # Only allow specified domains for usage
  && postconf -e "virtual_mailbox_domains=ldap:/etc/postfix/ldap/virtual_email_domains" \
  # postfix user mapping 
  && postconf -e "virtual_alias_maps=ldap:/etc/postfix/ldap/virtual_alias_maps" \
    # Only trust localhost
  && postconf -e "mynetworks_style = host" \
  # by default encryption is optional
  && postconf -e "smtpd_tls_security_level=may" \
  # log outbound tls connection information
  && postconf -e "smtpd_tls_loglevel=1" \
  # try tls connection outbound
  && postconf -e "smtp_tls_security_level=may" \
  # log inbound tls connection information
  && postconf -e "smtp_tls_loglevel=1" \
  # Only authenticate over tls
  && postconf -e "smtpd_tls_auth_only=yes" \
  # all smtpd actions need to be filtered
  && postconf -e "content_filter=amavis:[127.0.0.1]:10024" \
  # not give away os, set clean banner
  && postconf -e "smtpd_banner=$myhostname ESMTP " \
  # Dont give away that postfix is used
  && postconf -e "mail_name=server" \
  # create privacy header check db
  && postmap /etc/postfix/header_checks_privacy \
  # create clean header check db
  && postmap /etc/postfix/header_checks_outbound \
  # Clean outbound headers
  && postconf -e "smtp_header_checks=regexp:/etc/postfix/header_checks_outbound" \
  # Add To, From, Date and Message-id headers if missing
  && postconf -e "always_add_missing_headers=yes" \
  # Only add missing headers for authenticated users (mail users) and my networks and mail orginating from localhost
  && postconf -e "local_header_rewrite_clients=permit_sasl_authenticated,permit_mynetworks,permit_inet_interfaces" \
  # set tls settings
  && postconf -e "tls_preempt_cipherlist = yes" \
  && postconf -e "tls_ssl_options = NO_COMPRESSION, NO_RENEGOTIATION" \
  && postconf -e "smtpd_tls_cert_file=/certs/postfix/cert.pem" \
  && postconf -e "smtpd_tls_key_file=/certs/postfix/key.pem" \
  && postconf -e "smtpd_helo_required = yes" \
  && postconf -e "smtpd_delay_reject = yes" \
  && postconf -e "disable_vrfy_command = yes" \
  # use secure protocols and cyphers
  && postconf -e "smtpd_tls_protocols=!SSLv2,!SSLv3,!TLSv1,!TLSv1.1" \
  && postconf -e "smtp_tls_protocols=!SSLv2,!SSLv3,!TLSv1,!TLSv1.1" \
  && postconf -e "smtpd_tls_mandatory_ciphers=high" \
  && postconf -e "smtpd_tls_mandatory_protocols=!SSLv2,!SSLv3,!TLSv1,!TLSv1.1" \
     # SPF postfix Settings
  && postconf -e "policyd-spf_time_limit=3600" \
    # Connection defaults to reject where possible/advised
    # Client command restrictions
  && postconf -e "smtpd_client_restrictions=reject_unauth_destination,reject_unauth_pipelining,permit_mynetworks,permit_auth_destination,reject" \
    # HELO/EHLO restrictions
  && postconf -e "smtpd_helo_restrictions=permit_mynetworks,reject_invalid_helo_hostname,permit" \
    # MAIL FROM restrictions
  && postconf -e "smtpd_sender_restrictions=permit_mynetworks,reject_non_fqdn_sender,permit" \
    # RCPT TO restrictions
  && postconf -e "smtpd_recipient_restrictions=permit_mynetworks,reject_non_fqdn_recipient,reject_unknown_recipient_domain,reject_unauth_destination,check_policy_service,unix:private/policyd-spf,check_policy_service unix:private/quota,permit_auth_destination,reject" \
    # RCPT TO restrictions
  && postconf -e "smtpd_relay_restrictions=reject_non_fqdn_recipient,permit_auth_destination,reject" \
  && postconf -e "smtpd_sasl_security_options = noanonymous"
    
EXPOSE 25 587 993 4190


ENTRYPOINT ["/docker-entrypoint.sh"]


# testing software
RUN apt update && DEBIAN_FRONTEND=noninteractive apt -y --no-install-recommends install \
      procps \
      vim \
      iputils-ping \
      python3-ldap \
      net-tools
#    && freshclam
