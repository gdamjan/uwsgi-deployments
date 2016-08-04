cgit-uwsgi.sh can be put anywhere on your $PATH, for ex. ~/.local/bin or /usr/local/bin.

Put the cgitrc in ~/.local/etc/cgitrc or in /etc/cgitrc (but then modify CGIT_CONFIG in the script).

The shell script is reused as uwsgi ini config file. Too bad cgit doesn't support ini-style sections for its config
file, that way it would be possible to only use a single file.

Run cgit-uwsgi.sh from a directory with git repositories. Open http://localhost:8000/.

cgit/uwsgi paths are based on Archlinux where you need to install the cgit, uwsgi and uwsgi-plugin-cgi packages. It
should be similar for all other distributions.
