#Built-in Functions - Exercise

#Find Names of All Employees By First Name
SELECT first_name, last_name FROM employees
WHERE first_name LIKE 'Sa%'
ORDER BY employee_id;


#Find Names of All Employees by Last Name 
SELECT first_name, last_name FROM employees
WHERE last_name LIKE '%ei%'
ORDER BY employee_id;


#Find First Names of All Employess 
SELECT first_name FROM employees
WHERE department_id in ('3','10') AND YEAR(hire_date) BETWEEN 1995 AND 2005
ORDER BY employee_id;


#Find All Employees Except Engineers 
SELECT first_name, last_name FROM employees
WHERE job_title NOT LIKE ('%engineer%')
ORDER BY employee_id;


#Find Towns with Name Length 
SELECT `name` FROM towns
WHERE CHAR_LENGTH(`name`) BETWEEN 5 AND 6
ORDER BY `name`;


#Find Towns Starting With 
SELECT town_id, `name` FROM towns
WHERE `name` LIKE ('M%') OR `name` LIKE ('K%') OR `name` LIKE ('B%') OR `name` LIKE ('E%')
ORDER BY `name`;


#Find Towns Not Starting With 
SELECT town_id, `name` FROM towns
WHERE `name` NOT LIKE ('R%') AND `name` NOT LIKE ('B%') AND `name` NOT LIKE ('D%')
ORDER BY `name`;


#Create View Employees Hired After 
CREATE VIEW `v_employees_hired_after_2000` AS 
SELECT first_name, last_name 
FROM employees
WHERE year(hire_date) > 2000;


#Length of Last Name
SELECT first_name, last_name FROM employees
WHERE CHAR_LENGTH(last_name) = 5;


#Countries Holding 'A' 
SELECT country_name, iso_code FROM countries
WHERE country_name LIKE '%a%a%a%'
ORDER BY iso_code;


#Mix of Peak and River Names 
SELECT p.peak_name, r.river_name,(
	lower(concat(p.peak_name,r.river_name))
) AS `Mix` FROM peaks AS p , rivers AS r
WHERE RIGHT(p.peak_name, 1) = LEFT(r.river_name,1)
ORDER BY 'Mix';


#Games From 2011 and 2012 Year 
SELECT `name`, DATE_FORMAT(start, "%Y-%m-%d") FROM games
WHERE year(`start`) BETWEEN 2011 AND 2012
ORDER BY `start` LIMIT 50;


#User Email Providers 
SELECT user_name, (SUBSTRING(email,LOCATE('@', email) + 1))`Email Provider` FROM users
ORDER BY `Email Provider`, user_name;


#Get Users with IP Address Like Pattern
SELECT user_name, ip_address FROM users
WHERE ip_address LIKE '___.1%.%.___'
ORDER BY user_name;


#Show All Games with Duration 
SELECT `name`,
(
	CASE
	WHEN extract(hour from start) BETWEEN 0 AND 11 THEN 'Morning'
	WHEN extract(hour from start) BETWEEN 12 AND 17 THEN 'Afternoon'
	ELSE 'Evening'
	END
	 
) AS `Part of the Day`,
(
	CASE
    WHEN duration BETWEEN 0 AND 3 THEN 'Extra Short'
    WHEN duration BETWEEN 4 AND 6 THEN 'Short'
    WHEN duration BETWEEN 7 AND 10 THEN 'Long'
    ELSE 'Extra Long'
    END
) AS `Duration`
 FROM games;
 
 
 #Orders Table 
 SELECT 
	product_name, 
	order_date, 
	date_add(order_date, INTERVAL 3 DAY) AS pay_due,
    date_add(order_date, INTERVAL 1 MONTH) AS deliver_date
FROM orders;