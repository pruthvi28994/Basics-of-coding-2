--1 session 1 
    select (book_discount*10),'nullmultiplied'  from books where book_type='DB' and book_cost between 500 and 600;
    select book_id,book_title from books where book_discount is null; --is not same as book_discount=null
    select book_id,book_title from books where book_discount is not null;
--2 session 2
    select * from book_customer order by cust_id asc;
    select cust_id,cust_fname ||' '||cust_lname cust_name 
    from book_customer where cust_city like 'Ban%' and cust_category ='H';
    select cust_id,cust_fname ||' '||cust_lname cust_name,cust_city
    from book_customer where cust_city not like 'Ban%' and cust_category ='H';

--3 session 3
--    single row function
--       numeric(round,floor,ceil,abs,trunc)
--         char(upper,lower,length)
--         date time(months_between,next_day)
--         conversion(tochar,to_date,to_number)
--         other types decode , case , nvl , instr
    select sysdate from dual;--dummy|x
    
    select round(5.43244244) from dual;
    select floor(53.00004) from dual;
    select ceil(53.22333) from dual;
    
    select trunc(123.75),trunc(123.756,2),trunc(123.756,-1),trunc(123.7526,-2) from dual;---1 maps to nearest 10s value,-2 nearest 100
    select trunc(sysdate) from dual;
    
    select to_char(sysdate,'yyyy-mm-dd') dateconversion,upper(to_char(sysdate,'month')) monthconversion from dual;
    select to_char(sysdate,'dd') dayconversion from dual;
    
    select substr('innovation is up to the mark',1,5),LENGTH('innovation is up to the mark') from dual;
   
    select lpad('pruthvi',10,'*') leftpad_with_prediflen from dual;
    select rpad('pruthvi',10,'.') rightpad_with_prediflen from dual;
    
    select translate('pruthvi','iu','xx') replaces_with_xx from dual;
    select ltrim('pruthvi_sagar','') trimchars from dual;
    
    select sysdate, NEXT_DAY(TRUNC(SYSDATE), 'MONDAY') from dual;
    select to_char(sysdate,'mm/dd/yyyy') from dual;
    select to_number(to_char(sysdate,'yyyy'))+1 from dual;
    
    --important
    --nvl replaces all null values with prescibed string
    select nvl(null,'NA') from dual;
    
    select trunc(1300428,-5) as nearestlakh from dual;
    SELECT ROUND(156.00,-1)FROM DUAL;
    SELECT SUBSTR('123456789', INSTR('abcabcabc', 'b'), 4) FROM DUAL; --returns the posiition of the b
    
    
--4 session 4
    select * from books;
    --decode is used in switch single row kind of way
    select book_type,
        decode(book_type,'DB','database','PR','programming','OS','operating_system','unassigned') as book_category
        from books;
    --case 
    select account_no,cust_id,round(trunc(initial_amt,-5)) as InitialAmtIn_Lakhs,
    case 
            when initial_amt < 50000 then 'lower'
            when initial_amt > 5000000 then 'higher'
            else 'medium'
    end "Amount_category",start_dt,upper(acc_status) fd_account
    from bank_fd_account
    where upper(acc_status)='ACTIVE' and to_char(start_dt,'yyyy')>'2004';
    
    SELECT INSTR(book_title, ' ') FROM Books; --returns the position of the word/character 
    
--5 session 5
    --aggregation function
    --group by cluase
    SELECT  * FROM books;
    select count(book_discount)from books;
    select min(book_title),max(book_title) from books;
    select book_type,count(book_id) from books group by book_type;
    
    
    select * from book_sales;
    select book_id,count(book_id) from book_sales group by book_id;
    
    
    --show ids of customers who bought more than 50 books
    select cust_id,sum(qty) from book_sales
    group by cust_id having sum(qty)>50;
    
    select isbn,count(book_id) from books group by isbn;
    
    select book_type,count(book_id),sum(book_cost) from books where book_type is not null 
    group by book_type;
    
    --list average and total quantity of books boughtin the first two months of the year
    select to_char(purchase_date,'month') as month_of_purchased,sum(qty) as total_quantity
    ,round(avg(qty),2) as average_of_qauntity
    from book_sales
    where to_char(purchase_date,'mm') between 01 and 02
    group by to_char(purchase_date,'month')
    order by 1 desc;
    
    
--6 session 6
--    joins
   select count(*) from books,book_sales,book_customer; --cartesian join
   --left outer join || left join
   --right outer join || right join
   --full outer join || full join
   --inner join || condition join
   select * from book_sales order by book_id asc;
   
   --display al the books which were sold and the quantity of book solds
   select b.book_id,b.book_title,b.book_cost,sum(s.qty) as total_sold
   from books b,book_sales s
   where b.book_id=s.book_id
   group by b.book_id,b.book_title,b.book_cost
   order by b.book_id asc;
   
   --inner join
   select books.book_title 
   from books inner join book_sales
   on books.book_id = book_sales.book_id;
   
   select books.book_title from books,book_sales
   where books.book_id = book_sales.book_id;
    
    --left outer join
    select books.book_id,books.book_title,books.book_type,book_sales.purchase_date,book_sales.qty,book_sales.cust_id
    from books left outer join book_sales on
    books.book_id = book_sales.book_id;
    
    --or
    select books.book_id,books.book_title,books.book_type,book_sales.purchase_date,book_sales.qty,book_sales.cust_id
    from books,book_sales
    where books.book_id = book_sales.book_id(+);
    
    --right outer join
    select books.book_id,books.book_title,books.book_type,book_sales.purchase_date,book_sales.qty,book_sales.cust_id
    from books right outer join book_sales on
    books.book_id = book_sales.book_id
    where books.book_type='GN';
    
    --or
    select books.book_id,books.book_title,books.book_type,book_sales.purchase_date,book_sales.qty,book_sales.cust_id
    from books,book_sales
    where books.book_id(+) = book_sales.book_id;
    
    --program to list id,name,and total sales made by premium customers i.e who bhought books worth
    --woth>=1000 using inner join
    select * from book_sales;
    select * from books;
    select * from book_customer;

    select c.cust_id,c.cust_fname ||' '||c.cust_lname as cust_name,
    sum(s.qty*b.book_cost) as total_sales
    from books b,book_sales s,book_customer c
    where b.book_id=s.book_id and s.cust_id=c.cust_id
    group by c.cust_id,c.cust_fname ||' '||c.cust_lname
    having sum(s.qty*b.book_cost)>=10000
    order by 3 desc;
    
    --list all the books with there authors where book_id =b0011
    select b.book_id,b.book_title,a.author_name
    from books b inner join book_author ba on b.book_id=ba.book_id
    inner join authors a on ba.author_id=a.author_id
    where b.book_id='B0011';
    
    --left outer join example 
    --list all the books (sold and unsold) with book_id ,cust_id,qty) from books,booksales
    select b.book_id,s.cust_id,s.qty
    from books b left outer join book_sales s
    on b.book_id=s.book_id;    
    
--7 session 7
--    self join
    --list customers and book ids which were bhought along with 'b0001
    select * from book_sales;
    select s1.cust_id,s2.book_id
    from book_sales s1,book_sales s2
    where s1.book_id='B0001'
    and s1.book_id <> s2.book_id --to avoid B0001getting displayed
    and s1.cust_id = s2.cust_id -- same customer who bought B0001
    order by 1,2;

--8 session 8
--    subquries    
        --1 independent subquiriy 2.co-related sub query
        --name of most expensive book
        select book_title
        from books where book_cost=(select max(book_cost) from books);
        
        --list details of all generic books which are sold during year 2011 using independent subquery
        select * from book_sales;
        select * from books;
        select book_title,book_id,book_cost
        from books 
        where book_type='GN' and
        book_id in (select book_id from book_sales where to_char(purchase_date,'yyyy')='2011');
        
        
         --independent subquery where inner query is independent of outer query
        select * from books;
        select publ_id,publ_name
        from publisher
        where publ_id in (SELECT publ_id from books where book_type='OS')
        order by 1;
        
        --co-related subquery
        
        --list the book deatails whose book_cost is more than the avg of that perticular book_type
        select book_id,substr(book_title,1,20) as book_title,book_type,book_cost
        from books b1
        where book_cost>
        (select avg(book_cost) from books b2 where b1.book_type=b2.book_type
        )order by 1;
        
        -- show customers who have bought some books
        select * from book_sales;
        select * from book_customer;
        select cust_id,cust_fname ||' '||c.cust_lname as cust_name
        from book_customer c
        where exists (select s.cust_id from book_sales s where s.cust_id=c.cust_id);
        
        --shwo books which were bought other customers to 
        select * from books;
        
        select * from book_sales;
        
        
--session 9 
--        creating indexs
--            normal index
--            composite based index
--            function based index
        create index book_title_index on books(book_title);
        select book_title ,rowid,rownum from books;
        select * from book;
        select * from user_indexes where table_name='BOOK_CUSTOMER';
        
        create unique index cust_email_index on book_customer(cust_email);
        
        
        
        
        
        
        
        
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    