create database dlithe
use dlithe
create table details
(
NAME varchar(30),
num int,
Field varchar(30)
)
select * from details
alter database dlithe modify name=Dlithe_B2
alter table details alter column NAME varchar(20)
alter table details add age int;
alter table details drop column num
select * from details
drop table details
create table details
(
NAME varchar(30),
num int,
Field varchar(30)
)
alter table details alter column NAME varchar(20)
alter table details add age int;
alter table details drop column num
insert into  details values('Ameen', 'IT', 24)
insert into  details values('Sam', 'IT', 22)
insert into  details values('Peter', 'IT', 20)
insert into  details values('Luis', 'IT', 25)
select * from details
insert into details(NAME,age) values('Rohan',24)
select * from details
select NAME,age from details
select Field as Fd, age as A from details
select * from details