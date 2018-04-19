#! /bin/bash

echo "Copying the code to the container"
docker cp geocoder_scripts geocoder_geocoder_1:/usr/local/src/
docker exec -u root geocoder_geocoder_1 \
  chown -R postgres:postgres /usr/local/src/geocoder_scripts
docker exec -u root geocoder_geocoder_1 \
  chmod +x /usr/local/src/geocoder_scripts/create-geocoder-database.bash
echo "Populating the database - will take some time!"
echo ""
echo ""
docker exec -u postgres -w /usr/local/src/geocoder_scripts geocoder_geocoder_1 \
  /usr/local/src/geocoder_scripts/create-geocoder-database.bash
echo "Retriving database backup"
docker cp geocoder_geocoder_1:/gisdata/geocoder.backup ./Raw
echo "Retriving shapefile archive"
docker cp geocoder_geocoder_1:/gisdata/tiger.zip ./Raw
echo "Retriving database population scripts"
docker cp geocoder_geocoder_1:/gisdata/nation.bash ./Raw
docker cp geocoder_geocoder_1:/gisdata/oregon.bash ./Raw
