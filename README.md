# Dockerized MySQL with data

This repo can be used when you want to build a MySQL docker image populated with data.

## usage

1. Rename your database intialization scripts from `init.sql` to `01_init.sql`. If there's more than 1 scripts, rename them in a similar pattern. Just make sure your scripts get executed before scripts/9999_last.sh
2. Put your renamed scripts in the `sql` directory.
3. Set some environment variables like `MYSQL_DATABASE` in the Dockerfile if needed.
4. build it.

## credit

This SO question: https://stackoverflow.com/questions/32482780/how-to-create-populated-mysql-docker-image-on-build-time
