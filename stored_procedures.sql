select * from students_table
 

---create stored procedure:
create procedure dbo.list_students ---dbo is the database schema and stands for "database owner"
as
select *
from students_table
order by class_code
---the create procedure command will create the procedure and store it in the schema

---excecuting a procedure
EXEC list_students

---create an input parameter
create procedure dbo.students_list
		@class_code char(2)
as
		select student_id
				,last_name
				,first_name
				,class_code
		from students_table
		where class_code = @class_code

---when executing this procedure,  you must specify the input parameter
exec dbo.students_list 'FR'

---create an output parameter
create procedure dbo.students_count
		@class_code char(2), --is the input parameter
		@class_count int output  ---specify the output parameter
as
		select class_code
		from students_table
		where  class_code = @class_code
		select @class_count = @@ROWCOUNT


declare @class_count int  ---for procedures with output parameters, you must declare the output variable.

execute dbo.students_count 'FR', ---excecute by passing the input par
@class_count output --and the output parameter

print @class_count --prints the class codes
select @class_count ---counts the class codes

---altering a stored procedure
alter procedure dbo.list_students
as
select *
from students_table
order by case class_code
		when 'Fr' then 1
		when 'so' then 2
		when 'jr' then 3
		when 'sr' then 4
		else 5
	end, grade_pt desc

exec list_students

---using a procedure to delete a row from a table
CREATE PROCEDURE dbo.del_student
    @student_id INT
AS
BEGIN
    DELETE FROM students_table
    WHERE student_id = @student_id;
END;

execute dbo.del_student @student_id = 260000

---using a procedure to populate a table:
create table my_table
(count_er int,
my_time datetime)

create procedure insert_table
as
declare  @counter integer=0
while @counter < 5
	begin
		set @counter = @counter+1
		insert into my_table
		values(@counter, CURRENT_TIMESTAMP)
	end

insert_table

select * from my_table
