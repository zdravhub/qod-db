FROM registry.redhat.io/rhel8/mariadb-105 as builder

# That file does the DB initialization but also runs mysql daemon, by removing the last line it will only init
RUN ["sed", "-i", "s/exec \"$@\"/echo \"not running $@\"/", "/usr/bin/container-entrypoint"]

# needed for intialization
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=qod

COPY 1_createdb.sql /var/lib/mysql/data/
COPY 2_authors.sql /var/lib/mysql/data/
COPY 3_genres.sql /var/lib/mysql/data/
COPY 4_quotes_sm.sql /var/lib/mysql/data/

# Need to change the datadir to something else that /var/lib/mysql because the parent docker file defines it as a volume.
# https://docs.docker.com/engine/reference/builder/#volume :
#       Changing the volume from within the Dockerfile: If any build steps change the data within the volume after
#       it has been declared, those changes will be discarded.
# RUN ["/usr/local/bin/docker-entrypoint.sh", "run-mysqld", "--datadir", "/initialized-db", "--aria-log-dir-path", "/initialized-db"]
RUN ["/usr/bin/container-entrypoint", "run-mysqld"]

FROM registry.redhat.io/rhel8/mariadb-105


COPY --from=builder /var/lib/mysql/data /var/lib/mysql
