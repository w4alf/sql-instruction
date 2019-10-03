select * from customer where state = 'OH' order by name DESC;

select C.name 'Name' , FORMAT(C.creditLimit,2) as 'Credit Limit' FROM customer as C where state='OH' order by name DESC;

-- inner join example
select * from customer where state = 'OH' order by name DESC;

select COUNT(customerID) CustCount from orders;

select * from customer JOIN orders on customer.id = orders.customerID ;

-- join example

-- join example with formatting
select c.name 'Customer Name' ,
	date_format(o.date,"%M %D %Y") as 'Date',
	concat('$',o.total) as OrderTotal 
 from customer as c 
 JOIN orders as o on c.id = o.customerID ORDER BY c.name;
 
 -- join view report format, sub select example
 select c.name 'Customer Name' ,
	date_format(o.date,"%M %D %Y") as 'Date',
	concat('$',o.total) as OrderTotal 
 from customer as c 
 JOIN orders as o on c.id = o.customerID 
 WHERE o.total > 
 (select avg(total) from orders)
 ORDER BY c.name;
 
 -- just the subquery
 select avg(total) from orders;
 
  select c.name 'Customer Name' ,
		-- date_format(o.date,"%M %D %Y") as 'Date',
		sum(o.total) as OrderTotal 
from customer as c 
JOIN orders as o on c.id = o.customerID 
 GROUP BY c.name
 order by c.name;

select * from customer;

select sum(total) from orders;

-- insert a new customer
Insert into customer 
(name, city, state, isCorpAcct, creditLimit)
values ('test', 'test', 'DY', 0, 5000);

-- insert into variation without 
insert into orders values ('Dummy2','dummy','DY',0,55555);

-- into with multiple items
insert into customer  (name, city, state, isCorpAcct, creditLimit)
values
	('test2', 'test', 'DY', 0, 5000),
    ('test3', 'test', 'DY', 0, 5000),
    ('test4', 'test', 'DY', 0, 5000);

-- update example
update customer set name = 'Dummy1' where id=8;

-- delete example
delete from customer where id IN (11,12,14);

Delete from customer 
	where id > 7;
    
    