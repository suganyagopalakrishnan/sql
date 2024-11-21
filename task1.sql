create database sales;
use sales;
create table salesman
(salesman_id mediumint,name varchar(50),city varchar(50),comission float);
insert into salesman (salesman_id,name,city,comission) values
(5001,"James Hoog","New York",0.15),
(5002,'Nail Knite','Paris',0.13),
(5005,'Pit Alex','London',0.11),
(5006,'Mc Lyon','Paris',0.14),
(5007,'Paul Adam','Rome',0.13),
(5003,'Lauson Hen','San Jose',0.12);
select * from salesman;
create table orders(ord_no mediumint,purch_amt float,ord_date date,customer_id mediumint,salesman_id mediumint);
insert into orders(ord_no,purch_amt,ord_date,customer_id,salesman_id) values 
(70001,150.5, '2012-10-05', 3005, 5002),
(70009 ,270.65 ,'2012-09-10', 3001 ,5005),
(70002, 65.26 ,'2012-10-05', 3002 ,5001),
(70004, 110.5,'2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005 ,5002),
(70005 ,2400.6, '2012-07-27', 3007, 5001),
(70008 ,5760, '2012-09-10', 3002, 5001),
(70010 ,1983.43, '2012-10-10', 3004, 5006),
(70003 ,2480.4, '2012-10-10' ,3009, 5003),
(70012, 250.45 ,'2012-06-27', 3008 ,5002),
(70011 ,75.29, '2012-08-17', 3003 ,5007),
(70013, 3045.6 ,'2012-04-25', 3002, 5001);
select ord_date,salesman_id,ord_no,purch_amt from orders;
select * from orders order by ord_date,salesman_id,ord_no,purch_amt;
create table new_orders as (select ord_date,salesman_id,ord_no,purch_amt from orders);
select * from new_orders;
select distinct(salesman_id) from orders;
select name,city from salesman where city='Paris';
create table customer(customer_id mediumint,cust_name varchar(50),city varchar(50),grade mediumint,salesman_id mediumint);
insert into customer(customer_id,cust_name,city,grade,salesman_id) values
(3002 , 'Nick Rimando' , 'New York' , 100 ,5001),
(3007,'Brad Davis','New York' , 200 ,5001),
(3005,'Graham Zusi','California',200,5002),
(3008,'Julian Green','London',300,5002),
(3004,'Fabian Johnson','Paris',300,5006),
(3009,'Geoff Cameron','Berlin',100,5003),
(3003,'Jozy Altidor','Moscow',200,5007),
(3001,'Brad Guzan','London',null,5005);
select customer_id,cust_name,city,grade,salesman_id from customer where grade=200;
select ord_no,ord_date,purch_amt from orders where salesman_id=5001;
create table noble_win(YEAR year, SUBJECT varchar(50), WINNER varchar(50),COUNTRY varchar(50), CATEGORY varchar(50));
insert into noble_win(YEAR,SUBJECT,WINNER,COUNTRY,CATEGORY) values
(1970,'Physics', 'Hannes Alfven','Sweden','Scientist'),
(1970 ,'Physics', 'Louis Neel','France', 'Scientist'),
(1970 ,'Chemistry', 'Luis Federico Leloir','France', 'Scientist'),
(1970 ,'Physiology', 'Ulf von Euler','Sweden', 'Scientist'),
(1970,'Physiology', 'Bernard Katz','Germany', 'Scientist'),
(1970, 'Literature', 'Aleksandr Solzhenitsyn','Russia', 'Linguist'),
(1970, 'Economics', 'Paul Samuelson','USA', 'Economist'),
(1970, 'Physiology' ,'Julius Axelrod','USA', 'Scientist'),
(1971 ,'Physics' ,'Dennis Gabor','Hungary','Scientist'),
(1971 ,'Chemistry', 'Gerhard Herzberg','Germany' ,'Scientist'),
(1971 ,'Peace', 'Willy Brandt','Germany', 'Chancellor'),
(1971, 'Literature' ,'Pablo Neruda','Chile' ,'Linguist'),
(1971, 'Economics', 'Simon Kuznets','Russia', 'Economist'),
(1978, 'Peace', 'Anwar al-Sadat','Egypt', 'President'),
(1978, 'Peace', 'Menachem Begin','Israel', 'Prime Minister'),
(1987 ,'Chemistry', 'Donald J. Cram','USA', 'Scientist'),
(1987, 'Chemistry', 'Jean-Marie Lehn','France', 'Scientist'),
(1987 ,'Physiology', 'Susumu Tonegawa','Japan', 'Scientist'),
(1994, 'Economics', 'Reinhard Selten','Germany', 'Economist'),
(1994,'Peace', 'Yitzhak Rabin','Israel', 'Prime Minister'),
(1987, 'Physics', 'Johannes Georg Bednorz','Germany', 'Scientist'),
(1987, 'Literature', 'Joseph Brodsky','Russia', 'Linguist'),
(1987 ,'Economics', 'Robert Solow','USA', 'Economist'),
(1994, 'Literature', 'Kenzaburo Oe','Japan', 'Linguist');
select year ,subject,winner from noble_win where year=1970;
select sum(purch_amt) as total_purchase_amount from orders;
select name,cust_name,salesman.city from salesman join customer on salesman.city=customer.city;
select ord_no,purch_amt ,cust_name,city from customer join orders on customer.customer_id=orders.customer_id 
where purch_amt between 200 and 2000;