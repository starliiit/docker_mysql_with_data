FROM mysql:latest

# ENV MYSQL_DATABASE db_name
# ENV MYSQL_ROOT_PASSWORD blahblah

# required by `killall` command
RUN apt update && apt install -y psmisc 

# change `data_dir` to a non-volume path
# ref: https://stackoverflow.com/a/38843419
RUN sed -i 's|/var/lib/mysql|/var/lib/mysql2|g' /etc/mysql/my.cnf

# ref: https://stackoverflow.com/a/54713592
COPY sql/ /docker-entrypoint-initdb.d/
COPY scripts/9999_last.sh /docker-entrypoint-initdb.d/9999_last.sh
COPY scripts/wait_and_shutdown.sh /tmp/wait_and_shutdown.sh

RUN /entrypoint.sh mysqld & /tmp/wait_and_shutdown.sh
RUN rm /docker-entrypoint-initdb.d/*