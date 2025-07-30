



--Inner Join Questions
--1.Retrieve the names of all customers along with their order IDs.
--Tip: Use the Orders table and Customers table with CustomerID.
Select c.customername , o.orderid from sarthak.customers c
inner join sarthak.orders o
on  c.CustomerID=o.CustomerID

--2.List all products ordered along with the quantity ordered and order date.
--Tip: Join Products, OrderDetails, and Orders.
select p.productname,od.quantity,o.orderdate from sarthak.products p
inner join sarthak.orderdetails od
on p.productid=od.productid
inner join sarthak.orders o
on o.orderid=od.orderid


--3.Find the total amount spent by each customer.
--Tip: Combine Orders and Customers using CustomerID, then use aggregation.
select c.customername,o.totalamount as totalspent from sarthak.customers c
inner join sarthak.orders o
on o.customerid=c.customerid


--4.List all orders and the corresponding shipping addresses.
--Tip: Join Orders and Shipping tables on OrderID.
select o.orderid,s.Address from sarthak.orders o
inner join sarthak.shipping s
on o.orderid=s.orderid

--5.Retrieve order details for orders that include products in the "Electronics" category.
--Tip: Filter on Category in the Products table.
select o.orderid,od.quantity,o.orderdate, p.category,p.productname from sarthak.orders o
inner join sarthak.customers c
on o.customerid=c.customerid
inner join sarthak.orderdetails od
on o.orderid=od.orderid
inner join sarthak.products p
on p.productid=od.productid where p.category ='Electronics'



--6.Show all products and their total quantities ordered.
--Tip: Use OrderDetails and group by ProductID.
select p.productname,od.quantity from sarthak.products p
inner join sarthak.orderdetails od
on p.productid=od.productid

--7.Retrieve the details of orders where the total amount is greater than $500.
--Tip: Join Orders with Customers and filter on TotalAmount.
select o.orderid,o.orderdate,o.totalamount from sarthak.orders o
inner join sarthak.customers c
on c.customerid=o.customerid where o.totalamount > 500



--8.Display customer names and the products they have ordered.
--Tip: Use Orders, OrderDetails, and Products tables.
select c.customername,p.productname from sarthak.orders o
inner join sarthak.customers c
on c.customerid=o.customerid
inner join sarthak.orderdetails od
on od.orderid=o.orderid
inner join sarthak.products p
on p.productid=od.productid

--9.Retrieve the shipping status for all orders along with the order total.
--Tip: Join Orders and Shipping on OrderID.
select s.shippingstatus, o.Totalamount as ordertotal from sarthak.shipping s
inner join sarthak.orders o 
on o.orderid=s.orderid

--10.List all customers who ordered a product priced above $100.
--Tip: Include Products and OrderDetails in the join.
select c.customername, p.price from sarthak.orders o
inner join sarthak.customers c
on c.customerid=o.customerid
inner join sarthak.orderdetails od
on od.orderid=o.orderid
inner join sarthak.products p
on p.productid=od.productid where p.price >100

--Left Join Questions
--1.Retrieve all customers and their orders, including those who haven't placed any orders.
--Tip: Use a left join from Customers to Orders.
select c.customername,o.orderid from  sarthak.customers c
left join sarthak.orders o
on c.customerid=o.customerid --where o.orderid is NUll


--2.Show all products along with the quantity ordered, including products that haven’t been ordered.
--Tip: Perform a left join from Products to OrderDetails
select p.productname,od.quantity from sarthak.products p
left join sarthak.orderdetails od
on p.productid=od.productid --where  p.productid = 0

--3.List all orders and their shipping details, even if the shipping hasn’t been initiated.
--Tip: Use a left join from Orders to Shipping.
select s.shippingid,s.address,s.shippingdate,s.shippingstatus from sarthak.orders o
left join sarthak.shipping s
on o.orderid=s.orderid where s.shippingstatus = 'Pending'

--4.Display the names of all customers and the total amount of their orders, even for those with no orders.
--Tip: Aggregate Orders and use a left join with Customers.
select c.customername,o.totalamount,o.orderid  from sarthak.orders o
left join sarthak.customers c
on c.customerid=o.customerid --where o.orderid = 0


--5.Retrieve all order details along with product names, including details where the product might not exist.
--Tip: Left join OrderDetails with Products.
select  p.productname,od.orderid,od.quantity,od.orderdetailid  from sarthak.products p
left join sarthak.orderdetails od
on p.productid = od.productid --- where od.orderdetailid is null


--6.Show all products in the "Furniture" category and the orders they were included in, even if there were none.
--Tip: Filter Products on Category and left join with OrderDetails.
select p.productname,p.category,od.orderdetailid from  sarthak.products p
left join sarthak.orderdetails od
on p.productid = od.productid where p.category = 'Furniture' -- is null

--7.List all customers along with their order dates, including customers without orders.
--Tip: Focus on Customers as the base table and left join Orders.
select c.customername,o.orderdate,o.orderid from sarthak.customers c
left join sarthak.orders o
on c.customerid=o.customerid --where o.orderid = 0

--8.Retrieve all orders and their shipping statuses, including orders that haven't been shipped.
--Tip: Join Orders with Shipping using OrderID.
select o.orderid, s.shippingstatus from sarthak.orders o
left join sarthak.shipping s
on o.orderid=s.orderid where s.shippingstatus ='Shipped'


--9.Display all customers and the products they ordered, even if they didn’t order anything.
--Tip: Include Customers, Orders, and OrderDetails in the query.
select  c.customername,p.productname,o.orderid from sarthak.orderdetails od
left join sarthak.orders o
on o.orderid=od.orderid 
left join sarthak.customers c
on c.customerid= o.customerid 
left join sarthak.products p 
on p.productid =od.productid --where o.orderid is null


--10.List all orders and the respective product details, even if no product is associated.
--Tip: Start with Orders and left join with OrderDetails.
select o.orderid , p.productname,p.category,p.price,p.productid from sarthak.orders o
left join sarthak.orderdetails od
on o.orderid=od.orderid
left join sarthak.products p
on p.productid=od.productid --where p.productid is  null

--Self Join Questions
--1.Retrieve all customers who share the same country.
--Tip: Use a self-join on the Customers table with Country.
select  c1.customername as  customername_1 ,c2.customername as  customername_2,c1.country as country_1 ,c2.country as country_2 from 	sarthak.customers c1		
join sarthak.customers c2
on c1.country = c2.country 


--2.List all orders where the total amount is greater than the total amount of another order.
--Tip: Use a self-join on Orders with a condition comparing TotalAmount.
select  o1.orderid as orders1, o1.totalamount as totalamount_1,o2.orderid as orders2, o2.totalamount as totalamount_2 from sarthak.orders o1
join sarthak.orders o2
on o1.totalamount>o2.totalamount

    --3.Find customers who placed multiple orders on the same date.
    --Tip: Join Orders with itself on CustomerID and OrderDate.
select o1.customerid,c.customername,o1.orderdate , o1.orderid as order_1, o2.orderid as order_2 from sarthak.orders o1
join sarthak.orders o2
on o1.customerid=o2.customerid
and o1.orderdate=o2.orderdate
--and o1.orderid < o2.orderid    
join sarthak.customers c
on o1.customerid=c.customerid

--4.Identify customers who share the same name but live in different countries.
--Tip: Self-join Customers on Name but compare Country.
select c1.customername as customer_1 ,c1.country as country1,c2.country as country2 from sarthak.customers c1
join sarthak.customers c2
on c1.customername=c2.customername
--and c1.country<>c2.country

--5.List all products priced higher than another product in the same category.
--Tip: Self-join Products on Category and compare Price.
select p1.category,p1.productname as productname2,p1.productid as productid1, p1.price as price1,p1.productname as productname1,p2.productid as productid2, p2.price as price2  from sarthak.products p1
join sarthak.products p2
on p1.category=p2.category
and p1.price> p2.price where p1.category ='Electronics'

--6.Find orders where the total amount is at least double another order by the same customer.
--Tip: Join Orders on CustomerID and compare TotalAmount.
select c.customername,o1.customerid,o1.orderid,o1.totalamount as totalamountmin , o2.totalamount as totalamountmax  from sarthak.orders o1
join sarthak.orders o2
on o1.customerid=o2.customerid 
and o1.totalamount >= 2 * o2.totalamount
join sarthak.customers c
on o1.customerid= c.customerid

--7.Retrieve all shipping records where one shipping is delayed compared to another shipping for the same order.
--Tip: Self-join Shipping on OrderID and compare ShippingDate.
select s1.orderid,s1.Shippingid  as shippingid1 ,s1.shippingdate as shippingdate1 ,s2.Shippingid  as shippingid2 ,s2.shippingdate as shippingdate2 from sarthak.shipping s1
join sarthak.shipping s2
on s1.orderid=s2.orderid 
and s1.shippingdate <  s2.shippingdate
and s1.Shippingid <> s2.Shippingid


--8.List products that have the same name but belong to different categories.
--Tip: Use a self-join on Products comparing Name but not Category.
select  p1.productname,p1.category as category1,p2.category as category2  from sarthak.products p1
join sarthak.products p2
on p1.productname=p2.productname
and p1.category<>p2.category


--9.Find customers who joined after another customer from the same country.
--Tip: Join Customers on Country and compare JoinDate.
select c1.customername as newcust ,c1.joindate, c2.customername as oldcust ,c2.joindate from sarthak.customers c1
join sarthak.customers c2
on c1.country=c2.country
and c1.joindate>c2.joindate

--10.Identify orders that were shipped earlier than other orders by the same customer.
--Tip: Self-join Orders on CustomerID and compare OrderDate.
select o1.customerid, o1.orderid as orderid1 ,o1.orderdate as orderdate1,o2.orderid as orderid2,o2.orderdate as orderdate2 from sarthak.orders o1
join sarthak.orders o2
on o1.customerid=o2.customerid
and o1.orderid <> o2.orderid
and o1.orderdate < o2.orderdate









