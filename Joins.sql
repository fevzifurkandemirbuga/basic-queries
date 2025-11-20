
-- 1. List the product id, product name, unit price and category name of all
-- products. Order by category name and within that, by product name.
select ProductID, ProductName, UnitPrice, CategoryName
from northwind.products as p
join northwind.categories as c
on  p.CategoryID = c.CategoryID
order by CategoryName, ProductName;


-- 2. List the product id, product name, unit price and supplier name of all
-- products that cost more than $75. Order by product name.
select ProductID, ProductName, UnitPrice, CompanyName
from northwind.products as p
join northwind.suppliers as s
on p.SupplierID = s.SupplierID
where UnitPrice >=75
order by ProductName;

-- 3. List the product id, product name, unit price, category name, and supplier
-- name of every product. Order by product name.
select ProductID, ProductName, UnitPrice, CategoryName, CompanyName 
from northwind.products as p
join northwind.categories as c -- get category info 
on p.CategoryID = c.CategoryID
join northwind.suppliers as s -- get supplier info
on p.SupplierID= s.SupplierID
order by ProductName;



-- 4. What is the product name(s) and categories of the most expensive
-- products? HINT: Find the max price in a subquery and then use that in
-- your more complex query that joins products with categories.
select ProductName, CategoryName
from northwind.products as p
join northwind.categories as c
on p.CategoryID = c.CategoryID
where p.UnitPrice = (select max(UnitPrice)
					from northwind.products);


-- 5. List the order id, ship name, ship address, and shipping company name of
-- every order that shipped to Germany.
select OrderID, ShipName, ShipAddress, CompanyName, ShipCountry
from northwind.orders as o
join northwind.shippers as s
on o.ShipVia = s.ShipperID
where ShipCountry = "Germany";

-- 6. List the order id, order date, ship name, ship address of all orders that
-- ordered "Sasquatch Ale"?
select o.OrderID, OrderDate, ShipName, ShipAddress, ProductName
from northwind.orders as o
join northwind.`order details` as od 
on o.OrderID= od.OrderID     -- orders[ordersID] => order details[orderID]
join northwind.products as p
on od.ProductID= p.ProductID  --  order details[productID] => products[productID]  
where ProductName ="Sasquatch Ale";

-- orders[ordersID] => order details[orderID] 
-- 					=> order details[productID] => products[productID] 
-- 												=> products[productName]  




