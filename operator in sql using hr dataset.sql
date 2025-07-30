select * from master.employees
--1.comparison operator that is '='

select * from master.employees where department ='HR'

--2.Logical operator
--a.AND
select * from master.employees where age>25 and department ='Finance'

--b.or
select * from  master.employees where department ='Finance' or department ='HR'

--c.NOT
select from  master.employees where NOT department='HR'

--3.special operator
--a.between
select * from master.employees where AGE between 25 and 30

--b.in
select * from master.employees where department in('HR','Finance')

--c.like
select * from master.employees where name like 'J%'

--d.is null
select * from master.employees where managerid is null


