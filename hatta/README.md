# Hatta and uWSGI config file.

Install Hatta in a USERBASE:

```
export PYTHONUSERBASE=/srv/hatta-wiki/
pip install --user Hatta mercurial==3.9.2
```

Then just run it as (for a standalone http server):

```
uwsgi --ini hatta.ini
```

http://hatta-wiki.org/Install%20with%20uWSGI%20in%20USERBASE
