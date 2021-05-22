use employees;
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));


-- This Query is to count the number of the male employees and females employees.
SELECT 
   sum(case when `gender` = 'M' then 1 else 0 end)AS male_NUM,
   sum(case when `gender` = 'F' then 1 else 0 end)as female_NUM
FROM  employees ;

-- This Query is to calculate ratio of males to females hired in the last 5 years.
SELECT 
   sum(case when `gender` = 'M' then 1 else 0 end)/count(*)*100 as male_ratio,
   sum(case when `gender` = 'F' then 1 else 0 end)/count(*)*100 as female_ratio
FROM    employees e
WHERE   hire_date  > '1995-01-31';

-- This Query is to calculate the ratio of males to females in each department 
SELECT 
   sum(case when `gender` = 'M' then 1 else 0 end)/count(*)*100 AS male_ratio,
   sum(case when `gender` = 'F' then 1 else 0 end)/count(*)*100 as female_ratio,  dd.dept_name
FROM  employees e
    JOIN  dept_emp D ON e.emp_no = D.emp_no
    JOIN  departments dd ON D.dept_no = dd.dept_no
    WHERE  hire_date  > '1995-01-31'  group by dd.dept_name;

-- This Query is to retrive Avg salaries for the emplyees and group thim based on their genders.
SELECT e.gender, AVG(s.salary)
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
GROUP BY e.gender;


-- This Query is to retrive info of the employees from the employees table and salaries table. 
SELECT e.emp_no, e.first_name, e.last_name, e.hire_date, s.to_date, s.salary
FROM employees e 
JOIN salaries s ON e.emp_no = s.emp_no
group by emp_no;

#COVID_19 CASE STUDY

-- The rest of Queries is to retrive info of the salary for each department separately

SELECT 
e.First_name, e.last_name, e.emp_no, s.salary, e.hire_date, d.from_date, d.to_date
FROM
    employees e
        JOIN
        dept_emp d ON e.emp_no = d.emp_no
	JOIN
    Departments dd ON d.dept_no = dd.dept_no
    JOIN
    salaries s ON e.emp_no = s.emp_no
    Where dept_name = "Marketing"
    GROUP BY e.emp_no;
    
SELECT 
e.First_name, e.last_name, e.emp_no, s.salary, e.hire_date, d.from_date, d.to_date
FROM
    employees e
        JOIN
        dept_emp d ON e.emp_no = d.emp_no
	JOIN
    Departments dd ON d.dept_no = dd.dept_no
    JOIN
    salaries s ON e.emp_no = s.emp_no
    Where dept_name = "Finance"
    GROUP BY e.emp_no;
    
    SELECT 
e.First_name, e.last_name, e.emp_no, s.salary, e.hire_date, d.from_date, d.to_date
FROM
    employees e
        JOIN
        dept_emp d ON e.emp_no = d.emp_no
	JOIN
    Departments dd ON d.dept_no = dd.dept_no
    JOIN
    salaries s ON e.emp_no = s.emp_no
    Where dept_name = "Human Resources"
    GROUP BY e.emp_no;
    
      SELECT 
e.First_name, e.last_name, e.emp_no, s.salary, e.hire_date, d.from_date, d.to_date
FROM
    employees e
        JOIN
        dept_emp d ON e.emp_no = d.emp_no
	JOIN
    Departments dd ON d.dept_no = dd.dept_no
    JOIN
    salaries s ON e.emp_no = s.emp_no
    Where dept_name = "Production"
    GROUP BY e.emp_no;
    
     SELECT 
e.First_name, e.last_name, e.emp_no, s.salary, e.hire_date, d.from_date, d.to_date
FROM
    employees e
        JOIN
        dept_emp d ON e.emp_no = d.emp_no
	JOIN
    Departments dd ON d.dept_no = dd.dept_no
    JOIN
    salaries s ON e.emp_no = s.emp_no
    Where dept_name = "Development"
    GROUP BY e.emp_no;
    
     SELECT 
e.First_name, e.last_name, e.emp_no, s.salary, e.hire_date, d.from_date, d.to_date
FROM
    employees e
        JOIN
        dept_emp d ON e.emp_no = d.emp_no
	JOIN
    Departments dd ON d.dept_no = dd.dept_no
    JOIN
    salaries s ON e.emp_no = s.emp_no
    Where dept_name = "Human Resiurce"
    GROUP BY e.emp_no;
    
     SELECT 
e.First_name, e.last_name, e.emp_no, s.salary, e.hire_date, d.from_date, d.to_date
FROM
    employees e
        JOIN
        dept_emp d ON e.emp_no = d.emp_no
	JOIN
    Departments dd ON d.dept_no = dd.dept_no
    JOIN
    salaries s ON e.emp_no = s.emp_no
    Where dept_name = "Quality Management"
    GROUP BY e.emp_no;
    
     SELECT 
e.First_name, e.last_name, e.emp_no, s.salary, e.hire_date, d.from_date, d.to_date
FROM
    employees e
        JOIN
        dept_emp d ON e.emp_no = d.emp_no
	JOIN
    Departments dd ON d.dept_no = dd.dept_no
    JOIN
    salaries s ON e.emp_no = s.emp_no
    Where dept_name = "Sales"
    GROUP BY e.emp_no;
     SELECT 
e.First_name, e.last_name, e.emp_no, s.salary, e.hire_date, d.from_date, d.to_date
FROM
    employees e
        JOIN
        dept_emp d ON e.emp_no = d.emp_no
	JOIN
    Departments dd ON d.dept_no = dd.dept_no
    JOIN
    salaries s ON e.emp_no = s.emp_no
    Where dept_name = "Research"
    GROUP BY e.emp_no;
    
     SELECT 
e.First_name, e.last_name, e.emp_no, s.salary, e.hire_date, d.from_date, d.to_date
FROM
    employees e
        JOIN
        dept_emp d ON e.emp_no = d.emp_no
	JOIN
    Departments dd ON d.dept_no = dd.dept_no
    JOIN
    salaries s ON e.emp_no = s.emp_no
    Where dept_name = "Customer Service"
    GROUP BY e.emp_no;






