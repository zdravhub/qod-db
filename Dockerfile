FROM registry.redhat.io/rhel8/mariadb-105

# needed for intialization
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=qod

COPY 1_createdb.sql /usr/share/container-scripts/mysql/init/
COPY 2_authors.sql /tmp/
COPY 3_genres.sql /tmp/
COPY 4_quotes.sql /tmp/

CMD ["run-mysqld"]
