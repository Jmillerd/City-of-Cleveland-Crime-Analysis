
---Handle Primary key conversion from CSV to SQL
"""
Open the CSV without Excel's automatic conversion:

    Open Excel, go to Data > Get Data > From Text/CSV.
    When importing, set column data type for:
        IDs & ZIP codes → "Text" (to keep leading zeros).
        Numbers → "Number" (to avoid scientific notation).
    Save As CSV (UTF-8) before importing into PostgreSQL.

"""

-- Remove columns 'x' and 'y' (not needed for analysis)
ALTER TABLE temp_crime_data 
DROP COLUMN x, 
DROP COLUMN y;

-- Convert 'primary_key' to TEXT
ALTER TABLE crime_data 
ALTER COLUMN primary_key TYPE TEXT USING primary_key::TEXT;


-- Convert 'zip' to TEXT (to preserve leading zeros)
ALTER TABLE temp_crime_data 
ALTER COLUMN zip TYPE VARCHAR(10);

-- Convert 'lat' and 'lon' to FLOAT or DECIMAL (for more precision)
ALTER TABLE temp_crime_data 
ALTER COLUMN lat TYPE DECIMAL(9,6),
ALTER COLUMN lon TYPE DECIMAL(9,6);

-- Convert 'reported_date' and 'offense_date' to TIMESTAMP
ALTER TABLE temp_crime_data 
ALTER COLUMN reported_date TYPE TIMESTAMP USING reported_date::TIMESTAMP,
ALTER COLUMN offense_date TYPE TIMESTAMP USING offense_date::TIMESTAMP;

-- Convert 'offense_year' to INTEGER
ALTER TABLE temp_crime_data 
ALTER COLUMN offense_year TYPE INTEGER USING offense_year::INTEGER;

-- Normalize 'city' values to 'cleveland'
UPDATE crime_data
SET city = 'clevleand'
WHERE LOWER(city) IN ('cle', 'clevealnd', 'clevelad', 'cleveladn', 'clevelan', 'cleveland', 'clevelanld', 
                      'clevelandoh', 'clevelandl', 'clevelandd', 'clevelandoh', 'clevland', 'cleveland ohio 44109', 'clevelando', 'clevelandld', 'clevealand')
AND city != 'cleveland heights';  -- Prevents accidental changes to Cleveland Heights


-- Normalize 'city' values to 'columbus'
UPDATE crime_data
SET city = 'columbus'
WHERE LOWER(city) IN ('columus');


UPDATE crime_data
SET zip = '44118'
WHERE zip = '44118CLEVE';   

