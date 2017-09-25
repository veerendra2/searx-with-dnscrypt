#!/bin/sh
sed -i -e "s|base_url : False|base_url : ${BASE_URL}|g" \
       -e "s/image_proxy : False/image_proxy : ${IMAGE_PROXY}/g" \
       -e "s/ultrasecretkey/$(openssl rand -hex 16)/g" \
       /usr/local/searx/searx/settings.yml
pid_file="/var/run/dnscrypt-proxy.pid"
log="/var/log/dnscrypt-proxy.log "
csv_file="/usr/local/dnscrypt-resolvers.csv"
resolver_name="soltysiak"
dnscrypt-proxy -R $resolver_name -L $csv_file -l $log -p $pid_file -d > /dev/null 2>&1
exec su-exec $UID:$GID /sbin/tini -- python /usr/local/searx/searx/webapp.py