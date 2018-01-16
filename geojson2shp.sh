# Shell script to convert all GeoJSON files to Shapefiles, including those stored in subdirectories
# ========================================
# Assumes EPSG:4326 - convert if necessary
# Developed to convert GIS data stored in Cambridge, MA GitHub repo (https://github.com/cambridgegis/cambridgegis_data) for use in ArcGIS.
# To run: chmod +x ./geojson2shp && ./geojson2shp

set -f
for file in $(find "." -name *.geojson)
do
  filenew=`echo $file | sed "s/.geojson/.shp/"`
  ogr2ogr -t_srs "EPSG:4326" -overwrite $filenew  $file
done
