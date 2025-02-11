FROM prom/mysqld-exporter:latest

EXPOSE 9104
ENTRYPOINT  [ "/bin/mysqld_exporter" ]
