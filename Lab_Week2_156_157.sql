use ap;
select * from terms;

select vendor_id, vendor_name, count(*) as number_of_invoices, 
sum(invoice_total) as total_invoice_value, avg(invoice_total) as avg_invoice_total
from invoices
join vendors using (vendor_id)
where invoice_total > 1000
group by vendor_id
having total_invoice_value > 5000
order by number_of_invoices desc;

select avg(invoice_total) from invoices;

select vendor_name from
(select vendor_id, vendor_name, invoice_id, invoice_total from invoices
join vendors using (vendor_id)
where invoice_total > (select avg(invoice_total) from invoices)) tmp
where invoice_total > 10000;

select vendor_name from vendors
where vendor_id in (select vendor_id from invoices where invoice_total > 5000);

use w3schools;

select OrderID, sum(Quantity * Price) as order_total from orders
join order_details using (OrderID)
join products using (ProductID)
group by OrderID
order by order_total desc;


select CustomerID, CustomerName, OrderID, sum(Quantity * Price) as order_total from orders
join order_details using (OrderID)
join products using (ProductID)
join customers using (CustomerID)
group by OrderID
order by order_total desc;

select month(OrderDate), sum(Quantity * Price) as order_total from orders
join order_details using (OrderID)
join products using (ProductID)
join customers using (CustomerID)
group by month(OrderDate)
order by month(OrderDate) desc;


select sum(order_total), avg(order_total), count(*) from
(select OrderID, sum(Quantity * Price) as order_total from orders
join order_details using (OrderID)
join products using (ProductID)
group by OrderID
order by OrderID) tmp;

select * from orders;

-- 3 --
select* from orders
where month(OrderDate) = 11;

-- 4 --
select ShipperID, OrderID, ShipperName, OrderDate from orders
join shippers using (ShipperID)
where month(OrderDate) = 11;

-- 5 --
select EmployeeID, FirstName, LastName, sum(Quantity * Price) as order_total from orders
join order_details using (OrderID)
join products using (ProductID)
join employees using (EmployeeID)
group by EmployeeID
order by order_total desc
limit 10;

-- 6 --
select * from suppliers;

select OrderID, ProductID from order_details
where ProductID in (select SupplierID from suppliers where SupplierName = "Tokyo Traders");