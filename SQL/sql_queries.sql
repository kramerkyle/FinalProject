SELECT "Census_Tract_Number", "State", "County", "Life_Expectancy"
FROM life_expectancy;
ALTER TABLE life_expectancy ALTER COLUMN census_tract_number TYPE bigint USING census_tract_number::bigint;
CREATE TABLE health_data AS
	(SELECT life_expectancy.census_tract_number AS census_tract_number,
		obesity_data.stateabbr AS state,
	 	obesity_data.county AS county,
	 	life_expectancy.life_expectancy AS life_expectancy,
  		obesity_data.obesity AS obesity
	FROM life_expectancy
		JOIN obesity_data 
	 		ON life_expectancy.census_tract_number=obesity_data.census_tract_number);
			
SELECT * from health_data