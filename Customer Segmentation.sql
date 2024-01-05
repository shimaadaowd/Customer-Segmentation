select * from [dbo].[tableRetail]
--total colums and divides invoicedate colum into years,month and days
select YEAR(invoicedate) as year_,month(invoicedate) as mon,day(invoicedate) as dayy, 
Invoice,stockcode,quantity,price,customer_id,country
from [dbo].[tableRetail] ;

--years without duplicate in retail table
select distinct(YEAR(invoicedate)) from [dbo].[tableRetail]

--top 10 customers who have maximum number of transaction in 2010
select top(10) customer_id , count(invoice)
from[dbo].[tableRetail]
where YEAR(invoicedate) = 2010 group by customer_id
order by count(invoice) desc

-- top 10 customers who have maximum number of transaction 
select top(10) customer_id , count(invoice)
from[dbo].[tableRetail]
group by customer_id
order by count(invoice) desc

-- top 10 customers who have maximum number of transaction
select top(10) customer_id , sum(price)
from[dbo].[tableRetail]
group by customer_id
order by  sum(price) desc

--total price for each year
select YEAR(invoicedate),sum(price)
from [dbo].[tableRetail]
group by year(invoicedate) ;

--total price for each country
select country,sum(price)
from[dbo].[tableRetail]
group by country ;

-- avg spending per transaction for each client  
select customer_id , AVG(price)
from [dbo].[tableRetail]
group by customer_id ; 

--top customers avg spending per transaction
select top(10) customer_id , avg(price)
from[dbo].[tableRetail]
group by customer_id
order by  avg(price) desc

---- product with most sales
select top(1) stockcode ,sum(price)
from [dbo].[tableRetail]
group by stockcode
order by sum(price) desc

-- product with least sales
select top(1) stockcode ,sum(price)
from [dbo].[tableRetail]
group by stockcode
order by sum(price) 

--most recent transaction for each client
select max(invoicedate),customer_id
from [dbo].[tableRetail]
group by customer_id

--most recent transaction for each client in 2011
select max(invoicedate),customer_id
from [dbo].[tableRetail]
where year(invoicedate)=2011
group by customer_id

/* total price and number of transaction for each client ordered by num of transaction 
and if numbers ot tran is equal then ordered by tatal price */
select customer_id,sum(price),count(invoice)
from [dbo].[tableRetail] 
group by customer_id
order by count(invoice) desc ,sum(price) desc;

--champions 
select top(10)customer_id,count(invoice) ,sum(price) from [dbo].[tableRetail]
group by Customer_ID
having sum(price) >  AVG(price)
order  by sum(price) desc,count(invoice) desc ;

--loyal customer
select top(10)customer_id,count(invoice) ,sum(price) from [dbo].[tableRetail]
group by Customer_ID
having sum(price) between 100 and 1000  
order  by sum(price) desc,count(invoice) desc ;



--Promising
select customer_id,count(invoice) ,sum(price) from [dbo].[tableRetail]
group by Customer_ID
having sum(price) between 100 and 1000  
order  by sum(price) desc,count(invoice) desc
offset 10 rows
fetch next 10 rows only;

--Customers Needing Attention
select customer_id , count(invoice)
from [dbo].[tableRetail]
group by customer_id
order by count(invoice);


--At Risk
select customer_id , count(invoice)
from [dbo].[tableRetail]
where year(invoicedate) = 2010
group by customer_id
order by count(invoice) desc;

--Can't Lose Them
select customer_id , sum(price)
from [dbo].[tableRetail]
group by customer_id
order by sum(price) desc ;

--Hibernating
select customer_id , count(invoice)
from [dbo].[tableRetail]
group by customer_id
order by count(invoice) ;


