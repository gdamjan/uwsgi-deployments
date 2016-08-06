mediawiki is unpacked in `/usr/share/webapps/mediawiki`. Other than that you don't touch or modofy that directory.

Uploads go to `/var/lib/mediawiki/images` - if you change that, change `$wgUploadDirectory` in `LocalSettings.php` and
the alias for `/images` in nginx.

The mediawiki config is in `/etc/mediawiki/LocalSettings.php` or you could use `wiki.example.com.php` if you're running more
instances. Make sure you edit `uwsgi.ini` if you use something else.

You can either use `extension=pdo_sqlite.so` or `extension=mysqli.so`

Make sure the mediawiki configuration in `LocalSettings.php` has something like:
```
$wgScriptPath = "";
$wgArticlePath = "/$1";
$wgUploadDirectory = "/var/lib/mediawiki/images";
$wgSQLiteDataDir = "/var/lib/mediawiki/data";
```
