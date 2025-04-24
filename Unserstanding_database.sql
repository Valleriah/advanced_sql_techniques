---check the list of databases
select name from sys.databases

---check the list of tables in a db
use BigData
select table_schema, table_name
from BigData.INFORMATION_SCHEMA.TABLES
where TABLE_TYPE = 'Base table'

---Check column details for a specific table:
select column_name, data_type, character_maximum_length, is_nullable
from bigdata.information_schema.columns
where table_name = 'Bigdata'

---identify relationships between tables by finding the primary and foreign keys
select tc.TABLE_NAME,
		kcu.column_name,
		tc.constraint_name
from bigdata.INFORMATION_SCHEMA.TABLE_CONSTRAINTS as tc
join BigData.INFORMATION_SCHEMA.KEY_COLUMN_USAGE as kcu
on tc.CONSTRAINT_NAME = kcu.CONSTRAINT_NAME
where tc.TABLE_NAME = 'bigdata'

---understand indexes for performance optimization:
select i.name as index_name,
		i.type_desc as index_type,
		c.name as column_name
from BigData.sys.indexes i
join BigData.sys.index_columns ic on i.object_id = ic.object_id and i.index_id = ic.index_id
join BigData.sys.columns c on ic.column_id = c.column_id and ic.object_id = c.object_id
where i.object_id = object_id('bigdata.dbo.BigData')


---Analyze the data characteristics in tables
---find the row count
select OBJECT_NAME(object_id) as tableName, row_count
FROM BigData.sys.dm_db_partition_stats
WHERE index_id < 2
ORDER BY row_count DESC;
---Bigdata has 1,812,888 rows

---get a feel of the data by checking the first 10 rows:
select top 10 * from BigData
---five columns in the table

---check for duplicates
select StoreID, count(*)
from bigdata 
group by StoreID
having count(*)>1


---because of the 1.5 million+ rows, queries will take long to load. To optimize, we use indexing
---we create a non-clustered index
---lets check the top 10 rows first
select top 10 * from bigdata

---get sales summary per store:
select storeID, sum(revenue) as TotalRevenue
from BigData
group by StoreID
order by TotalRevenue

---query took 11 sec to complete. Lets create an index on storeID for comparison
create nonclustered index store_indx on bigdata(storeid)

---Rerunning the query above took 00:00:00 secs. Lets try another
---find all sales on  a specific date
select date, sum(revenue) as TotalRev
from BigData
group by Date
order by TotalRev

---highest number of units sold in a month
create nonclustered index units_indx on Bigdata(units)

select division, sum(units) as TotalUnits
from BigData
---where Date = '2000-10-12'
group by Division
order by TotalUnits











