select * from books;

---------------------------------------------------------------------
--leftouter join different ways
select books.book_id,books.book_title
from books,book_sales
where books.book_id=book_sales.book_id(+);

select books.book_id,books.book_title
from books LEFT OUTER join book_sales
on books.book_id=book_sales.book_id;

select books.book_id,books.book_title
from books LEFT join book_sales
on books.book_id=book_sales.book_id;
-------------------------------------------------------------------
--find the overall t0tal sales of perticular book 
select * from books;

------------------------------------------------------------------------------------------------------------------------------------------------------
--select all the users details who purchased the books in the month of dec
--using to_char
--||''|| can be used to concate--------- 
select c.cust_fname ||' '|| c.cust_lname as customer_name,'purchased the book',b.book_title,b.book_type
from books b,book_sales s,book_customer c
where b.book_id=s.book_id and s.cust_id=c.cust_id
and to_char(s.purchase_date,'MON')='DEC';

select * from book_sales;

Select * from books 
where book_id in(
select book_id from book_sales 
where to_char(purchase_date,'DD-MM-YYYY')='05-04-2012');

------------------------------------------------------------------------------------------------------------------------------------------------------
--between---------- 
--select all the books which is published between 01-01-10 to 15-04-12
select book_id,book_title from books
where publ_date BETWEEN '01-JAN-10' and '15-APR-12';
--------------------------------------------------------------------------------------------------------------------------------------------------------


--cannot select non aggregate coloumn,if coloumn is in group by clause then these query will work
--select book_title,sum(book_cost) ,max(book_cost) ,avg(book_cost) from books;
      --ORA-00937: not a single-group group function
      
select sum(book_cost) ,max(book_cost) ,avg(book_cost) from books;

select * from book_sales;
select book_id,count(book_id) from book_sales group by book_id;
select * from books order by book_id;
select * from book_customer;


--//over sales of perticular book
select b.book_title,sum(s.qty*b.book_cost) as total_cost 
from books b,book_sales s
where b.book_id=s.book_id
GROUP BY b.book_title
order by 1 desc;
----------------------------------------------------------------------------------------------------------

--like -----------------------------
SELECT * FROM publisher;
--select all the books whos publiser name has pub in it
select b.book_id,b.book_cost,p.publ_name
from books b,publisher p
where p.publ_id=b.publ_id and p.publ_name like '%Pub%'
order by 1 asc;

--select all the books whos authors name starts with W and s
select b.book_id,b.book_title,a.author_name from books b,book_author ba,authors a
where b.book_id=ba.book_id and ba.author_id=a.author_id 
and a.author_name like 'W%s';

--select all the books details and authours whos second letter is 'a' or third letter starts with 'a'
select b.book_id,b.book_title,a.author_name from books b,book_author ba,authors a
where b.book_id=ba.book_id and ba.author_id=a.author_id 
and (a.author_name like '_a%' or a.author_name like '__a%')
order by 1 asc;

select * from authors;
--select all the books who has authour name starts with Adity
select b.book_id,b.book_title from books b,book_author ba,authors a
where b.book_id=ba.book_id and ba.author_id=a.author_id and a.author_name like 'Adity%';

---------------------------------------------------------------------------------------------------------------------------------------------------------------

---------having clause----------
--select all the customers who have purchased the same books more than once
select * from book_sales;
select b.book_title,count(s.qty) QUANTITY
from books b,book_sales s,book_customer c
where b.book_id=s.book_id and s.cust_id=c.cust_id
group by b.book_title
having count(s.qty)>2;

-------------------------------------------------------------
 select table_name from user_tables;

--alter table add cust_adrr varchar2(50); add columns
--alter table modify cust_adrr varchar2(100); modify column
--alter table table_name rename column cust_adrr to cust_addr; 
--alter table tablename DROP (cust_addr) drop the column;






























