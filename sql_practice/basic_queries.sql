SELECT * FROM Students;

SELECT * FROM Courses;

SELECT * FROM Enrollments;


--using update command id = 7 change loaction jaipur to banglore
UPDATE Students
SET city = 'Bangalore'
WHERE s_id = 7;

--using where clause
SELECT *
FROM Students
WHERE city = 'Bangalore';

--sorted names by first_name
SELECT *
FROM Students
ORDER BY first_name ASC;

--count number of people in the each city
SELECT 
	city,
	COUNT(*) AS Total
FROM Students
GROUP BY city
HAVING COUNT(*) > 1;

--select distinct city by sorted
SELECT DISTINCT(city)
FROM Students
ORDER BY city ASC;

--slect top 5 rows
SELECT  TOP 5 first_name, last_name
FROM Students
ORDER BY first_name ASC;


--courses
SELECT *
FROM Courses
WHERE c_fees > 5000;


--courses using or
SELECT *
FROM Courses
WHERE c_fees IN(5000, 10000);


--course fee range using between
SELECT *
FROM Courses
WHERE c_fees BETWEEN 5000 AND 10000;


--find avg course fees
SELECT
	course_name,
	AVG(c_fees) AS avg_fee
FROM Courses
GROUP BY course_name
HAVING AVG(c_fees) > 6000;

--pattern search
SELECT 
	course_name
FROM Courses
WHERE course_name LIKE 'C%';

--joins
SELECT *
FROM Students INNER JOIN Courses
ON Students.s_id = Courses.c_id;



SELECT *
FROM Students LEFT JOIN Courses
ON Students.s_id = Courses.c_id;



SELECT *
FROM Students RIGHT JOIN Courses
ON Students.s_id = Courses.c_id;



SELECT *
FROM Students FULL JOIN Courses
ON Students.s_id = Courses.c_id;

--single row functions
SELECT
	UPPER(first_name) as Upper_name
FROM Students;

--find length of firstname
SELECT
	first_name,
	LEN(first_name) as TOTAL
FROM Students;

--concat firstname and lastname
SELECT
	first_name,
	last_name,
	CONCAT(first_name,' ', last_name) AS full_name
FROM Students;


--replace function banglore to bnglr
SELECT first_name,
	last_name,
	REPLACE(city, 'Bangalore', 'Bnglr')
FROM Students;

--using substring function
SELECT 
	first_name,
	SUBSTRING(first_name, 3, len(first_name))
FROM Students;
