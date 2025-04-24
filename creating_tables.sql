create table Employees(
	Employee_no Integer
	,dept_no smallint
	,first_name varchar(12)
	,last_name char(20)
	,salary decimal(8,2))
---this table is called a heap since it does not have an index. 

--creating an index on the employee_no col makes the table no longer a heap
---table can now be sorted by this index
---you can only create one clustered index per table
create unique clustered index indx1 
on employees(employee_no)

---a table can have multiple non-cluetered indexes
create index indx2 
on employees(dept_no)

---create the order table
create table orders(
		order_number int
		,customer_number int
		,order_date date
		,order_total decimal(10,2))

---using select into to create another table
select *
into new_orders
from orders

---create more tables for the db
CREATE TABLE Dept_Intl
 (Dept_No INTEGER NOT NULL PRIMARY KEY
 ,Dept_Name CHAR (20)
 ,Mgr_No int      
,Budget DECIMAL (10,2));

CREATE TABLE Emp_Intl
(Employee_No INTEGER 
,Dept_No INTEGER FOREIGN KEY REFERENCES 
		 Dept_Intl(Dept_No) ON DELETE NO ACTION  ---creates a foreign key that references the dpt_intl table
 ,First_Name VARCHAR(12)    
 ,Last_Name CHAR(20)    
,Salary DECIMAL(8,2)) 

---start inserting values
insert into Dept_Intl
values(100,'sales',2000000,500000)

INSERT INTO Emp_Intl
 Values (2000000, 100, 'Squiggy', 'Jones', 75000.00)
