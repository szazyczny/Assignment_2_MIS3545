-- Assignment 2 PetSmart DB - Pat Carney, Eddie Lehr, and Sarah Zazyczny

USE PetSmartDb;
GO

SELECT * FROM Product;
SELECT * FROM ProductCategory;
SELECT * FROM ProductSubcategory;
SELECT * FROM PetCategory;
SELECT * FROM SalesOrder;
SELECT * FROM Customer;
SELECT * FROM Territory;
SELECT * FROM SalesEmployees;
SELECT * FROM Contact;

GO

/*Find out which Sales Employees are selling the greatest quantities. AGGREGATE FUNCTION*/

SELECT c.FirstName AS 'First Name'
	,c.LastName AS 'Last Name'
	,SUM(s.OrderQty) AS 'Total Order Qty'
FROM PetSmartDB.dbo.SalesEmployees AS e INNER JOIN PetSmartDB.dbo.SalesOrder AS s
	ON e.SalesEmployeesID = s.SalesEmployeesID
	INNER JOIN PetSmartDb.dbo.Contact AS c 
	ON c.ContactID = e.ContactID
GROUP BY c.FirstName, c.LastName
ORDER BY SUM(s.OrderQty) DESC;

/*Find the total amount of products offered in each Product Category, ordered from greatest to least. INNER JOIN*/

SELECT c.Name AS 'Pet Category'
	,COUNT(p.ProductID) AS 'Total Products Offered'
FROM PetSmartDB.dbo.Product AS p INNER JOIN PetSmartDb.dbo.PetCategory AS c
	ON p.PetCategoryID = c.PetCategoryID
GROUP BY c.PetCategoryID, c.Name
ORDER BY COUNT(p.ProductID) DESC;


/*List Customers total Sales Orders. LEFT JOIN so table that contains all values from the left customer table and corresponding matches from the right sales order table.*/

SELECT co.FirstName AS 'First Name'
	,co.LastName AS 'Last Name' 
	,COUNT(s.SalesOrderID) AS 'Total Orders'
FROM PetSmartDb.dbo.Customer AS c
	LEFT JOIN PetSmartDb.dbo.SalesOrder AS s 
	ON c.CustomerID = s.CustomerID
	JOIN PetSmartDb.dbo.Contact AS co 
	ON co.ContactID = c.ContactID
GROUP BY co.FirstName, co.LastName
ORDER BY COUNT(s.SalesOrderID) DESC;

/*Find which products in the product subcategory 1, dry food, have list prices greater than $25. QUERY USING SUBQUERY*/

 SELECT Name
	,ListPrice
  FROM (
        SELECT *
          FROM PetSmartDb.dbo.Product
         WHERE ListPrice > 25
       ) sub
 WHERE sub.ProductSubCategoryID = 1;