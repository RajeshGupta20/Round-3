
-- SQL Statement to display customer Full Name, City, and Amount of sales for customers whose mother has brown eyes:
SELECT 
    CONCAT(c.FirstName, ' ', c.LastName) AS FullName,
    a.City,
    s.Amount
FROM 
    Customer c
JOIN 
    Sales s ON c.Id = s.CustomerID
JOIN 
    Address a ON s.CityID = a.ID
WHERE 
    c.MotherIDNumber IN (SELECT IdNumber FROM Customer WHERE EyeColor = 'Brown');

-- SQL Statement to display First Name and Last Name of users who ordered 3 or more courses:
SELECT 
    u.FirstName, 
    u.LastName
FROM 
    User u
JOIN 
    Order o ON u.ID = o.UserID
GROUP BY 
    u.FirstName, u.LastName
HAVING 
    COUNT(o.CourseID) >= 3;

-- Result of the SELECT query:
-- Amount: 500
