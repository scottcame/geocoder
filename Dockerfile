FROM postgres:10
LABEL maintainer="M. Edward (Ed) Borasky <znmeb@znmeb.net>"

# Install apt packages
RUN apt-get update \
  && apt-get install -qqy --no-install-recommends \
    postgis \
    postgresql-client-10 \
    postgresql-10-postgis-2.4 \
    postgresql-10-postgis-2.4-scripts \
    postgresql-10-postgis-scripts \
    postgresql-10-pgrouting \
    postgresql-10-mysql-fdw \
    postgresql-10-ogr-fdw \
    postgresql-10-python3-multicorn \
  && apt-get clean \
  && mkdir -p /gisdata \
  && chown -R postgres:postgres /gisdata
