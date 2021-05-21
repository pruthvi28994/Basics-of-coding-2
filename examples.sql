--independent subquery----

select book_title
from books
where book_cost=(select max(book_cost) from books);
--single row indepenent---
--bcz here max(book_cost) return single row and single column that is matched with book_cost


select book_id,book_title,book_cost 
from books
where book_type='GN'
and book_id in (select book_id from book_sales where to_char(purchase_date,'yyyy')='2011');
--multi row independent---- 
--here multiple rows are fetched from sub query  and compared with book_id-----

select book_id,book_title,book_cost
from books
where book_type='GN'
and book_id in 
(select book_id from book_sales where to_char(purchase_date,'yyyy')='2011') and publ_id in 
(select publ_id from publisher where publ_name like '%Penguin%');

select publ_id ,publ_name from publisher where publ_id in (select publ_id from books where book_type='OS')
order by 1;

----corelated query------
---refers to column in the tables that are in main query---
select cust_id,cust_fname
from book_customer c
where exists 
(select cust_id from book_sales bs where bs.cust_id=c.cust_id);

select book_title from books b1,book_sales s,book_customer c
where b1.book_id=s.book_id
    and c.cust_id=s.cust_id
    and c.cust_fname='Prashanth'
    and exists 
    (select book_title from books b2,book_sales s,book_customer c
     where b2.book_id=s.book_id
           and b2.book_id=b1.book_id
           and c.cust_id=s.cust_id
           and (c.cust_fname='Rekha' or c.cust_fname='Sushma'));
		   
---subquires--
--bankdatabse---

--1----
select fd.account_no,cust_fname,cust_lname from 
bank_customer b1,bank_fd_account fd
            where b1.cust_id=fd.cust_id 
               and (fd.initial_amt=(SELECT max(fd1.initial_amt) from bank_fd_account fd1) 
               and fd.initial_amt=(SELECT max(fd2.initial_amt) from bank_fd_account fd2));
               

select * from bank_transaction;
select * from bank_rd_account;
select * from bank_customer;
--2--
select * from bank_rd_account 
where rd_cust_id in 
(select cust_id from bank_customer where cust_id in 
        (select cust_id from bank_cust_contact where cust_state='Tamilnadu'));
        
--3--
select * from bank_employee e
where not exists (select * from bank_transaction t where e.bank_emp_id=t.bank_emp_id)
    and not e.designation='ATTENDER';

--4--
select cust_id ,cust_fname || ' ' || cust_lname as cust_name
from bank_customer c
where cust_type in (select cust_type from bank_customer where cust_type='IND')
    and exists (select cc.contact_type from bank_cust_contact cc where cc.cust_id=c.cust_id and cc.contact_type='OFFICE')
    ;
    --verify---
select * from bank_cust_contact where contact_type='OFFICE';
select * from bank_customer where cust_type='IND';





-- manipal pro learn examples questions
---------------------------------------------------------------------------------------------------------------------------------------------
Book rental:
_____________

1-1
Select * from book where stock>0;
1-2
select * from book where stock>30;
1-3
select * from user_details
order by first_name;
2-1
 select * from book
 where (rent_per_day*30)<500;
2-2
 select * from book
 where price >500 and available_quantity=10;
2-3
 select * from book
 where stock between 30 and 50;
3-1
Select * from book 
where book_id in(
select book_id from book_rental 
where to_char(rental_start_date,'DD-MM-YYYY')='20-11-2020');
3-2
SELECT * FROM user_details
where user_id in
(select user_id from book_rental 
where to_char(rental_start_date,'MON')='DEC');
3-3
select first_name,title,rental_end_date
from user_details a,book_rental b,book c
where a.user_id = b.user_id(+) and b.book_id = c.book_id;
3-4
select first_name from user_details where user_id=
(select * from (select user_id
from book_rental group by user_id order by count(*) desc) where rownum<=1);
3-5
select * from book where 
book_id=(select * from 
(select book_id
from book_rental
group by book_id
order by count(book_id) desc)
where rownum<=1);
3-6
select * from user_details 
where user_id in(
select a.user_id 
from book_rental a,book b,user_details c
where b.book_id = a.book_id 
and c.user_id = a.user_id
and b.title = 'Neural Networks' );
3-7
select * from user_details 
where user_id in
(select user_id from book_rental where isreturned='no');
3-8
select ud.first_name,bk.title,br.rental_end_date
from user_details ud,book bk,book_rental br
where ud.user_id = br.user_id
and br.book_id = bk.book_id
and  to_char(br.rental_start_date,'dd/mm/yy')='25/11/20';
3-9
select ud.first_name,bk.title,br.rental_start_date,br.rental_end_date
from user_details ud,book bk,book_rental br
where ud.user_id = br.user_id(+)
and br.book_id = bk.book_id (+);
3-10
select *
from (select first_name,city,SUM(total_amount)
from book_rental br,user_details ud
where br.user_id=ud.user_id and br.rental_start_date like '%DEC%'
group by ud.first_name,ud.city
order by SUM(total_amount) desc )
where rownum=1;

4-1
SELECT * FROM 
(SELECT TO_CHAR(RENTAL_START_DATE, 'Month') as MONTH, COUNT(book_id) AS TOTAL_BOOKS
FROM BOOK_RENTAL
GROUP BY TO_CHAR(RENTAL_START_DATE, 'Month')
ORDER BY TOTAL_BOOKS  DESC)
WHERE ROWNUM = 1; 
4-2 
select title from book where book_id in
(select book_id from book_rental where (months_between(rental_start_date,rental_end_date) = (select max(months_between(rental_start_date,rental_end_date)) from book_rental )) );
4-3
select title from book where book_id in (select book_id from book_rental having count(*)=
(select max(count(*)) from book_rental group by book_id) group by book_id);
4-4
select * from
(select first_name,br.tot from user_details u,
(select user_id ,count(quantity) as tot
from book_rental 
group by user_id order by tot desc) br
where br.user_id = u.user_id
order by tot desc)
where rownum<4;
4-5
select * from
(select ud.first_name
from user_details ud,book_rental br 
where ud.user_id = br.user_id
group by ud.first_name
order by sum(total_amount) desc)
where rownum<3;

5-1
select br.* from 
 book b,book_rental br 
 where b.book_id = br.book_id and b.title='Machine Learning';

5-2
 select title
 from (select title,b.book_id 
 from book b,book_rental br,user_details ud
 where br.book_id = b.book_id
 and br.user_id = ud.user_id
 and ud.city='Bangalore')
 where book_id not in 
 (select book_id from book_rental
 where user_id in
 (select user_id from user_details where city !='Bangalore'))
 and rownum=1;

5-3
select title from book 
where book_id not in(select book_id from book_rental);

5-4
 select br.* from book_rental br,user_details ud
 where br.user_id = ud.user_id and ud.first_name='Chandrav';