use Dlithe_B2
create table dept
(
DNo int primary key,
DNAME varchar(25)
)
insert into dept values (1, 'HR')
insert into dept values (2, 'IT')
insert into dept values (3, 'MT')
insert into dept values (4, 'support')
select * from dept
create table EMP
(
EID int primary key,
ENAME varchar(25),
DID int foreign key references dept(DNo)
)
insert into emp values(128871,'Ameen',1)
insert into emp values(128872,'Sridhar',2)
insert into emp values(128873,'Venkatesh',3)
insert into emp values(128874,'Deepak',4)
insert into emp values(128875,'Rohan',3)
insert into emp values(128876,'Sangmesh',2)
select * from EMP
create table Customer
(
CID int primary key,
CName varchar(25)
)
insert into Customer values(1,'Ameen')
insert into Customer values(2,'Sridhar')
insert into Customer values(3,'Venkatesh')
insert into Customer values(4,'Deepak')
insert into Customer values(5,'Rohan')
insert into Customer values(6,'Sangmesh')
select * from customer
create table product
(
PID int primary key,
PName varchar(25),
Price money
)
insert into product values (122871, 'TV', 45000)
insert into product values (122872, 'Laptop', 55000)
insert into product values (122873, 'Mobile', 75000)
insert into product values (122874, 'Gaming Console', 45000)
create table orders
(
OID int primary key,
ODate date,
Quantity int,
CNo int foreign key references customer(CID),
PNo int foreign key references product(PID)
)
insert into orders values(1010,'2022/04/11',2,6,122874)
insert into orders values(1011,'2022/03/11',3,1,122873)
insert into orders values(1012,'2022/03/01',1,2,122871)
insert into orders values(1013,'2022/04/01',2,5,122872)
select * from orders
create table Parent
(
PID INT PRIMARY KEY,
PARENTNAME VARCHAR(30)
)
create table Child
(
CID INT PRIMARY KEY,
CNAME VARCHAR(30),
PID INT CONSTRAINT parentid_fk references Parent(PID)
)
INSERT INTO Parent VALUES(101,'PARENT1')
INSERT INTO Parent VALUES(102,'PARENT2')
INSERT INTO Parent VALUES(103,'PARENT3')

INSERT INTO Child VALUES(200,'CHILD1',101)
INSERT INTO Child VALUES(201,'CHILD2',101)
INSERT INTO Child VALUES(202,'CHILD3',102)
delete from Parent where PID=101
select * from Parent
update parent set PID=1 where PID=101
alter table child drop constraint parentid_fk references parent(pid)
create table parent1
(
PID int primary key,
parentname varchar(30)
)
INSERT INTO parent1 VALUES(101,'PARENT1')
INSERT INTO parent1 VALUES(102,'PARENT2')
INSERT INTO parent1 VALUES(103,'PARENT3')
select * from parent1
create table child1
(
CID int primary key,
cname varchar(30),
PID int constraint parent1id_fk references parent1(PID)
)
INSERT INTO child1 VALUES(200,'CHILD1',101)
INSERT INTO child1 VALUES(201,'CHILD2',101)
INSERT INTO child1 VALUES(202,'CHILD3',102)
delete from parent1 where PID=101
update parent set pid=1 where pid=101
alter table child1 drop constraint parent1id_fk;
alter table child1 add constraint parent1id_fk foreign key(pid) references parent1(pid) references parent1(pid) on delete cascade;
drop table Parent
drop table parent1
drop table Child
drop table child1
create table parent
(
PARENTID int primary key,
PARENTNAME varchar(20)
)
create table child
(
CHILDID int primary key,
CHILDNAME varchar(20),
PARENTID int constraint parentid_fk references parent(parentid)
)
insert into parent values(100, 'Ameen')
insert into parent values(101, 'Sridhar')
insert into parent values(102, 'Venkatesh')
select *from parent
insert into child values(200,'child1',100)
insert into child values(201,'child2',100)
insert into child values(202,'child3',101)
delete from parent where PARENTID=101
update parent set PARENTID=1 where PARENTID=101
alter table child drop constraint parentid_fk
alter table child add constraint parentid_fk foreign key(parentid) references parent(parentid) on delete cascade;
delete from parent where parentid=101
select * from parent
select * from child
alter table child drop constraint parentid_fk
drop table child
create table child
(
cid int primary key,
cname varchar(30),
parentid int default 101 constraint parentid_fk references parent(parentid) on delete set default
)
INSERT INTO CHILD VALUES(200,'CHILD1',101)
INSERT INTO CHILD VALUES(201,'CHILD2',101)
INSERT INTO CHILD VALUES(202,'CHILD3',102)
delete from parent where parentid=102
alter table child drop constraint parentid_fk
alter table child add constraint parentid_fk foreign key(parentid)  references parent(parentid) on delete cascade
select * from parent
select * from child
drop table child

--sequence--
create sequence dbo.SequenceDemo
as int
start with 1 
increment by 1
select * sys.sequences where name='SequenceDemo'
create table seq_demo
(
id int primary key,
name varchar(25)
)
select next value for dbo.SequenceDemo
insert into seq_demo values(next value for dbo.SequenceDemo, 'Ameen')
insert into seq_demo values(next value for dbo.SequenceDemo, 'Sridhar')
insert into seq_demo values(next value for dbo.SequenceDemo, 'Venkatesh')
delete from seq_demo
select * from seq_demo
alter sequence sequencedemo restart with 1
select * from Customer
select * from Orders
select * from Product
select customer.cid,customer.CName,orders.OID,orders.ODate,orders.Quantity from Customer inner join orders on customer.cid=orders.CNo
select customer.cid,customer.CName,orders.OID,orders.ODate,orders.Quantity from Customer full join orders on customer.cid=orders.CNo
select customer.cid,customer.CName,orders.OID,orders.ODate,orders.Quantity from Customer right join orders on customer.cid=orders.CNo
select customer.cid,customer.CName,orders.OID,orders.ODate,orders.Quantity from Customer left join orders on customer.cid=orders.CNo
select c.cid,c.cname,o.oid,o.odate,o.quantity,p.pid,p.pname,p.price from customer as c inner join orders as o on c.cid=o.cno inner join product as p on o.pno=p.PID


---cast---
select cast(3.14 as int)
select cast(3.14 as varchar)
select cast(3.14 as datetime)
select cast(314 as money)

select convert(int,3.14)
select convert(varchar,3.14)

select CURRENT_USER
create table students
(
SID int,
Sname varchar(20),
dept varchar(10),
score int
)
insert into students values(1,'ameen','mt',99)
insert into students values(1,'ameen1','nt',93)
insert into students values(1,'ameen2','qt',94)
insert into students values(1,'ameen3','yt',91)
insert into students values(1,'ameen4','tt',96)
insert into students values(1,'ameen5','ut',98)
select * from students
create view view_score
as 
select sid,sname,score,iif(score>95,'distinction','merit') as remarks from students
select * from view_score
use Dlithe_B2
select * from employees
create synonym empl for dbo.employees
select * from empl
drop synonym if exists empl
select choose(6,1,2,3,7)as result
select * from orders
select odate, choose(day([odate]),'sun','mon','tue','wed','thur','fri','sat')as ordermonth from orders

