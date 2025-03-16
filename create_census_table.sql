CREATE TABLE census_data (
    census_id SERIAL PRIMARY KEY,
    census_tract VARCHAR(50),
    census_tract_geoid VARCHAR(50),
    census_block_group VARCHAR(50),
    census_bg_geoid VARCHAR(50),
    census_block VARCHAR(50),
    census_block_geoid VARCHAR(50),
    UNIQUE (census_tract, census_block)
);

SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'census_data';
