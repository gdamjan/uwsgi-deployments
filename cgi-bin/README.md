cgi scripts for nginx with uwsgi
================================

The `cgi = /cgi-bin=%d` means that the url-space of /cgi-bin is served from the same
directory (%d) as the `uwsgi.ini` config file.
