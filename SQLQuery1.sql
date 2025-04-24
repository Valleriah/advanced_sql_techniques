create table dupes (id integer, name varchar(10)) 
insert into dupes values (1, 'NAPOLEON')
 insert into dupes values (2, 'DYNAMITE')
 insert into dupes values (3, 'DYNAMITE')
 insert into dupes values (4, 'SHE SELLS')
 insert into dupes values (5, 'SEA SHELLS')
 insert into dupes values (6, 'SEA SHELLS')
 insert into dupes values (7, 'SEA SHELLS'

 select * from dupes

 ---delete duplicate rows
 delete from dupes
 where id not in (select min(id)
					from dupes
					group by name)

select * from dupes

 create table dept_accidents
 ( deptno         integer,
  accident_name  varchar(20) ) 
 
insert into dept_accidents values (10,'BROKEN FOOT')
 insert into dept_accidents values (10,'FLESH WOUND')
 insert into dept_accidents values (20,'FIRE')
 insert into dept_accidents values (20,'FIRE')
 insert into dept_accidents values (20,'FLOOD')
 insert into dept_accidents values (30,'BRUISED GLUTE') 
 
select * from dept_accidents

delete from Emp
where DeptNo in(
select deptno
from dept_accidents
group by deptno
having COUNT(*) >= 3)

select table_name
from information_schema.tables
where table_schema = 'SMEAGOL'

select column_name, data_type, ordinal_position
from information_schema.tables
where TABLE_SCHEMA = 'Employee'
and TABLE_NAME = 'Emp'
