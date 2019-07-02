create database Vehicle

create table Licence(
	Licence_Id int not null unique,
	Surename varchar(20),
	First_Name varchar(20),
	Address_No text,
	Phone_No int,
	DOB date,
	constraint pk_Licence primary key(Licence_Id)
)

create table Registration(
	Licence_Id int not null unique,
	Car_Id int not null unique,
	Registred date,
	constraint pk_Registration primary key(Car_Id),
	constraint fk_Registration foreign key(Licence_Id) references Licence(Licence_Id)
)

create table Car(
	Car_Id int not null unique,
	Model varchar(20),
	mYear int,
	Colour varchar(10)
	constraint fk_Car foreign key(Car_Id) references Registration(Car_Id)
)