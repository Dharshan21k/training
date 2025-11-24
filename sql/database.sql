create database zoho;
use zoho;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department_id INT,
    salary INT,
    join_date DATE,
    city VARCHAR(50)
);
INSERT INTO employees VALUES
(101, 'Amit', 1, 60000, '2020-01-10', 'Chennai'),
(102, 'Priya', 2, 55000, '2021-03-15', 'Bangalore'),
(103, 'Rahul', 1, 70000, '2019-07-22', 'Chennai'),
(104, 'Sneha', 3, 45000, '2022-11-13', 'Mumbai'),
(105, 'Vijay', 2, 80000, '2018-09-01', 'Hyderabad'),
(106, 'Sara', 3, 65000, '2020-05-30', 'Pune');

select * from employees;
select name from employees;
select distinct department_id from employees;
select * from employees order by name;
select count(*) from employees;
select department_id,count(*) from employees group by department_id;
select city from employees group by city;
select department_id,count(*) from employees group by department_id having count(*)>1;
CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);
INSERT INTO department VALUES
(1, 'IT'),
(2, 'Finance'),
(3, 'HR');

select e.name,d.dept_name from employees e inner join department d on e.department_id=d.dept_id;
select e.name,d.dept_name from employees e left join department d on e.department_id=d.dept_id;
select e.name,d.dept_name from employees e right join department d on e.department_id=d.dept_id;


select * from employees where salary=(select max(salary) from employees);
select max(salary) from employees where salary<(select max(salary) from employees);
select * from employees e inner join department d on e.department_id=d.dept_id having d.dept_name='IT';
select department_id,count(department_id) from employees group by department_id;
select department_id,count(depart
ment_id) from employees group by department_id having count(department_id)>1;
select * from employees order by  salary desc limit 2;
select * from employees order by salary desc limit 1 offset 1;
select * from employees where month(join_date)=01;	
select city,count(city) from employees group by city;
select department_id,max(salary) from employees group by department_id;
select * from employees where name LIKE'p%';
select * from employees where city in('chennai','pune');
select * from employees where salary between 50000 and 70000;
select YEAR(join_date),count(name) from employees group by year(join_date);
select name,case when salary>=70000 then 'high'
when salary>=50000 then 'medium'
else 'low'
end as salary_stat from employees;
select name from employees where department_id=1 union select name from employees where department_id=1;