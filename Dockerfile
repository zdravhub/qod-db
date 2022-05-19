FROM registry.redhat.io/rhel8/mariadb-105

# needed for intialization
ENV MYSQL_USER=user
ENV MYSQL_PASSWORD=pass
ENV MYSQL_DATABASE=qod

ENV MYSQL_ROOT_PASSWORD=root


COPY 1_createdb.sql /tmp/
COPY 2_authors.sql /tmp/
COPY 3_genres.sql /tmp/
COPY 4_quotes_sm.sql /tmp/

COPY run.sh /usr/share/container-scripts/mysql/init/

CMD ["run-mysqld"]
