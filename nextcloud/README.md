The setup assumes nextcloud is installed in `/usr/share/webapps/nextcloud`.

Configuration is in /etc/nextcloud by setting the `NEXTCLOUD_CONFIG_DIR` environment variable,
a feature of nextcloud 10.0.1.

Data would be in `/var/lib/nextcloud` or a subdirectory - you configure that on install.

Uses systemd socket activation - this solves the problem of having the uwsgi socket accessible to nginx, without running
uwsgi with extra privileges (root or the nginx group).
