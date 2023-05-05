SELECT * FROM shubhamdb2.orders;

#Purchase detail of each customer
SELECT c.customer_id, c.customer_name, o.order_id, o.order_date, o.product_type, o.quantity
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id;

SELECT o.product_type, COUNT(*) as sales_count
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
GROUP BY o.product_type;


SELECT product_type, COUNT(*) as sales_count
FROM Orders
GROUP BY product_type;



#Customer purchase date for a product
SELECT Customers.customer_name, Orders.order_date
FROM Orders
JOIN Customers ON Orders.customer_id = Customers.customer_id
WHERE Orders.product_type = 'shirt';


#1. Which product types were ordered by a specific customer?

select o.product_type,customer_id
from orders o
where customer_id in ( '10','11','15');

#2. What is the total quantity ordered for a specific product type?

select sum(quantity) as total_quan
from orders 
where product_type in ('shirt');

#3.How many orders were placed by customers in a specific city?

select sum(quantity) as total_order,city
from orders o
join customers c on o.customer_id= c.customer_id
group by city  ;

select sum(quantity) as total_order
from orders o
join customers c on o.customer_id= c.customer_id
where city in ('Los Angeles','San Francisco','Washington D.C.');

#4. Which products were ordered by customers in a specific country?

select product_type
from orders o
join customers c on o.customer_id=c.customer_id
where country = 'USA';

SELECT DISTINCT o.product_type
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
WHERE country = 'USA';


#5.Which customers ordered more than a specific quantity of a product type?

select c.customer_name , o.quantity
from orders o
join customers c on o.customer_id=c.customer_id
WHERE o.product_type = 'pants' AND o.quantity > 1;

#6. Which customers ordered the same product type frequently?

SELECT c.customer_name, o.product_type, COUNT(*) as frequency
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
WHERE o.product_type IN (
    SELECT o2.product_type
    FROM Orders o2
    WHERE o2.customer_id = o.customer_id
    GROUP BY o2.product_type
    HAVING COUNT(*) < 2
)
GROUP BY c.customer_name, o.product_type
ORDER BY frequency DESC;


#7. What is the average quantity ordered by customers in a specific country?

SELECT AVG(o.quantity) as avg_quantity
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
WHERE c.city = 'San Francisco'; 

select avg(o.quantity) as avg_quan
from orders o 
join customers c on o.customer_id=c.customer_id
where c.country='USA';


#8.What is the latest order date for a specific customer and product type?

select max(o.order_date) as Latest
from orders o
join customers c on o.customer_id = c.customer_id
where o.customer_id= 6 and o.product_type= 'pants';


SELECT MAX(o.order_date) as latest_order_date
FROM Orders o
WHERE o.customer_id in ('2','3','4','5','6')  AND o.product_type = 'shirt';




#JOINS


#1  What are the total number of orders placed by each customer?

SELECT Customers.customer_id, Customers.customer_name, COUNT(Orders.order_id) as total_orders
FROM Customers
INNER JOIN Orders ON Customers.customer_id = Orders.customer_id
GROUP BY Customers.customer_id, Customers.customer_name;

#What are the details of customers who have placed an order for a specific product type?
#Query using INNER JOIN and WHERE clause:

SELECT Customers.customer_id, Customers.customer_name, Customers.address, Customers.city, Customers.country, Orders.product_type, Orders.quantity
FROM Customers
INNER JOIN Orders ON Customers.customer_id = Orders.customer_id
WHERE Orders.product_type = 'shirt';




#2. Which customers have not placed any orders yet? ( LEFT JOIN)

SELECT Customers.customer_id, Customers.customer_name, Customers.address, Customers.city, Customers.country
FROM Customers
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id
WHERE Orders.order_id IS NULL;



#3  Which customers have not placed any orders yet? Provide a list of all customers including those who haven't placed any orders, and show the order details for those who have.


SELECT Customers.customer_id, Customers.customer_name, Orders.order_id, Orders.order_date, Orders.product_type, Orders.quantity
FROM Customers
RIGHT JOIN Orders ON Customers.customer_id = Orders.customer_id
ORDER BY Customers.customer_id;


#4     Which product types have never been ordered? Show a list of all product types,including those that have never been ordered, and the number of times they have been ordered if applicable.

SELECT Orders.product_type, COUNT(Orders.order_id) AS order_count
FROM Orders
right OUTER JOIN Customers ON Orders.customer_id = Customers.customer_id
GROUP BY Orders.product_type
union
SELECT Orders.product_type, COUNT(Orders.order_id) AS order_count
FROM Orders
left OUTER JOIN Customers ON Orders.customer_id = Customers.customer_id
GROUP BY Orders.product_type;


