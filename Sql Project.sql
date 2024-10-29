
# Get the count of all orders made in 1997.
SELECT COUNT(*) AS Order_Count
FROM orders
WHERE YEAR(OrderDate) = 1997;

# Create a report that shows the total quantity of products (from the Order_Details table) ordered. 
# Only show records for products for which the quantity ordered is fewer than 200. (5 rows)
SELECT ProductID, SUM(Quantity) AS Total_Quantity
FROM order_details
WHERE Quantity < 200
GROUP BY ProductID
LIMIT 5;

# Create a report that shows the total number of orders by Customer since December 31, 1996. 
#The report should only return rows for which the total number of orders is greater than 15. (5 rows)
SELECT CustomerID, COUNT(OrderID) AS Total_Orders
FROM orders
WHERE OrderDate >= '1996-12-31'
GROUP BY CustomerID
HAVING COUNT(OrderID) > 15
LIMIT 5;

# What is the total amount each customer has paid us so far?
SELECT O.CustomerID, SUM(OD.UnitPrice * OD.Quantity) AS Total_Amount_Paid
FROM order_details OD
JOIN orders O ON OD.OrderID = O.OrderID
GROUP BY O.CustomerID;

# Find the 10 top selling products.
SELECT ProductID, SUM(Quantity) AS Total_Quantity_Sold
FROM order_details
GROUP BY ProductID
ORDER BY Total_Quantity_Sold DESC
LIMIT 10;

# Create a view with total revenues per customer.
CREATE VIEW CustomerRevenues AS
SELECT O.CustomerID, SUM(OD.UnitPrice * OD.Quantity) AS Total_Revenue
FROM orders O
JOIN order_details OD ON O.OrderID = OD.OrderID
GROUP BY O.CustomerID;


# Which UK Customers have paid us more than 1000 dollars?
SELECT O.CustomerID, C.Country, SUM(OD.UnitPrice * OD.Quantity) AS Total_Amount_Paid
FROM orders O
JOIN customers C ON O.CustomerID = C.CustomerID
JOIN order_details OD ON O.OrderID = OD.OrderID
WHERE C.Country = 'UK'
GROUP BY O.CustomerID, C.Country
HAVING Total_Amount_Paid > 1000;

# Create a report for all the orders of 1996 and their Customers.
SELECT O.OrderID, O.OrderDate, C.CustomerID, C.CompanyName
FROM orders O
JOIN customers C ON O.CustomerID = C.CustomerID
WHERE YEAR(O.OrderDate) = 1996;

# Write a query to get product list (id, name, unit price) where products cost between $15 and $25.
SELECT ProductID, ProductName, UnitPrice
FROM products
WHERE UnitPrice BETWEEN 15 AND 25;

# Write a query to get Product list (name, units on order, units in stock) of stock is less than the quantity on order.
SELECT ProductName, UnitsOnOrder, UnitsInStock
FROM products
WHERE UnitsInStock < UnitsOnOrder




