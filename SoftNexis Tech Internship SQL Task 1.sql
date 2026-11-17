USE employees_sample;
show tables;
use employees_sample; 
-- Query 1 (Column selection) > Retrieves only specific columns instead of the entire table to save memory
select emp_no, first_name, last_name, hire_date from employees limit 10;
-- Query 2 (Calculated columns) > Calculates a 10% salary raise and rounds the result to 2 decimal places
select emp_no, salary as current_salary, round(salary * 1.10, 2) as new_salary from salaries limit 10;
-- Query 3 (Equality & Numerical Filtering) > Filters salaries strictly greater than 100000 while excluding a specific start date
select emp_no, salary, from_date from salaries where salary > 100000 and from_date != '1990-01-01' limit 15;
-- Query 4 (Range filtering with Between) > Finds all employees hired within the inclusive date range of the year 1995 
select emp_no, first_name, last_name, hire_date from employees where hire_date between '1995-01-01' and '1995-12-31' limit 15;
-- Query 5 (Pattern matching with Like & Not Like) > Matches first names with 'Mar', exact 4 letter last names, & excludes last names ending in 'z'
select emp_no, first_name, last_name from employees where first_name like 'Mar%' and last_name like '____' and last_name not like '%z' limit 15;
-- Query 6 (Combined AND / OR logic) > Uses parentheses to safely combine OR conditions with a minimum hire date filter
select emp_no, first_name, last_name, gender, hire_date from employees where (gender = 'F' or first_name = 'Georgi') and hire_date >= '1999-01-01' limit 15;
-- Query 7 (Null handling with Is Null) > Checks for any title records where the end date [to_date] is missing or null
select emp_no, title, from_date, to_date from titles where to_date is null limit 15;
-- Query 8 (Multi column sorting with Order by) > Sorts recent hires alphabetically by last name [A to Z] & then by newest hire date first
select emp_no, first_name, last_name, hire_date from employees where hire_date >= '1998-01-01' order by last_name asc, hire_date desc limit 20;
-- Query 9 (Output pagination with Limit & Offset) > Skips the top 10 highest salaries & displays ranks 11 through 20
select emp_no, salary, from_date from salaries order by salary desc limit 10 offset 10;
-- Query 10 (Data formatting & validation) > Combines first & last names & formats the hire date into YYYY-MM for clean reporting
select emp_no, concat(first_name, ' ', last_name) as full_name, date_format(hire_date, '%Y-%m') as hire_month from employees limit 10;
-- Query 11 (Data validation & summary) > Counts employees hired in the 1990s whose last name starts with 'S' & finds their earliest & latest hire dates
select count(*) as total_filtered, min(hire_date) as earliest_hire, max(hire_date) as latest_hire from employees where hire_date between '1990-01-01' and '1999-12-31' and last_name like 'S%';


-- Query (Final Query) > Joins employee, department, & salary tables to count sales hires from the 1990s with last names starting with 'S', along with their minimum salary & latest hire date
select
count(distinct e.emp_no) as total_filtered,min(s.salary) as min_salary,
max(e.hire_date) as latest_hire from employees e join dept_emp de on e.emp_no = de.emp_no
join departments d on de.dept_no = d.dept_no
join salaries s on e.emp_no = s.emp_no where d.dept_name = 'Sales'
and e.hire_date between '1990-01-01' and '1999-12-31' 
and e.last_name like 'S%';
