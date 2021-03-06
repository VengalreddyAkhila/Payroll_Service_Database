
--UC-1:-create a payroll service database

create database EmployeePayroll

use EmployeePayroll

--UC-2:-create payrollservice table

create Table EmployeePayroll(
EmployeeID int Identity(1,1) primary key,
EmployeeName varchar(32),
Salary float,
StartDate date
)

--UC-3:-CRUD operation

Insert into EmployeePayroll(EmployeeName,Salary,StartDate)
VALUES ('Akhila', 80000.00 , '2020-09-12'),
        ('Anuhya',75000.00, '2020-07-22'),
		('Ramu Sham',55000.00, '2021-08-26'),
		('Venu',45000.00, '2021-05-08'),
		('Prasad',40000.00, '2021-06-24'),
		('Radhika',35000.00, '2021-07-20');

--UC-4:- Retrieve all data from employeeparoll table

select *from EmployeePayroll

--UC5:-particular employee as well as all employees who have joined in particular date range 

Select Salary from EmployeePayroll Where EmployeeName='Anuhya'
Select Salary from EmployeePayroll Where StartDate BETWEEN CAST('2021-07-08' as date) and GetDate();

--UC6:- Add gender to employeetable and correct employee gender

Alter Table EmployeePayroll
Add Gender varchar(32);

UPDATE EmployeePayroll set Gender ='FeMale' where EmployeeName='Akhila'
UPDATE EmployeePayroll set Gender ='FeMale' where EmployeeName='Anuhya'
UPDATE EmployeePayroll set Gender ='Male' where EmployeeName='Ramu Sham'
UPDATE EmployeePayroll set Gender ='Male' where EmployeeName='Venu'
UPDATE EmployeePayroll set Gender ='male' where EmployeeName='Prasad'
UPDATE EmployeePayroll set Gender ='Female' where EmployeeName='Radhika'

--UC7:- Use of Sum, Avg, Min, Max, Count Functions

Select SUM(Salary) from EmployeePayroll
Select AVG(Salary) from EmployeePayroll
Select MIN(Salary) from EmployeePayroll
Select MAX(Salary) from EmployeePayroll
Select Count(EmployeeID) from EmployeePayroll
Select SUM(Salary) from EmployeePayroll where Gender = 'Female' GROUP BY Gender;
Select SUM(Salary) from EmployeePayroll where Gender = 'Male' GROUP BY Gender;
Select AVG(Salary) from EmployeePayroll where Gender = 'Female' GROUP BY Gender;
Select AVG(Salary) from EmployeePayroll where Gender = 'Male' GROUP BY Gender;


--Section 2:-(ER Diagram)
--UC8:-Extend the EmployeePayroll table with Phone, address and department

Alter Table EmployeePayroll Add
PhoneNumber varchar(10),
Department varchar(30),
Address varchar(30), 
CONSTRAINT DF_Address DEFAULT 'Indian' FOR Address

--UC9:-extend employee table with basic pay

Alter Table EmployeePayroll Add
BasicPay float,
Deduction float,
TaxablePay float,
IncomeTax float,
NetPay float;