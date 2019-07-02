create database Bank

create table branch(
	branch_name varchar(30) not null,
	brahch_city varchar(30),
	asstes int,
	constraint pk_branch primary key(branch_name)
)

create table account(
	account_number int not null unique,
	branch_name varchar(30),
	balance int,
	constraint pk_account primary key(account_number),
	constraint fk_account foreign key(branch_name) references branch(branch_name)
)

create table customer(
	customer_name varchar(30) not null,
	customer_street int,
	customer_city varchar(30),
	constraint pk_customer primary key(customer_name)
)

create table deposite(
	customer_name varchar(30),
	account_number int,
	constraint fk_deposite foreign key(account_number) references account(account_number),
	foreign key(customer_name) references customer(customer_name)
)

create table loan(
	loan_number int not null unique,
	branch_name varchar(30),
	amount int,
	constraint pk_loan primary key(loan_number),
	constraint fk_loan foreign key(branch_name) references branch(branch_name)
)

create table borrower(
	customer_name varchar(30),
	loan_number int,
	constraint fk_borrower foreign key(customer_name) references customer(customer_name),
	foreign key(loan_number) references loan(loan_number)
)