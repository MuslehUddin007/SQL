create database SE224;

create Table Person
( person_id int, 
person_name varchar(40) not null,
person_age int,
person_address varchar(40) not null,
constraint pk_person primary key(person_id)
)

select * from Person;


-- to retrive all info

select * from Dept;

-- to insert values
insert into Dept(dept_name) values ('MCT');

insert into Dept(dept_name) values (40)  where dept_name = 'MCT';

insert into Person(person_id,person_name,person_age,person_address) values (1,'Rakib',25,'Dhaka');
insert into Person(person_id,person_name,person_age,person_address) values (2,'Shakil',25,'Cumilla');
insert into Person(person_id,person_name,person_age,person_address) values (3,'Sumon',25,'Khulna');

select person_id from Person;
select person_name from Person;
select person_age from Person;
select person_address from Person;

select person_name from Person where person_age>20;

select person_address from Person where person_age<30;


create Database Database1;


create table Dept(
dept_id int,
dept_name varchar (20) not null,
constraint pk_dept primary key(dept_id)
);

create table Student(
std_id varchar(35),
std_name varchar (40) not null,
did int,
constraint pk_std primary key(std_id),
constraint fk_std_dept foreign key(did) references Dept(dept_id)
);

create table Course(
Course_code varchar(5),
Course_name varchar (15) not null,
constraint pk_course primary key(Course_code),
);

create table Result(
Course_code varchar(5),
std_id varchar(35),
Grade int,
constraint fk_result_course  foreign key(Course_code) references Course(Course_code),
constraint fk_result_student  foreign key(std_id) references Student(std_id),
constraint pk_result primary key(Course_code,std_id)
);

create database CyberSecurity;

create table SWE(
dept_id int,
dept_name varchar(40),
constraint pk_swe primary key(dept_id)
)


create table CS (
std_id varchar(15),
std_name varchar(40),
dept_id int,
constraint pk_cs primary key(std_id),
constraint fk_cs_swe foreign key(dept_id) references SWE(dept_id) 
);

create table Major1(
course_code varchar(20),
course_name varchar(30),
constraint pk_major primary key(course_code)
)


create table CybersecurityMajor(
std_id varchar(15),
course_code varchar(20),
course_name varchar(30),
constraint fk_CybersecurityMajor_swe foreign key(std_id) references CS(std_id),
constraint fk_CybersecurityMajor_Major foreign key(course_code) references Major(course_code),
constraint pk_CyberMajor primary key(std_id,course_code)
)



-- rename table	
EXEC sp_rename 'CyberMajor', 'CybersecurityMajor';

select * from CybersecurityMajor;