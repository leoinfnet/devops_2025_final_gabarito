FROM postgres:latest
ENV POSTGRES_PASSWORD=123456
ENV POSTGRES_DB=acme
COPY init.sql /docker-entrypoint-initdb.d/
EXPOSE 5432