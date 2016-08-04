#! /bin/sh

exec /usr/bin/uwsgi --ini $0

[uwsgi]
master          = true
http-socket     = :8000
offload-threads = 5
async           = 1000
ugreen          = true
plugin          = 0:cgi
cgi             = /=/usr/lib/cgit/cgit.cgi
check-static    = /usr/share/webapps/cgit/
env = CGIT_CONFIG=$(HOME)/.local/etc/cgitrc
