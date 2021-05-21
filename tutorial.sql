--
--creating customer table
create table customer(
cust_id NUMBER(6) primary KEY,
cust_name VARCHAR2(20) NOT NULL,
mobile_no varchar2(20) unique check (length(mobile_no)=10),
age number(3) check (age>=18),
city_id number(4) references city(city_id) on delete cascade,   --on delete cascade helps in removing its dependencies when that values id deleted
country_name varchar2(40) default 'india'
);

--creating the city tables
create table city(
city_id NUMBER(6) primary KEY,
city_name VARCHAR(20) not null
);

alter table customer add FOREIGN key (city_id) references city(city_id);
alter table customer add CONSTRAINT fk_constrain FOREIGN key (city_id) references city(city_id) on delete cascade;

desc customer;

--inserting into city values
insert into city values(10,'Hydrabad');
insert into city values(19,'banglore');
INSERT INTO city VALUES (15,'karnataka');
update city set city_name='chennai' where city_id=15;
insert into city values(11,'mumbai')
insert into city values(12,'pune');
insert into city values(20,'mysore');
insert into city values(21,'delhi');

select * from city;
select * from customer;
--inserting into customer
--update customer set country_name='india' where cust_id=10003;
insert into customer values(10001,'pruthvi sagar s',9591343294,21,10,'india');
insert into customer values(10002,'Jayanth S',9591343295,21,15,'india');
insert into customer values(10003,'Kumari',9980857675,45,15,'india');
insert into customer(cust_id,cust_name,mobile_no,age,city_id) values(10004,'Shivanna M',9611558783,56,20);
insert into customer(cust_id,cust_name,mobile_no,age,city_id) values(10005,'Shekar',9611559098,32,21);
insert into customer(cust_id,cust_name,mobile_no,age,city_id) values(10006,'Bhavani',9482999539,23,11);

join
--//check which cities are not occupid by customer
--using left join 
--prints the value that are not in common in right table 
select city.city_id from city left join customer on city.city_id=customer.city_id where customer.city_id is null; 

--using inner join vs normal join condition same
select customer.cust_name from customer inner join city on customer.city_id=city.city_id;
select customer.cust_name from customer ,city where customer.city_id=city.city_id;

--left ouuter join
--Here's a list of equivalent syntaxes:
--A LEFT JOIN B            A LEFT OUTER JOIN B
--A RIGHT JOIN B           A RIGHT OUTER JOIN B
--A FULL JOIN B            A FULL OUTER JOIN B
--A INNER JOIN B           A JOIN B
















