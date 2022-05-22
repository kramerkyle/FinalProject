-- Creating tables for FinalProject
CREATE TABLE life_expectancy (
	state VARCHAR NOT NULL,
	county VARCHAR NOT NULL, 
	census_tract_number INT NOT NULL,
	life_expectancy INT NOT NULL,
	life_expectancy_range INT NOT NULL,
	life_expectancy_standard_error INT NOT NULL, 
	PRIMARY KEY (census_tract_number),
	UNIQUE (census_tract_number)
);
CREATE TABLE food_access (
	census_tract INT NOT NULL, 
	state VARCHAR NOT NULL,
	county VARCHAR NOT NULL,
	LILATracts_1And10 INT NOT NULL,
	LILATracts_halfAnd10 INT NOT NULL,
	LILATracts_1And20 INT NOT NULL,
	LILATracts_Vehicle INT NOT NULL,
	FOREIGN KEY (census_tract) REFERENCES life_expectancy (census_tract_number)
);