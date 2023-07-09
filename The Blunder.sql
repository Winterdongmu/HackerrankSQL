-- Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's 00 key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeroes removed), and the actual average salary.

-- Write a query calculating the amount of error (i.e.: actual−miscalculated average monthly salaries), and round it up to the next integer.

SELECT CEIL(AVG(Salary)-AVG(CONVERT(REPLACE(convert(Salary, char(4)), '0', ''), UNSIGNED INTEGER)))
FROM EMPLOYEES;


/* OR */


select ceil(avg(salary) - avg(to_number(replace(to_char(salary),'0')))) from employees;