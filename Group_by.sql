CREATE TABLE employees1
(
    department_id integer NOT NULL,
    last_name character(50) NOT NULL,
    first_name character(50) NOT NULL,
    salary integer NOT NULL,
    start_date date NOT NULL
);

insert into employees1 (department_id, last_name, first_name, salary, start_date) values 
		(12, 'Johnson', 'Martin', 80000, '2012-03-11'),
		(23, 'Dawson', 'Sharon', 90000, '2019-09-17'),
		(20, 'Ricksen',	'Dario', 93000,	'2020-02-18'), 
		(20, 'Ricksen',	'Kirk',	100000,	'2006-05-19'), 
		(34, 'Lee', 'Lukas', 70000, '1999-12-12'), 
		(65, 'Lee', 'Becky', 60000, '2013-08-01'),
		(12, 'Johnson', 'Colin',	75000, '2013-11-02'),
		(20, 'Jonnson', 'Martha', 40000, '2017-01-18');	

SELECT last_name, COUNT(department_id) as departments
FROM employees1
GROUP by last_name;

SELECT last_name, COUNT(DISTINCT department_id) as departments
FROM employees1
GROUP by last_name;

SELECT last_name, COUNT(DISTINCT department_id) as departments
FROM employees1
GROUP by last_name
HAVING COUNT(DISTINCT department_id) = 2;