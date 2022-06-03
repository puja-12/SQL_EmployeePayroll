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
