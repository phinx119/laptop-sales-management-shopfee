--Roles------------------------------------------------------------------------------------------------------------------------
SELECT * FROM Roles
DROP TABLE Roles

SELECT * FROM Roles

--Users------------------------------------------------------------------------------------------------------------------------
SELECT * FROM Users
DROP TABLE Users

UPDATE Users set Avatar_Image = 'default-avatar.jpg' where User_ID = 1

UPDATE Users set Avatar_Image = 'default-avatar.jpg' where User_ID = 1

INSERT INTO Users(Username, Password, Email, Name, Role_ID, Avatar_Image)
VALUES (N'Xuanphi2', '123', 'xuanphi2003gmail.com', N'Xuan Phi', 1, N'default-avatar.jpg');

DELETE FROM Users WHERE User_ID = 8

--Discount----------------------------------------------------------------------------------------------------------------------
SELECT * FROM Discount
DROP TABLE Discount

UPDATE Discount SET Discount = 0.3 WHERE Category_ID = 3

--Brands-----------------------------------------------------------------------------------------------------------------------
SELECT * FROM Brands
DROP TABLE Brands

-- Category--------------------------------------------------------------------------------------------------------------------
SELECT * FROM Category
DROP TABLE Category

-- Processor_Types-------------------------------------------------------------------------------------------------------------
SELECT * FROM Processor_Types
DROP TABLE Processor_Types

-- Laptops---------------------------------------------------------------------------------------------------------------------
SELECT * FROM Laptops
DROP TABLE Laptops

SELECT Laptop_ID, b.Brand_Name, Model, c.Category_Name, p.Processor_Type_Name, l.Processor_Type_Name,
		Graphics_Card, RAM, Storage, Screen_Size, Screen_Resolution, Screen_Frequency, Operating_System,
		Price, d.Discount, Stock_Quantity, Laptop_Image1, Laptop_Image2, Laptop_Image3, Description
FROM Laptops l, Category c, Brands b, Processor_Types p, Discount d
WHERE l.Category_ID = c.Category_ID and l.Brand_ID = b.Brand_ID and l.Processor_Type_ID = p.Processor_Type_ID and l.Category_ID = d.Category_ID and Status = 1

UPDATE Laptops SET Stock_Quantity = Stock_Quantity + 10 WHERE Laptop_ID = 1

SELECT
    c.Category_ID,
    c.Category_Name,
    COUNT(l.Laptop_ID) AS LaptopCount,
    COUNT(l.Laptop_ID) * 100.0 / SUM(COUNT(l.Laptop_ID)) OVER () AS LaptopPercentage
FROM Category c
LEFT JOIN Laptops l ON c.Category_ID = l.Category_ID
GROUP BY c.Category_ID, c.Category_Name
ORDER BY c.Category_ID;


-- Reviews---------------------------------------------------------------------------------------------------------------------
SELECT * FROM Reviews
DROP TABLE Reviews

-- Orders----------------------------------------------------------------------------------------------------------------------
SELECT * FROM Orders
DROP TABLE Orders

SELECT DISTINCT MONTH(Order_Date) AS Month FROM Orders;

SELECT DISTINCT MONTH(Order_Date) AS Month, COUNT(*) AS RecordCount
FROM Orders
GROUP BY MONTH(Order_Date);

SELECT
    MONTH(o.Order_Date) AS Month,
    COUNT(*) AS RecordCount,
    SUM(((i.Price_Per_Item * (1 - i.Discount)) * i.Quantity + o.Ship_Fee)) AS TotalAmount
FROM Orders o
JOIN Order_Items i ON o.Order_ID = i.Order_ID
GROUP BY MONTH(o.Order_Date);

SELECT
    SUM(((i.Price_Per_Item * (1 - i.Discount)) * i.Quantity + o.Ship_Fee)) AS TotalAmount
FROM Order_Items i
JOIN Orders o ON o.Order_ID = i.Order_ID;

UPDATE Orders SET Status = 'Successful delivery' WHERE Order_ID BETWEEN 1 AND 21;

UPDATE Orders SET Order_Date = '2023-10-15' WHERE Order_ID BETWEEN 15 AND 21;

UPDATE Orders SET Name = ? Phone_Number = ? Address = ? Status = ? WHERE Order_ID = ?

SELECT Order_ID FROM Orders WHERE User_ID = 1 ORDER BY Order_Date DESC;

DELETE FROM Orders WHERE Order_ID = 1

ALTER TABLE Orders ADD Phone_Number NVARCHAR(50) NOT NULL

ALTER TABLE Orders DROP COLUMN Order_Date

SELECT * FROM Orders WHERE User_ID = 1 ORDER BY Order_Date DESC

SELECT * FROM Orders ORDER BY Order_Date DESC

INSERT INTO Orders (User_ID, Name, Phone_Number, Payment_Method, Ship_Fee, Total_Price, Status, Address, Note) VALUES (1, N'Nguyễn', '123', 'cast', 20000, 1.75984E7, 'pending', N'31, 218, Nguyen Huu Cau, Ngoc Chau, Tỉnh Hải Dương', '')

-- Order_Items-----------------------------------------------------------------------------------------------------------------
SELECT * FROM Order_Items
DROP TABLE Order_Items

SELECT Laptop_ID FROM Order_Items WHERE Order_ID = 1

ALTER TABLE Order_Items ADD Brand VARCHAR(255)

INSERT INTO Order_Items (Order_ID, Model, Laptop_Image1, Quantity, Discount, Price_Per_Item) VALUES ()

-- Payment_Methods-------------------------------------------------------------------------------------------------------------
SELECT * FROM Payment_Methods
DROP TABLE Payment_Methods

--Shopping_Cart----------------------------------------------------------------------------------------------------------------
SELECT * FROM Shopping_Cart
DROP TABLE Shopping_Cart

SELECT Cart_ID, User_ID, c.Product_ID, l.Laptop_Image1, l.Model, l.Price, l.Stock_Quantity, l.Stock_Quantity
FROM Shopping_Cart c, Laptops l
WHERE c.Product_ID = l.Laptop_ID and User_ID = 1 and Product_ID = 1

--Banner-----------------------------------------------------------------------------------------------------------------------
SELECT * FROM Banner
DROP TABLE Banner