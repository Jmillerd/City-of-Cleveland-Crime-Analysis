
-- Create indexes on the crime_data table to speed up queries
CREATE INDEX idx_offensedate ON crime_data (offensedate);
CREATE INDEX idx_reporteddate ON crime_data (reporteddate);

CREATE INDEX idx_city_ward_district ON crime_data (city, ward, district);

CREATE INDEX idx_reporting_delay ON crime_data (reporteddate)
WHERE reporteddate IS NOT NULL AND offensedate IS NOT NULL;


CREATE INDEX idx_ucrdesc ON crime_data (ucrdesc);



VACUUM ANALYZE crime_data;
