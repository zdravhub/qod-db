#FROM registry.redhat.io/rhel8/mariadb-105
FROM quay.io/fedora/mariadb-105

# needed for intialization
ENV MYSQL_USER=user
ENV MYSQL_PASSWORD=pass
ENV MYSQL_DATABASE=qod

# SQL creations damage Persistent Storage. Temporary stopped.
#
# Copy our sql scripts
#COPY 1_createdb.sql /tmp/
#COPY 2_authors.sql /tmp/
#COPY 3_genres.sql /tmp/
#COPY 4_quotes_sm.sql /tmp/
#
# Put our script to create db and tables in the init path
#COPY run.sh /usr/share/container-scripts/mysql/init/

# Expose the correct port for MariaDB
EXPOSE 3306

# Start the server
CMD ["run-mysqld"]
