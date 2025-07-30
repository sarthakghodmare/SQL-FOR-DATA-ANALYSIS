select * from master.employees 
--2nd highest salary
select  distinct salary 
from master.employees
order by  salary desc
offset 1 limit 1  

--view duplicated record in multiple columns
select employeeid,fullname,salary,age,department ,managerid,mobilenumber ,count(*) as count
from master.employees
group by employeeid,fullname,salary,age,department ,managerid,mobilenumber
having count(*) >1

---null value in column
SELECT managerid
FROM master.employees
WHERE managerid IS NULL;

--✅ 1. How do you handle NULL values in SQL?
select coalesce(managerid::Text, 'Unknown') from master.employees
select coalesce(employeeid::Text,'Unknown') from master.employees
select coalesce(name ,'Unknown') from master.employees
select coalesce(age::Text, 'Unknown') from master.employees
select coalesce(department,'Unknown') from master.employees
select coalesce(salary::Text,'Unknown') from master.employees




-- 2. How do you remove duplicate rows?
select distinct * from master.employees
--✅ 3. How do you trim or clean whitespaces in SQL?

select trim(name) as clean_name from master.employees
--4. How do you standardize text (e.g., make names uppercase
select upper(name) as uppercase from master.employees
select lower(emailid) as lowercase from master.employees
-- 5. How do you remove special characters from a string?
SELECT REGEXP_REPLACE(name, '[^a-zA-Z ]', '', 'g') AS cleaned_name
FROM master.employees
-- 6. How do you identify invalid data entries (e.g., negative salary)?
-- View invalid entries
select * from master.employees
where salary <0 
--7. How do you validate email addresses in SQL?
select * from master.employees
where emailid NOT LIKE '%a%.%'
-- 8. How do you convert a string to a date in PostgreSQL?
select TO_DATE(joiningdate::TEXT,'YYYY-MM-DD') from master.employees
SELECT joiningdate::date FROM master.employees;
--9.How do you drop columns that are not needed?
ALter table master.employees drop column status
select * from master.employees
--10How do you rename columns or tables?
Alter table master.employees rename column name to fullname
--11. How do you change a column’s data type?
Alter table  master.employees alter column salary TYPE numeric using salary::NUMERIC
--12. How do you replace certain values in a column?
update master.employees
set department='HUMAN RESOURCES'
where department='HR'
select * from master.employees
--13. How do you remove blank strings (empty but not NULL)?
delete  from master.employees
where fullname=''

-- 15. How do you remove rows where a column contains only whitespace?
delete  from master.employees
where trim(fullname)= ''