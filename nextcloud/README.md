The setup assumes nextcloud is installed in `/usr/share/webapps/nextcloud`.

Configuration is in /etc/nextcloud (pending the `NEXTCLOUD_CONFIG_DIR` merge in
[PR#660](https://github.com/nextcloud/server/pull/660)).

Data would be in `/var/lib/nextcloud` or a subdirectory - you configure that on install.

Optionally you can limit execution to only these php scripts:
```
php-allowed-ext = /ocs/v1.php
php-allowed-ext = /ocs/v2.php
php-allowed-ext = /index.php
php-allowed-ext = /cron.php
php-allowed-ext = /status.php
php-allowed-ext = /remote.php
php-allowed-ext = /public.php
php-allowed-ext = /core/templates/403.php
php-allowed-ext = /core/templates/404.php
php-allowed-ext = /core/ajax/update.php
```

Some more options for php in uwsgi:
```
php-set = date.timezone=Europe/Berlin
php-set = open_basedir=
php-set = session.save_path=/tmp
php-set = post_max_size=1000M
php-set = upload_max_filesize=1000M
```

Or enable less loging:
```
log-slow = true
log-5xx = true
log-4xx = true
log-sendfile = true
```
