#!/bin/sh
consul-template -consul=$CONSUL_URL -wait "10s" -retry 10s -template="/templates/$NGINX_TEMPLATE:/etc/nginx/conf.d/default.conf:service nginx reload" &
sleep 15
nginx -g 'daemon off;
