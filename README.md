# uwsgi deployments

A collection of example config files for uwsgi and nginx for different web apps
(mostly php, some cgi, ruby - python is the most trivial).

These examples are very opinionated. I only use .ini files to configure
uwsgi, I prefer clean and short urls, where possible. Also I prefer to serve
static content by nginx directly, etc.

I also prefer to keep the application configuration and user data outside of
the application code, sometimes using tricks (see the wordpress and mediawiki
examples). Their configs should go to `/etc/wordpress/wp-config.php` and
`/etc/mediawiki/LocalSettings.php`, or if you run more sites it can be
`/etc/wordpress/site-name.php`.

There are several benefits of that design:
* the code directory can be used for more sites
* it can be updated very easily by just removing the old code directory and
unpacking the new code
* the whole code directory is read-only or only writable by the sys admin -
avoiding the possibility of exploits in the app to plant malicious code

Each application runs as it's own uwsgi process (and its own systemd service),
typically with its own user, resources, limits, and configuration.

Most of the examples can also run standalone with just the uwsgi http server for
testing. To run the nginx setup, you need to run `uwsgi --ini uwsgi.ini:nginx`.

For php applications I've tried to limit the execution of php scripts to just
the minimal set, sometimes using the `php-app` to just run a single php script
which works best with Symphony based applications (see drupal and wallabag).
Especially directories that contain user uploaded files shoud not allow php
execution.

One neat example is the hatta wiki, which uses the same .ini file to configure
uwsgi and hatta itself by using different ini sections. In the ideal world this
is how all applications should work.


## php configuration

uwsgi can configure php without having to edit the global `/etc/php/php.ini`
config file. I prefer to use the `php-set` option (ex. `php-set =
extension=pdo_pgsql`). This way my application setup doesn't depend on global
configuration and also it avoids possible conflicts in the configuration.
Especially important for session and temporary file storage.


## systemd integration

Running each application as a separate systemd service allows me to control the
life-cycle, security and resources of each application individually. There are
a lot of these features, like `PrivateTemp=`, `ProtectSystem`, `ProtectHome`,
namespaces etc. See the systemd documentation about
[resource-control](https://www.freedesktop.org/software/systemd/man/systemd.
resource-control.html) and
[exec](https://www.freedesktop.org/software/systemd/man/systemd.exec.html).
Checkout `AmbientCapabilities=`, `NoNewPrivileges=`, `SystemCallFilter=`  and
similar options too.

systemd also controls ordering of services, so I can configure an application
to only run after the redis and database service, but before the nginx service.

uwsgi supports the systemd socket activation protocol (see the nextcloud
example) which has several benefits. It makes it easier to setup the
permissions for the unix domain socket file, thus the application doesn't need any special
permissions or group setup. Also combined with the uwsgi options `die-on-idle = true` and
`idle = 600` you can make the apps only run when needed and shutdown when not
used.


## uwsgi options

uwsgi has a lot of options that can tune the application, `uwsgi --help` will
give you all of them, or check the [documentation page](http://uwsgi-docs.readthedocs.io/en/latest/Options.html).
Some of the  more  interesting are `processes`, `offload-threads`, `cheaper` (adaptive process spawning),
logging plugins, etc. The `threads` option is not recommended for php
applications since some php extensions are not thread-safe and they crash, but
can be used for python apps. Look up `harakiri` too, it'll make sure your
application is not stuck.
