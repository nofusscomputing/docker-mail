FROM debian:bullseye-slim


# Install dependencies
RUN apt update && DEBIAN_FRONTEND=noninteractive apt -y --no-install-recommends install \
      curl \
      gpg \ 
      gpg-agent \ 
      apt-transport-https \
      ca-certificates \
      supervisor


RUN apt update && DEBIAN_FRONTEND=noninteractive apt -y --no-install-recommends install \
        # System Apps
      cron \
      rsyslog \
      logrotate \
# Cleanup, remove cron jobs not required
RUN rm -f /etc/cron.d/e2scrub_all \
    && rm -f /etc/cron.daily/apt-compat \
    && rm -f /etc/cron.daily/dpkg
