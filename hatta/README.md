# Hatta and uWSGI config file.

Install Hatta in a USERBASE:

    PYTHONUSERBASE=/usr/share/webapps/hatta pip install --user Hatta

Then just run it as:

    uwsgi --ini hatta.ini

http://hatta-wiki.org/Install%20with%20uWSGI%20in%20USERBASE
