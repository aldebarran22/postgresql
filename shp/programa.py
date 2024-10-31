import geopandas as gpd

# Import .shp file into a GeoPandas DataFrame
geopandas_df = gpd.read_file('ZEE_Comores.shp')

# Convert geospatial data to latitude/longitude coordinate system
converted_df = geopandas_df.to_crs('EPSG:4326')

# Write data to CSV
converted_df.to_csv('ZEE_COmores.csv', index=False)
