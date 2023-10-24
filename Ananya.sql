------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Title: Meesho - Business Analyst Interview - SQL Query
-- Video URL: https://www.youtube.com/watch?v=LikHiKuDXvg&t=55s&ab_channel=Ananya
-- Code  : https://github.com/ananya1105/SQL-Interview/blob/main/cinema_table.sql

create schema cinema;
use cinema;
drop table cinema_tickets;
create table cinema_tickets(seat_number varchar(100) not null, occupancy int);
insert into cinema_tickets(seat_number, occupancy) values('A1',1),('A2',1),('A3',0),('A4',0),('A5',0),('A6',0),
('A7',1),('A8',1),('A9',0),('A10',0),('B1',0),('B2',0),('B3',0),('B4',1),('B5',1),('B6',1),
('B7',1),('B8',0),('B9',0),('B10',0),('C1',0),('C2',1),('C3',0),('C4',1),('C5',1),('C6',0),
('C7',1),('C8',0),('C9',0),('C10',1);
with tab1 as (
select *,lead(occupancy,1) over (partition by substr(seat_number,1,1)  order by substr(seat_number,2,-1)) as s1,
lead(occupancy,2) over (partition by substr(seat_number,1,1) order by substr(seat_number,2,-1)) as s2,
lead(occupancy,3) over (partition by substr(seat_number,1,1) order by substr(seat_number,2,-1)) as s3,
lead(seat_number,3) over (order by substr(seat_number,2,-1)) as next_seat
from cinema_tickets
),
tab2 as(
select *,occupancy+s1+s2+s3 as score  from tab1)
select seat_number,next_seat from tab2 where score = 0;

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Meesho Business Analyst Interview 2 - SQL Quey
-- Video URL: https://www.youtube.com/watch?v=1t5BvhYItcM&ab_channel=Ananya
-- Code  : https://github.com/ananya1105/SQL-Interview/blob/main/customer_txn_table.sql

drop table customer_txn;
create table customer_txn(
   cust_id int NOT NULL,
   txn_date Date NOT NULL,
   txn_amt INT NOT NULL
   
);

INSERT INTO customer_txn (cust_id, txn_date, txn_amt) VALUES (101,STR_TO_DATE('01-3-2022', '%d-%m-%Y'),500); 
INSERT INTO customer_txn (cust_id, txn_date, txn_amt) VALUES (101,STR_TO_DATE('02-3-2022', '%d-%m-%Y'),400); 
INSERT INTO customer_txn (cust_id, txn_date, txn_amt) VALUES (101,STR_TO_DATE('03-3-2022', '%d-%m-%Y'),900); 
INSERT INTO customer_txn (cust_id, txn_date, txn_amt) VALUES (101,STR_TO_DATE('04-3-2022', '%d-%m-%Y'),800); 
INSERT INTO customer_txn (cust_id, txn_date, txn_amt) VALUES (102,STR_TO_DATE('01-3-2022', '%d-%m-%Y'),1600);
INSERT INTO customer_txn (cust_id, txn_date, txn_amt) VALUES (101,STR_TO_DATE('02-3-2022', '%d-%m-%Y'),2200); 
INSERT INTO customer_txn (cust_id, txn_date, txn_amt) VALUES (103,STR_TO_DATE('04-3-2022', '%d-%m-%Y'),200); 
INSERT INTO customer_txn (cust_id, txn_date, txn_amt) VALUES (103,STR_TO_DATE('05-3-2022', '%d-%m-%Y'),2200); 
INSERT INTO customer_txn (cust_id, txn_date, txn_amt) VALUES (103,STR_TO_DATE('08-3-2022', '%d-%m-%Y'),100); 
 
------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Title: Zetwerk Business Analyst Interview
-- Video URL: https://www.youtube.com/watch?v=puZhTnhp450&ab_channel=Ananya
-- Code  : https://github.com/ananya1105/SQL-Interview/blob/main/employee_table.sql
--       : https://github.com/ananya1105/SQL-Interview/blob/main/zetwerk_interview.sql


-- employee_table

create schema employee;
use employee;
drop table HR;
create table HR(empid varchar(10), join_date date not null, exit_date date);
-- empid stayed longest in the company. 
-- inserting employee_id, join_date, exit_date
-- remember 'Y' indicates yyyy(2022) and 'y' is yy(22)
insert into HR value(101,STR_TO_DATE('01-3-2022', '%d-%m-%Y'),STR_TO_DATE('10-05-2010','%d-%m-%Y'));
insert into HR value(102,str_to_date('11-04-1998','%d-%m-%Y'),null);
insert into HR value(104,str_to_date('19-06-1996','%d-%m-%Y'),str_to_date('10-05-2022','%d-%m-%Y'));
insert into HR value(106,str_to_date('15-08-2000','%d-%m-%Y'),str_to_date('10-12-2010','%d-%m-%Y'));
insert into HR value(105,str_to_date('10-12-2006','%d-%m-%Y'),null);
insert into HR value(100,str_to_date('26-11-2008','%d-%m-%Y'),str_to_date('10-05-2010','%d-%m-%Y'));
insert into HR value(109,str_to_date('30-09-2000','%d-%m-%Y'),str_to_date('10-05-2020','%d-%m-%Y'));
insert into HR value(111,str_to_date('12-02-2022','%d-%m-%Y'),str_to_date('10-05-2022','%d-%m-%Y'));
insert into HR value(131,str_to_date('11-05-2009','%d-%m-%Y'),null);
select * from HR;


-- zetwerk_interview#current date = exit_date

#tenure = exit_date-join_date / datediff(first_date, second_date) = fd-sd : return type is no of days
#where tenure is max
#floor, concat function
select * from HR;
with tab1 as (
select *,datediff(
case when exit_date is null then current_date() 
else exit_date
end, join_date )/365 as tenure
from HR)
select empid, concat(floor(tenure), ' years, ', floor((12*(tenure - floor(tenure)))),' months.') as time_period
from tab1 
where tenure >=ALL( select tenure from tab1)

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Title: cars24 Product Analyst Interview Question
-- Video URL: https://www.youtube.com/watch?v=PO4wqCGcuAA&ab_channel=Ananya
-- Code  : https://github.com/ananya1105/SQL-Interview/blob/main/student_marks_table.sql
--       : https://github.com/ananya1105/SQL-Interview/blob/main/highest_marks_using_window_function.sql



-- student_marks_table
   
create table student( Name VARCHAR(100), Roll_No INT NOT NULL);
INSERT INTO STUDENT(Name, Roll_No) values('Rashmi', 124);

INSERT INTO student (Name, Roll_No) 
VALUES('Rahul', 468), ('Srijas',85), ('Dravin',35);
select * from student;

create table marks(Roll_Num int not null, subject varchar(100), marks int);
INSERT INTO marks (Roll_Num,subject, marks) 
VALUES(124,'Maths', '88'), (468, 'Maths',90), (85,'Maths',90),(35,'Maths',81),(124,'English',77),(468,'English',70),
(85,'English',55),(35,'English',68),
(124,'Hindi',93),(468,'Hindi',99),
(85,'Hindi',89),(35,'Hindi',80);
select * from marks;

   -- highest_marks_using_window_function.

with tab1 as (
select s.*, subject, marks, rank( ) over (partition by Name, Roll_No order by marks desc) as rn
from student as s
inner join stu_marks as m
on s.roll_no = m.roll_num
)
select Name, subject
from tab1 
where rn=1;

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------


