FROM postgres
USER postgres
COPY northwind.sql /docker-entrypoint-initdb.d/northwind.sql
COPY create_db.sh /docker-entrypoint-initdb.d/create_db.sh
CMD ["postgres"]
