FROM registry.redhat.io/rhel8/mariadb-105

# needed for intialization
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=qod

COPY 1_createdb.sql /tmp/
