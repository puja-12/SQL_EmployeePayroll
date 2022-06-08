UC1: To create database
CREATE DATABASE payroll_service
use payroll_service

UC2: To create Table
create table employee_payroll
(id INT identity(1,1)PRIMARY KEY,Name varchar(20), Salary int,Start_Date DATE) 

UC3: to insert data into table
insert into employee_payroll values
('Pooja',20000,'2022-02-10'),('Rahul',30000,'2022-04-12'),('Vivek',40000,'2019-05-15');


UC4: To retrieve all employee_payroll data
select* from employee_payroll;

UC5: Ability to retrieve salary data
SELECT Salary FROM employee_payroll
WHERE name = 'Pooja';

SELECT* from employee_payroll
where Start_date BETWEEN CAST('2022-01-01' AS DATE) AND GETDATE();
 
UC6:Ability to add Gender to employee_payroll table

Alter table employee_payroll add GENDER char;

UPDATE employee_payroll set GENDER='M' where Name = 'Rahul'or Name='Vivek'

UPDATE employee_payroll set gender='F' where Name = 'Pooja';


UC7: Ability to find sum,average,min,max & count
SELECT SUM(Salary) FROM employee_payroll
WHERE GENDER = 'M' GROUP BY GENDER;

SELECT AVG(Salary) FROM employee_payroll
WHERE GENDER = 'M' GROUP BY GENDER;

SELECT MAX(Salary) FROM employee_payroll
WHERE GENDER = 'M' GROUP BY GENDER;

SELECT GENDER, MIN(salary) FROM employee_payroll GROUP BY GENDER;

SELECT GENDER, COUNT(salary) FROM employee_payroll GROUP BY GENDER;

UC8:Ability to extend table by adding columns

Alter table employee_payroll add Phone varchar(12); 
alter table employee_payroll add address varchar(200) not null default 'ABC',department varchar(50);
update employee_payroll set Phone='9897654321',department='HR' where Name ='Pooja';
update employee_payroll set Phone='8967452310',department='Engeneering' where name='Rahul';
update employee_payroll set Phone='9000876543',department='Finance' where name='Vivek';

UC9:Extend employee_payroll to have Basic Pay, Deductions, Taxable Pay, Income Tax, Net Pay

alter table employee_payroll add BasicPay decimal,Deduction decimal, TaxablePay decimal ,IncomeTax decimal,NetPay decimal;
update employee_payroll set BasicPay=Salary;
update employee_payroll set Deduction=500 where department = 'Engeneering';
update employee_payroll set Deduction=1000 where department = 'HR';
update employee_payroll set Deduction=2000 where department = 'Finance';

update employee_payroll set IncomeTax=400;
update employee_payroll set TaxablePay=700;

update employee_payroll set NetPay = (BasicPay-Deduction);
SELECT* from employee_payroll
alter table employee_payroll drop column Salary;