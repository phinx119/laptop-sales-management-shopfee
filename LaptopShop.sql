--Create a new database for the laptop shop
--CREATE DATABASE ShopFee;
--DROP DATABASE ShopFee;

--Use the new database
--USE ShopFee;

-- Create a table for Roles
CREATE TABLE Roles (
    Role_ID INT PRIMARY KEY IDENTITY(1,1),
    Role_Name NVARCHAR(255) NOT NULL
);

-- Create a table for Users
CREATE TABLE Users (
    User_ID INT PRIMARY KEY IDENTITY(1,1),
    Username NVARCHAR(50) NOT NULL,
    Password NVARCHAR(255) NOT NULL,
    Email NVARCHAR(255) NOT NULL,
    Name NVARCHAR(100) NOT NULL,
    Phone_Number NVARCHAR(15),
	Role_ID INT,
	Avatar_Image NVARCHAR(MAX),
    FOREIGN KEY (Role_ID) REFERENCES Roles (Role_ID),
	Status TINYINT DEFAULT 1,
);

-- Create a table for Brands
CREATE TABLE Brands (
    Brand_ID INT PRIMARY KEY IDENTITY(1,1),
    Brand_Name NVARCHAR(255) NOT NULL,
	Brand_Image NVARCHAR(MAX) NOT NULL
);

-- Create a table for Category
CREATE TABLE Category (
    Category_ID INT PRIMARY KEY IDENTITY(1,1),
    Category_Name NVARCHAR(255) NOT NULL,
	Category_Image NVARCHAR(MAX) NOT NULL
);

-- Create a table for Processor Types
CREATE TABLE Processor_Types (
    Processor_Type_ID INT PRIMARY KEY IDENTITY(1,1),
    Processor_Type_Name NVARCHAR(255) NOT NULL
);

-- Create a table for Laptops
CREATE TABLE Laptops (
    Laptop_ID INT PRIMARY KEY IDENTITY(1,1),
    Brand_ID INT NOT NULL,
    Model NVARCHAR(MAX) NOT NULL,
	Category_ID INT NOT NULL,
    Processor_Type_ID INT NOT NULL,
	Processor_Type_Name NVARCHAR(100),
	Graphics_Card NVARCHAR(100),
    RAM INT,
    Storage NVARCHAR(100),    
    Screen_Size DECIMAL(4,2),
	Screen_Resolution NVARCHAR(50),
	Screen_Frequency INT,
    Operating_System NVARCHAR(50),
    Price DECIMAL(10, 2),
    Stock_Quantity INT,
    Laptop_Image1 NVARCHAR(MAX),
	Laptop_Image2 NVARCHAR(MAX),
	Laptop_Image3 NVARCHAR(MAX),
	Description NVARCHAR(MAX),
	Status INT,
    FOREIGN KEY (Category_ID) REFERENCES Category (Category_ID),
	FOREIGN KEY (Brand_ID) REFERENCES Brands (Brand_ID),
    FOREIGN KEY (Processor_Type_ID) REFERENCES Processor_Types (Processor_Type_ID),
);

-- Create a table for Discount
CREATE TABLE Discount (
    Category_ID INT NOT NULL,
    Discount DECIMAL(10, 2) NOT NULL,
	FOREIGN KEY (Category_ID) REFERENCES Category (Category_ID),
)

-- Create a table for Reviews
CREATE TABLE Reviews (
    Review_ID INT PRIMARY KEY IDENTITY(1,1),
    Product_ID INT NOT NULL,
    User_ID INT NOT NULL,
    Rating INT NOT NULL, -- e.g., 1 to 5
    Comment NVARCHAR(MAX),
    Date_Posted DATETIME NOT NULL,
    FOREIGN KEY (Product_ID) REFERENCES Laptops (Laptop_ID), -- Assuming reviews are for laptops
    FOREIGN KEY (User_ID) REFERENCES Users (User_ID)
);

-- Create a table for Orders
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY IDENTITY(1,1),
    User_ID INT NOT NULL,
	Name NVARCHAR(100) NOT NULL,
	Phone_Number NVARCHAR(50) NOT NULL,
    Order_Date DATETIME DEFAULT GETDATE(),
	Payment_Method NVARCHAR(100) NOT NULL,
	Ship_Fee DECIMAL(10, 2),
	Total_Price DECIMAL(10, 2),
    Status NVARCHAR(20) NOT NULL, -- e.g., 'pending', 'shipped', 'delivered'
	Address NVARCHAR(MAX) NOT NULL,
	Note NVARCHAR(MAX),
    FOREIGN KEY (User_ID) REFERENCES Users (User_ID)
);

-- Create a table for Order_Items
CREATE TABLE Order_Items (
    Order_Item_ID INT PRIMARY KEY IDENTITY(1,1),
    Order_ID INT NOT NULL,
	Laptop_ID INT NOT NULL,
	Model VARCHAR(MAX),
	Brand VARCHAR(255),
	Laptop_Image1 NVARCHAR(MAX),
    Quantity INT NOT NULL,
	Discount DECIMAL(10, 2),
    Price_Per_Item DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Order_ID) REFERENCES Orders (Order_ID),
	FOREIGN KEY (Laptop_ID) REFERENCES Laptops (Laptop_ID),
);

-- Create a table for Shopping_Cart
CREATE TABLE Shopping_Cart (
    Cart_ID INT PRIMARY KEY IDENTITY(1,1),
    User_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES Users (User_ID),
    FOREIGN KEY (Product_ID) REFERENCES Laptops (Laptop_ID) -- Assuming laptops can be added to the shopping cart
);

-- Create a table for Banner
CREATE TABLE [dbo].[Banner] (
    [Banner_ID] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [Banner_Name] VARCHAR(MAX) NOT NULL,
    [Banner_Image] VARCHAR(MAX) NOT NULL,
	[Banner_Link] VARCHAR(MAX) NOT NULL,
);
