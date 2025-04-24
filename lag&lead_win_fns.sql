---lag and lead allow you to compare different rows by specifying an offset

---used to analyze change and variation
select * from students_table

select student_id, last_name, class_code, Grade_pt,
		lead(grade_pt, 2) over(order by grade_pt, class_code) as lead_all
from students_table