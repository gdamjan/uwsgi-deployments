The setup assumes nextcloud is installed in `/usr/share/webapps/nextcloud` and there's a `nextcloud` system user.

Configuration is in /etc/nextcloud by setting the `NEXTCLOUD_CONFIG_DIR` environment variable,
a feature of nextcloud>=10.0.1.

Data would be in `/var/lib/nextcloud` or a subdirectory - you configure that on install.

Uses systemd socket activation - this solves the problem of having the uwsgi socket accessible to nginx, without running
uwsgi with extra privileges (root or the nginx group).

To update from the cli, run:
```
sudo -u nextcloud NEXTCLOUD_CONFIG_DIR=/etc/nextcloud/ occ maintenance:mode --on
# upgrade package, make backups, etc...
sudo -u nextcloud NEXTCLOUD_CONFIG_DIR=/etc/nextcloud/ occ upgrade
sudo -u nextcloud NEXTCLOUD_CONFIG_DIR=/etc/nextcloud/ occ maintenance:mode --off
```

Note: unfortunetally, the php cli seems to only be configurable by `/etc/php/php-cli.ini` so it'll need the extensions at
least for the database enabled.
