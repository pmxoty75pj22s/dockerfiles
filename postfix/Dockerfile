FROM debian:jessie

# vmail
RUN \
  groupadd -g 10000 vmail \
  && useradd -d /var/vmail -g 10000 -u 10000 -s /bin/false vmail \
  && mkdir /var/vmail \
  && chown vmail:vmail /var/vmail

ENV DEBIAN_FRONTEND noninteractive
RUN \
  echo "postfix postfix/main_mailer_type string Internet site" |debconf-set-selections \
  && echo "postfix postfix/mailname string mail.example.com" |debconf-set-selections \
  && apt-get update \
  && apt-get -y upgrade \
  && DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends \
        postfix \
        postfix-mysql \
        dovecot-common \
        dovecot-pop3d \
        dovecot-imapd \
        dovecot-mysql \
        postgrey \
        supervisor \
  && apt-get autoclean \
  && rm -rf /var/lib/apt/lists/*

ADD LINUX2 /usr/local/bin/
RUN sed -i -e 's/postfix reload/#postfix reload/' /usr/local/bin/LINUX2
ADD main.cf /etc/postfix
ADD master.cf /etc/postfix
ADD dovecot.conf /etc/dovecot
ADD supervisord.conf /etc/supervisor/conf.d

EXPOSE 110/tcp 143/tcp 25/tcp 587/tcp

ADD start.sh /usr/local/bin/
CMD ["start.sh"]
