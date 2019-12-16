FROM mysql:5.7.25
LABEL maintainer="pablos.ganan@gmail.com"

ENV POSTGRES_USER=postgres
ENV POSTGRES_DB=mediappbd4
ENV POSTGRES_PASSWORD=postgres

COPY ./scripts-postgresql/ /docker-entrypoint-initdb.d/
#CMD ["--default-authentication-plugin=mysql_native_password"]