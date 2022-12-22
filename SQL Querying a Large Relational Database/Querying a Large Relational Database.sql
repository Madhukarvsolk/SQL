-----------PROJECT 2:  Querying a Large Relational Database-------------

-- Get all the details from the person table including email ID, phone number, and phone number type 

SELECT * FROM Person.PersonPhone

SELECT * FROM Person.EmailAddress

SELECT * FROM Person.PhoneNumberType




-- Get the details of the sales header order made in May 2011 

SELECT * FROM Sales.SalesOrderHeader
WHERE MONTH(OrderDate) = 5 AND YEAR(OrderDate) = 2011

-- Get the details of the sales details order made in the month of May 2011 

SELECT * FROM Sales.SalesOrderDetail
WHERE MONTH(ModifiedDate) = 5 AND YEAR(ModifiedDate) = 2011

-- Get the total sales made in May 2011

SELECT SUM(TotalDue) AS Total_Sales
FROM Sales.SalesOrderHeader 
WHERE MONTH(OrderDate) = 5 AND YEAR(OrderDate) = 2011


--- Get the total sales made in the year 2011 by month order by increasing sales 

SELECT * FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2011 
ORDER BY MONTH(OrderDate), TotalDue;

--- Get the total sales made to the customer with FirstName='Gustavo' and LastName ='Achong


SELECT * FROM [Person].[Person] 
WHERE FirstName='Gustavo' AND LastName ='Achong'

SELECT * FROM HumanResources.Employee

SELECT LastName, SalesYTD, SalesLastYear
FROM HumanResources.Employee AS e
INNER JOIN Person.Person AS p
ON e.BusinessEntityID = p.BusinessEntityID
INNER JOIN Sales.SalesPerson as s
on e.BusinessEntityID = s.BusinessEntityID


