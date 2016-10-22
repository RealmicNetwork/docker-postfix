#!/bin/sh
mkdir -p /var/spool/postfix/etc
cp /etc/resolv.conf /var/spool/postfix/etc/resolv.conf
cp /etc/services /var/spool/postfix/etc/services
sed -i s/{{NODE_HOSTNAME}}/${NODE_HOSTNAME}/g /etc/postfix/master.cf
rsyslogd
postfix start
tail -f /var/log/maillog
