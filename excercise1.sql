create database excercise;

create table student(
	std_id smallint,
	std_name varchar(30),
	constraint pk_student primary key(std_id)
)

EXEC sp_rename 'student','student_details' --rename table

select * from student_details

create table student1(
	Std_Roll int not null unique,
	Std_Name varchar(30),
	Std_Gender varchar(7),
	Std_Age int,
	Std_GPA float,
	Std_City varchar(20),
	constraint pk_student1 primary key (Std_Roll)
)

select distinct Std_City from student1 --distinct keyword remove duplicate value

insert into student1 values
(101,'Musleh','Male',20,3.8,'Dhaka'),
(102,'Mujahid','Male',12,3.2,'Subidpur'),
(103,'Musahid','Male',5,3.6,'Subidpur'),
(104,'Ayemun','Female',23,3.0,'Chandpur')

select * from student1
order by Std_Age desc --desc for decending order

select distinct Std_Name,Std_GPA
from student1
where Std_City = 'Subidpur'
order by Std_GPA desc

select Std_Name,Std_City
from student1
where Std_GPA between 3.2 and 3.8 --gpa between 3.2 to 3.8
order by Std_Name

select *
from student1
where Std_Name like 'M%' --first alphabat 'M' and rest of alphabat doesn't matter

select *
from student1
where Std_Name like '__s%' --first two alphabat skip thirs alphabat 's' and rest of alphabat doesn't matter

select *
from student1
where Std_City IN ('Dhaka','Chandpur') --skipin or operator

select *
from student1
where Std_City not in ('Subidpur') --without 'Subidpur' city

select Std_Roll as ID,Std_Name as 'First Name' --change name when show output
from student1

update student1
set Std_Name = 'Akil' --change record using UPDATE keyword
where Std_Roll = 101

update student1
set Std_Name = 'Akhi'
where Std_Roll = 104

delete student1
where Std_Roll = 104 --delete any record

update student1
set Std_GPA = Std_GPA + .2        --update gpa add 0.2 
where Std_GPA between 3.2 and 3.6

select upper(Std_Name) as Name  --change letter to upper case and lower case
from student1

select concat(Std_Name,' is ',Std_Age,' years old') as Details --concat string
from student1

select truncate(Std_GPA,3) as GPA --3 number after point
from student1

select count(*) --count table record
from student1   

select max(Std_GPA)  -- show max result
from student1

select min(Std_GPA) --show min result
from student1

select sum(Std_GPA),avg(Std_GPA) --show sum and avarage 
from student1

select *
from student1
--where Std_GPA > (avg(Std_GPA)) --aggregate may not appear in the where clause
where Std_GPA > (select avg(Std_GPA) from student1) -- this statement is sub quary 

alter table student1
add Dept_id int,
    Dept_Name varchar(20)  --add column on table

select *
from student1

--alter table student1
exec sp_rename 'student1.Dept_id','Department_id','column' --change column name

alter table student1
drop column Dept_Name --delete column

update student1
set Department_id = 181 --update value
where Std_Roll = 101

select Std_City,sum(Std_GPA) as GPA_Sum
from student1
group by Std_City   --where>group by>order by

truncate table student_details --delete record not the whole table

select * from student_details




