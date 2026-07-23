create database retailanalysis;
use retailanalysis;

create table retailtransactions(
     Transaction_ID varchar(20),
     Date date,
     Product_name varchar(50),
     category varchar(30),
     Region varchar (20),
     saleschannel varchar(20),
     quantity int,
     unitprice decimal(10,2),
     totalamount decimal(10,2),
     payment_mode varchar(30),
     customerid varchar(20)
);

select * from RetailTransactions;

select count(*) as totalrecords
from RetailTransactions; 

select Region,
sum(totalamount) as totalsales
from RetailTransactions
group by Region;




select ProductName,
sum(totalamount) as Revenue
from RetailTransactions
group by ProductName
order by Revenue desc
limit 5;


select month(Date) as Month,
sum(totalamount) as totalsales
from RetailTransactions
group by Month(Date)
order by Month;

select monthname(Date) as Month,
sum(totalamount) as totalsales
from RetailTransactions
group by monthname(Date),month(Date)
order by month(Date);

select
    Region,
    sum(TotalAmount) as Sales,
    round(
        sum(TotalAmount) * 100 /
        (select sum(TotalAmount)
         from RetailTransactions),2
    ) as Percentage
from RetailTransactions
group by Region;

select
monthname(Date) as Month,
SalesChannel,
sum(TotalAmount) as TotalSales
from RetailTransactions
group by month(Date),
monthname(Date),
SalesChannel
order by Month(Date);

select Category,
sum(TotalAmount) as TotalSales
from RetailTransactions
group by Category
order by TotalSales desc;

select CustomerID,
count(TransactionID) as TotalOrders
from RetailTransactions
group by CustomerID
having count(TransactionID) > 10;



