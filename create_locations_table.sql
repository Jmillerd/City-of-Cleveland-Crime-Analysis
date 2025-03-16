CREATE TABLE locations (
    location_id SERIAL PRIMARY KEY,
    zip VARCHAR(10),
    address_public VARCHAR(255),
    std_parcelpin VARCHAR(50),
    ward INT,
    lat DECIMAL(9,6),
    lon DECIMAL(9,6),
    x DECIMAL(12,6),
    y DECIMAL(12,6),
    UNIQUE (zip, address_public, lat, lon) -- Avoid duplicate locations
);

SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'locations';
