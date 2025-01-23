create database peoplesdb2;
use peoplesdb2;

create table country ( ID int primary key, 
country_name varchar(100), population int , 
area varchar(100));

create table persons (ID INT primary key,
F_name varchar(100), L_name varchar(100), 
population int,  rating decimal(10,2),
Country_ID int, country_name varchar(100));

insert into country (ID, country_name, population,
area) values (1, 'UK',1200000, 'Europe'),
(2,'Canada',800000,'North America'),
(3,'poland',1300000,'Europe'),
(4,'USA',1800000,'America'),
(5,'India',2500000,'asia'),
(6,'Australia',2000000,'Australia'),
(7,'china',4500000,'Asia'),
(8,'japan',700000,'Asia'),
(9,'france',900000,'Europe'),
(10,'germany',6500000,'Europe');

Insert into persons (ID, F_name, L_name, population,
rating, Country_ID, country_name) values
(1,'ram','kumar',1200000,4.7,1,'UK'),
(2,'raj','mohan',2500000,4.0,5,'India'),
(3,'meera','nandhan',2500000,4.0,5,'India'),
(4,'alexia','cox',2000000,4.2,6,'Australia'),
(5,'faye', 'bowen',800000,4.6,2,'canada'),
(6,'donna','brown',1800000,5.0,4,'USA'),
(7,'michelle','davies',1800000,5.0,4,'USA'),
(8,'sarah','thomas',6500000,4.8,10, 'germany'),
(9,'prasad','varkey',2500000,4.0,5,'India'),
(10,'jackey','rose',1200000,4.7,1,'UK');

#1.NO OF PERSONS FROM EACH COUNTRY
select country_name, count(*) as No_persons from 
persons group by country_name;

#2.NO OF PERSONS HIGH TO LOW
select country_name, count(*) as No_persons from 
persons group by country_name order by No_persons desc;

#3.FINDING AVERAGE RATING
select country_name , F_name, avg(rating) from persons
group by country_name, F_name
having avg(rating)>3.0;

#4.COUNTRIES WITH SAME RATING OF USA
select country_name, rating from persons
where rating in ( select rating from persons where 
country_name ='USA');

#5. COUNTRIES WITH MORE POPULATION THAN AVERAGE
select country_name from persons
where population > ( select avg(population) from persons);

#6. NEW DATABASE

create database product;
use product;

create table customer (Customer_ID int primary key ,
First_name varchar(50), Last_name varchar(50), Email varchar(50),
Phone_No varchar(15), Adress varchar(100), City varchar(50),
State varchar(50), Zip_code varchar(10), Country varchar(50));

insert into customer values (1,'Raymond','Bryan','raybryn@exmple.com',
7856493937,'18 burge street', 'hereford','herefordshire',
'HR68DE','England'),(2,'David','Evans','davidev@emple.com',
9956347686,'2 high street','cardiff','kent','CF15TG','wales'),
(3,'Katie','watkins','katwt@emple.com',9988776655,'34 bargates',
'Northampton','Northamptonshire','NN13DG','England'),
(4,'Deepak','ram','dpkram@exmple.com',7685940325,'45 mill roadf',
'London','Westmininster','SW23RF','England');

select*from customer;

#1. CREATING VIEW FOR CUSTOMER NAME AND EMAIL
create view Customer_info as
select First_name, Last_name, Email from customer;

select * from customer_info;

insert into customer values (5,'Roy','ran','raybn@exmple.com',
7856443937,'56 burgess street', 'toronto','ontario',
'CB68DE','canada'),(6,'Daveed','Eva','daveedev@emple.com',
9956347786,'2 hightown','newyork','kent','NW45TH','US'),
(7,'Katrina','mate','katwt@emple.com',9933664455,'34 bates',
'california','washington','CF13DG','US'),
(8,'Dyana','joy','dyanm@exmple.com',7685110325,'45 millstreet',
'california','Washington','CF23FG','US');
update customer 
set state = 'DC' where customer_ID = 8;

#2. VIEW FOR CUSTOMERS LOCATED IN US 
Create view US_customer as select First_name,Last_name from
customer where country='US';

select* from US_customer;

#3. VIEW FOR FULLNAME AND EMAIL
create view Customer_details as 

select concat(First_name,' ',Last_name) as Full_name, email,
Phone_NO, State from customer;
select * from customer_details;

#4. UPDATING CUSTOMER DETAILS VIEW
update customer_details
set Phone_NO =9998887776 where state ='California' ;
-- keep showing you are in safe update mode and tried to
-- update a table

#5.COUNT OF CUSTOMERS IN EACH STATE
select state, count(*) as No_customers from customer
group by state
having count(*) > 5;

#6.NO OF CUSTOMERS IN EACH STATE BASED ON CUSTOMER DTLS VIEW
select state, count(*) as No_customers from customer_details
group by state;

#7.SHOWING ALL THE COLUMNS FROM CUSTOMER DTLS VIEW IN ASC
select*from customer_details order by state asc;



