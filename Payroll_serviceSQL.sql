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


UC10:Adding Terisa in sales and marketing department

insert into employee_payroll values
('Terisa','2019-06-18','F','8796053421','ABC','Sales',35000,3800,700,400,31200);
insert into employee_payroll values
('Terisa','2019-06-18','F','8796053421','ABC','Marketing',45000,3000,700,400,42000);


.........Create entities and relationships........

create table Company
(compId INT PRIMARY KEY, compName varchar(20));
SELECT* from Company

create table employee
(empId int PRIMARY KEY,Name varchar(20),compId INT REFERENCES Company(compId) ,Phone varchar(20),Address varchar(200),Gender char);
select* from employee
alter table employee add Start_date DATE;
update employee set Start_Date='2022-08-28' where empId = 4;

create Table payroll
(empId INT REFERENCES employee(empId), BasicPay decimal,Deduction decimal, TaxablePay decimal ,IncomeTax decimal,NetPay decimal);
select* from payroll


CREATE TABLE DEPARTMENT(
DeptName VARCHAR(10),
empId INT REFERENCES employee(empId),
deptId int PRIMARY KEY);
select* from DEPARTMENT;


INSERT INTO Company VALUES(01, 'Hitachi' );
INSERT INTO Company VALUES(02,'TCS');
INSERT INTO Company VALUES(03,'wipro');
INSERT INTO Company VALUES(04,'Amazon');

INSERT INTO DEPARTMENT VALUES ( 'sales', 1,001);
INSERT INTO DEPARTMENT VALUES ( 'HR',2,002);
INSERT INTO DEPARTMENT VALUES ('Finance',3,003);
INSERT INTO DEPARTMENT VALUES ('Marketing', 4,004);

INSERT INTO employee VALUES (1, 'Terisa',02,'9897654321','America', 'F');
INSERT INTO employee VALUES (2, 'Jeck',01,'6785940321','London','M');
INSERT INTO employee VALUES (3, 'John',03,'8796053412','India','M' );
INSERT INTO employee VALUES (4, 'Terisa',02,'9897657857','SriLanka', 'F');

INSERT INTO payroll VALUES(1, 20000,1000,400,700,19000);
INSERT INTO payroll VALUES(2,30000,1200,400,700,28800);
INSERT INTO payroll VALUES(3,40000,2000,400,700,38000);
INSERT INTO payroll VALUES(4,35000,1000,400,700,34000);

UC12:  retrieve queries done especially in UC 4, UC 5 and UC 7 are working with new table structure

.............UC4: To retrieve all  data...........
SELECT  e.Name, d.DeptName, c.compName, p.BasicPay,p.NetPay,e.Gender,e.Address,e.Phone
FROM employee e
INNER JOIN DEPARTMENT d
ON e.empId=d.empId
INNER JOIN Company c
ON c.compId=e.compId
INNER JOIN payroll p
ON p.empId=e.empId;




