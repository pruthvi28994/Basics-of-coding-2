--assignment
--    1
    select * from bank_cust_contact;
    select cust_id,cust_phone,contact_type,cust_addr_line1,cust_city,cust_state,cust_pin
    from bank_cust_contact
    where contact_type='HOME' and 
    (cust_state = 'Karnataka' or cust_state= 'Tamilnadu');

--    2
    select * from bank_sb_account;
    select account_no,primary_cust_id,curr_bal_amt,acc_status,start_date
    from bank_sb_account
    order by start_date desc;
--   months_between
    select primary_cust_id,'having account since past',round(months_between(sysdate,start_date)) Months_elapsed
    from bank_sb_account;
    select start_date,add_months(start_date,10) addingmonths from bank_sb_account;
--    3
    select * from bank_employee;
    select e.bank_emp_id,e.emp_name as employee,m.emp_name as ManagerEmp,m.manager_id
    from bank_employee m,bank_employee e
    where e.manager_id=m.bank_emp_id;
    
    
    select * from bank_employee
    where manager_id is not null
    order by designation desc,emp_name asc;
    
--assignment 2
--    1
    select * from bank_customer;
    select cust_id,upper(cust_fname),upper(cust_lname),to_char(cust_dob,'dd-month') as DOB
    from bank_customer
    where cust_sex='F';
--    2
    select * from bank_transaction;
    select trans_dt,substr(trans_desc,20),trans_amt
    from bank_transaction
    where trans_type='CR' and to_char(trans_dt,'mm-yyyy')='05-2010';
    
    select to_char(sysdate,'yyyy-month') from dual;
    
    
    select * from bank_fd_account;
--  IMPORTANT  
    select account_no,cust_id,round(trunc(initial_amt,-5)) as InitialAmtIn_Lakhs,
    case 
            when initial_amt < 50000 then 'lower'
            when initial_amt > 5000000 then 'higher'
            else 'medium'
    end "Amount_category",start_dt,upper(acc_status) fd_account
    from bank_fd_account
    where upper(acc_status)='ACTIVE' and to_char(start_dt,'yyyy')>'2004';
    
    select * from bank_transaction;
    select trans_dt,trans_acc_no,trans_desc,trans_amt,
        decode(trans_type,'CR','Credit','DB','Debit') as transaction_type
    from bank_transaction
    where trans_amt>10000 and substr(trans_desc,1,11)<>'RD INSTLMNT'
    order by transaction_type asc,trans_dt desc;
    
    select sum(trans_amt) from bank_transaction group by bank_emp_id;

--assignment 3 aggregate function

--    1 write query to show customer id and no of cust_id for contact type "OFFICE" and also customers 
--     who have more than one office phone
    select * from bank_cust_contact order by cust_id asc;
    select cust_id,count(cust_id) from bank_cust_contact
    where contact_type='OFFICE'
    group by cust_id
    having count(cust_phone)>1;
    
    
    
--    2 what are the min and max installments amounts of rd account which were started during year 2008
    select * from bank_rd_account;
    select min(installment_amt),max(installment_amt) 
    from bank_rd_account
    where to_char(rd_start_dt,'yyyy')='2008';
    
--    3 write a query to show designation and he no of employees under each designation 
--     except 'ATTENDER'.arrange the output by nof employees and then by designation
       select * from bank_employee;
       select designation,count(bank_emp_id) as EMP_CoUNT
       from bank_employee
       where designation<>'ATTENDER'
       group by designation;
       
--assignment 4 joins
--    1 show bank employee id,name,designation and transaction desc of all mangers and ass manager 
--    even though they are not involved in any transaction updates
        select * from bank_employee;
        select * from bank_transaction;
        select b.bank_emp_id,b.emp_name,b.designation,t.trans_desc
        from bank_employee b left outer join bank_transaction t
        on b.bank_emp_id=t.bank_emp_id
        where b.designation='MANAGER' or b.designation='ASST. MGR.';
        
--    2 show trans details -sb accno ,transaction type,date,desc,Amt for transaction amt>1000
--    sort the otput based on a/c no ,transaction type and date
        select  * from bank_sb_account;
        select s.account_no,t.trans_type,t.trans_dt,t.trans_desc,t.trans_amt
        from bank_sb_account s,bank_transaction t
        where s.account_no=t.trans_acc_no and t.trans_amt>1000
        order by 1,2,3;
        
--    3 show all customer id,custname,rd a/c no and installment amt even if they do not have
--    rd a/c ,display 'NA' for null;
--    nvl helps to replace all null values to prescibed text or string
        select * from bank_rd_account;
        select c.cust_id,c.cust_fname ||' '||c.cust_lname as cust_name,
        nvl(to_char(r.account_no),'NA') as Account_no,
        nvl(to_char(r.installment_amt),'NA') as installment_amt 
        from bank_customer c,bank_rd_account r
        where c.cust_id=r.rd_cust_id(+);
--        or use decode
        select * from bank_rd_account;
        select c.cust_id,c.cust_fname ||' '||c.cust_lname as cust_name,
        decode(r.account_no,null,'NA',r.account_no) as Account_no,
        decode(r.installment_amt,null,'NA',r.account_no) as installment_amt 
        from bank_customer c,bank_rd_account r
        where c.cust_id=r.rd_cust_id(+);
        
--    4 display cust_id,cust_name,contact,city of those who live outside"karnataka" and also 
--    phone type  should be "home"
        select * from bank_customer;
        select * from bank_cust_contact;
        select c.cust_id,c.cust_fname ||' '||c.cust_lname as cust_name,
        cc.cust_phone,cc.cust_city
        from bank_customer c,bank_cust_contact cc
        where c.cust_id=cc.cust_id and cc.cust_state <> 'Karnataka'
        and cc.contact_type='HOME';
        
--    5 display sb acc no ,cust_id,cust_name ,phn of primary and secondry customers who have only 
--    joint sb acc and also contact type "HOME"
        select * from bank_sb_account;
        
        select c.cust_id,c.cust_fname ||' '||c.cust_lname as cust_name,
        cc.cust_phone
        from bank_customer c,bank_sb_account s,bank_cust_contact cc
        where s.primary_cust_id is not null and s.secondary_cust_id is not null
        and cc.contact_type='HOME';
        
--assigment 6 subquries
--    1    dispaly acc no,cust_name,who have maximum and minimum initial fd;
            select * from bank_fd_account;
            select c.cust_id,c.cust_fname ||' '||c.cust_lname as cust_name,f.account_no,f.initial_amt
            from bank_customer c,bank_fd_account f
            where c.cust_id=f.cust_id
            and (f.initial_amt =(select max(initial_amt) from bank_fd_account)
            or f.initial_amt=(select min(initial_amt) from bank_fd_account));
--    2     list full details of all types of rd account transation made by all accounts of 
--          customer who are from tamilnadu
            select * from bank_cust_contact;
            select * from bank_rd_account;
            select * from bank_transaction;
            select r.account_no,r.rd_cust_id,r.rd_term_yrs,r.acc_status
            from bank_rd_account r 
            where 
            EXISTS (select 1 from bank_transaction t where t.trans_acc_no=r.account_no)
            and 
            EXISTS (select cc.cust_id from bank_cust_contact cc where 
                    cc.cust_id=r.rd_cust_id and cc.cust_state='Tamilnadu');
                    
                    
--    3     display all the columns of bank employees other than attender who were not involved
--           in any type of bank transacton
            select * from bank_employee e 
            where e.designation<> 'ATTENDER'
            and not EXISTS (select 1 from bank_transaction t where t.bank_emp_id=e.bank_emp_id);
            
--    4      which individual cust have not provided their home phone  no ?
--           display there cust_idand first name 
            select * from bank_cust_contact;
            select * from bank_customer;
            select c.cust_fname,c.cust_id
            from bank_customer c
            where c.cust_type='IND' and
            EXISTS (select cc.cust_id from bank_cust_contact cc 
                   where cc.cust_id=c.cust_id and cc.contact_type='OFFICE');
                   
--    5      show details (acc no and transaction amt ) of those s a/c no debit transaction 
--           whose amt is more thanthe averGE transaction amt of that sb accnt 
            select * from bank_sb_account;
            select * from bank_transaction;
            select s.account_no,t.trans_amt,t.trans_type
            from bank_sb_account s,bank_transaction t
            where s.account_no=t.trans_acc_no and t.trans_type='DB'
            and t.trans_amt >
            (select avg(t2.trans_amt) from bank_transaction t2 where s.account_no=t2.trans_acc_no);
            
            
--    6     list he sb accoun no on whichno transaction have been made so far 
            select s.account_no from bank_sb_account s
            where not EXISTS (select 1 from bank_transaction t where s.account_no = t.trans_acc_no);
            
--            second highest transactioned amt
            select * from bank_employee;
            select * from bank_transaction;
            select max(trans_amt) from bank_transaction where trans_amt not in (select max(trans_amt) from bank_transaction);
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
    
    
    
    
    
    
    
    
    
    
    