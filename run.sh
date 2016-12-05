#!/bin/bash

/systpl/systpl.jinja.py /systpl/logrotate.docker.tmpl > /etc/logrotate.d/docker
/systpl/systpl.jinja.py /systpl/logrotate.vol.tmpl > /etc/logrotate.d/vol
/systpl/systpl.jinja.py /systpl/cron.daily.logrotate.tmpl > /etc/cron.daily/logrotate
chmod +x /etc/cron.daily/logrotate

/systpl/systpl.jinja.py /systpl/rsyslog-50-default.conf.tmpl > /etc/rsyslog.d/50-default.conf
touch /vol/logs/`hostname`-syslog.log
chown syslog:syslog /vol/logs/`hostname`-syslog.log

/systpl/systpl.jinja.py /systpl/supervisor.conf.tmpl > /etc/supervisor.conf

exec supervisord -c /etc/supervisor.conf

