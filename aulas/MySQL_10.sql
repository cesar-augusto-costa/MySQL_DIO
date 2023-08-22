-- CASE

SELECT year, month, day, wind_speed,
CASE
	WHEN wind_speed >= 40 THEN 'HIGH'
	WHEN wind_speed >= 30 THEN 'MODERATE'
    ELSE 'LOW'
    END AS wind_severity
FROM station_data;

SELECT year,
CASE
	WHEN wind_speed >= 40 THEN 'HIGH'
	WHEN wind_speed >= 30 THEN 'MODERATE'
    ELSE 'LOW'
    END AS wind_severity,
COUNT(*) AS record_count
FROM station_data
GROUP BY 1, 2;

-- DUAS QUERY SEM CASE ZERO / NULL TRICK

SELECT year, month, SUM(precipitation) AS tornado_precipitation
FROM station_data
WHERE tornado = 1
GROUP BY year, month;

SELECT year, month, SUM(precipitation) AS non_tornado_precipitation
FROM station_data
WHERE tornado = 0
GROUP BY year, month;

-- CASE ZERO / NULL TRICK

SELECT year, month,
SUM(
	CASE
    WHEN tornado = 1 THEN precipitation ELSE 0
    END
) AS tornado_precipitation,
SUM(
	CASE
    WHEN tornado = 0 THEN precipitation ELSE 0
    END
) AS non_tornado_precipitation
FROM station_data
GROUP BY year, month;

-- PRATICA

SHOW DATABASES;
USE company;
SHOW TABLES;

SELECT Fname, Salary FROM employee;

-- PRECISA DESABILITAR O "SAFE MODE"
UPDATE employee
SET Salary =
CASE
	WHEN Dno = 5 THEN Salary + 2000
	WHEN Dno = 4 THEN Salary + 1500
	WHEN Dno = 1 THEN Salary + 3000
    ELSE Salary + 0
END;


