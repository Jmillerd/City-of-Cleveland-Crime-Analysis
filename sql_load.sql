COPY crime_data(objectid, primary_key, case_number, district, ucr_desc, offense_year, time_group, reported_date, offense_month, offense_day, time_block, dow_name, dow, hour_of_day, days_ago, offense_date, statute, zip, stat_desc, address_public, std_parcelpin, ward, city, census_tract, census_tract_geoid, census_block_group, census_bg_geoid, census_block, census_block_geoid, lat, lon, x, y)
FROM '/path/to/your/csvfile.csv'
DELIMITER ',' CSV HEADER;
