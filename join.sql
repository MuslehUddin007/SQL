create table Student_Information(
	Roll int not null unique,
	fName varchar(30) not null,
	Gender varchar(8),
	Age int
	constraint pk_Student_Information primary key(Roll)
)

insert into Student_Information
(Roll,fName,Gender,Age)
values
(101,'Musleh','Male',20),
(102,'Jemi','Female',21),
(103,'Joti','Female',20),
(104,'Tanjir','Male',22)

insert into Student_Information
values
(105,'Ops','Male',23),
(106,'Priya','Female',25),
(107,'Nusrat','Female',27)

select * from Student_Information

create table exam_result(
	Reg_Number int not null unique,
	Roll int not null unique,
	GPA float,
	rGroup varchar(15) not null,
	constraint pk_exam_result primary key(Reg_Number),
	constraint fk_exam_result foreign key(Roll) references Student_Information(Roll) 
)

insert into exam_result
(Reg_Number,Roll,GPA,rGroup)
values
(1111,103,3.5,'Arts'),
(1112,102,3.3,'Science'),
(1113,104,3.6,'Commerce'),
(1114,101,3.8,'Science')

select * from exam_result

--without join clause
select Student_Information.Roll,Reg_Number,fName,GPA,rGroup,Gender,Age
from Student_Information,exam_result
where Student_Information.Roll = exam_result.Roll

--join clause
select std.Roll,exam.Reg_Number,std.fName,exam.GPA,exam.rGroup,std.Gender,std.Age
from Student_Information as std join exam_result as exam
on std.Roll = exam.Roll
order by std.Roll

--inner join clause
select std.Roll,exam.Reg_Number,std.fName,exam.GPA,exam.rGroup,std.Gender,std.Age
from Student_Information as std inner join exam_result as exam
on std.Roll = exam.Roll
order by std.Roll

--left join clause
select std.Roll,exam.Reg_Number,std.fName,exam.GPA,exam.rGroup,std.Gender,std.Age
from Student_Information as std left join exam_result as exam
on std.Roll = exam.Roll
order by std.Roll

--right join clause
select std.Roll,exam.Reg_Number,std.fName,exam.GPA,exam.rGroup,std.Gender,std.Age
from Student_Information as std right join exam_result as exam
on std.Roll = exam.Roll
order by std.Roll

--create view
create view student_view as
select Roll,fName,Gender
from Student_Information

select * 
from student_view

