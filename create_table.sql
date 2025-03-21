CREATE TABLE crime_data (
    objectid SERIAL PRIMARY KEY,
    primary_key VARCHAR(50) UNIQUE NOT NULL,
    case_number VARCHAR(50) UNIQUE NOT NULL,
    district VARCHAR(50),
    ucr_desc VARCHAR(255),
    offense_year INT,
    time_group VARCHAR(50),
    reported_date TIMESTAMP,
    offense_month INT,
    offense_day INT,
    time_block VARCHAR(50),
    dow_name VARCHAR(20),
    dow INT,
    hour_of_day INT,
    days_ago INT,
    offense_date TIMESTAMP,
    statute VARCHAR(50),
    zip VARCHAR(10),
    stat_desc VARCHAR(255),
    address_public VARCHAR(255),
    std_parcelpin VARCHAR(50),
    ward INT,
    city VARCHAR(100),
    census_tract VARCHAR(50),
    census_tract_geoid VARCHAR(50),
    census_block_group VARCHAR(50),
    census_bg_geoid VARCHAR(50),
    census_block VARCHAR(50),
    census_block_geoid VARCHAR(50),
    lat DECIMAL(9,6),
    lon DECIMAL(9,6),
    x DECIMAL(12,6),
    y DECIMAL(12,6)
);


SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'crime_data';
