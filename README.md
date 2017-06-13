# heap-logrotate Docker image.

Dockerized cron/rsyslogd/logrotate combo to rotate host Docker JSON logs and
`/vol/logs`.

## Usage

```
$ docker run -d -v /vol/logs:/vol/logs -v /var/lib/docker/containers:/vol/docker-logs heap-logrotate 
```

You can pass environment variables when launching the container:
```
$ docker run -d -e "VAR_LOGROTATE_MODE=weekly"  heap-memcached
```

## Environment variables

This image uses environment variables to override common configuration options.

The following environment variables are available (listed below with default
values):

```
VAR_LOGROTATE_MODE="daily"
VAR_LOGROTATE_ROTATE="7"
```

## License

All work found under this repository is licensed under the [Apache
License 2.0](LICENSE).

