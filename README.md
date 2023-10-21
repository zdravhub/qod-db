# qod-db
### Quote of the Day database

---

### Important

This fork is used for Kubernetes deployment.

For OpenShift deployment use original repo at [https://github.com/dpkshetty/qod-db](https://github.com/dpkshetty/qod-db)

---

### Ports
This deployment opens up database access for MariaDB on port `3306`. Please set the service for this deploymemt to use port 3306, which is also the default used by the qod-api deployment to access this database.

### Notes
* Works with [quay.io/fedora/mariadb-105](https://quay.io/repository/fedora/mariadb-105) image
