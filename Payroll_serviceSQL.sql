UC1: To create database
CREATE DATABASE payroll_service
use payroll_service

UC2: To create Table
create table employee_payroll
(id INT PRIMARY KEY IDENTITY (1,1),Name varchar(20), Salary int,Start_Date DATE) 
