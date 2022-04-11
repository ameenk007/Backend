use Dlithe_B2
create table employees
(
EID int primary key identity(1,1),
ENAME varchar(25) unique not null,
age int check(age>21),
designation varchar(25) default 'trainee',
)
select * from employees
insert into employees values('john',24,'IT')
insert into employees values('john2',22,'HR')
insert into employees values('john3',23,'HR')
insert into employees values('john4',23,'IT')
insert into employees(ENAME,age) values('Ameen',25)
create table demo
(
id int identity(1,1),
name varchar(20)
)
insert into demo values('John')
insert into demo values('John1')
insert into demo values('John2')
insert into demo values(4,'john3')
select * from demo
set identity_insert demo ON
insert into demo(id,name) values(5,'john3')
set identity_insert demo ON
dbcc checkident(demo,reseed,0);
set identity_insert demo off
insert into demo values('John4')
insert into demo values('John5')
insert into demo values('John6')
select ident_current('demo')
select IDENT_CURRENT('employees')
alter table employees drop PK__employee__C190170B1F1682FE
alter table employees add constraint pk_eid primary key(eid)