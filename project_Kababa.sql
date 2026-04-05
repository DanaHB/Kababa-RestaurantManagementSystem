-- create DATABASE
CREATE DATABASE Kababa1;
USE Kababa1;

-- create tables
CREATE TABLE Category (
    Category_ID INT PRIMARY KEY NOT NULL,
    Category_name ENUM('Main Dishes','Side Dishes','Drinks','Sauces') NOT NULL
);
CREATE TABLE Dish (
    DID INT PRIMARY KEY NOT NULL,
    DName VARCHAR(100) NOT NULL,
    Price DECIMAL(6,2) NOT NULL,
    Description VARCHAR(150),
    Availability VARCHAR(20),
    Preparation_time INT,
    Calories INT,
    Category_ID INT,
    FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID)
);
CREATE TABLE Employee(
    EID INT PRIMARY KEY NOT NULL,
    EName VARCHAR(100) NOT NULL,
    ERole ENUM('Waiter','Cashier','Chef'),
    EPhone VARCHAR(10) UNIQUE,
    EEmail VARCHAR(100) UNIQUE,
    EHire_date DATE
);
CREATE TABLE Orders (
    OID INT PRIMARY KEY,
    Dates DATETIME,
    Order_Type ENUM('Dine_In','Takeaway'),
    Total_Amount DECIMAL(8,2),
    Payment_Method ENUM('Cash','Card'),
    EID INT,              
    CID INT,              
    FOREIGN KEY (EID) REFERENCES Employee(EID)
    on delete set null
    on update cascade,
    FOREIGN KEY (CID) REFERENCES Customer(CID)
    on delete set null
    on update cascade
);
CREATE TABLE Orders_Status(
    Ostatus ENUM('pending','preparing','completed','cancelled'),
    OID INT,
    PRIMARY KEY (Ostatus, OID),
    FOREIGN KEY (OID) REFERENCES Orders(OID)
);
CREATE TABLE Customer (
    CID INT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Customer_Phone VARCHAR(20),
    Customer_Email VARCHAR(100) 
);

ALTER TABLE Orders
ADD CONSTRAINT fk_orders_customer FOREIGN KEY (CID) REFERENCES Customer(CID);

CREATE TABLE Dish_Details (
    DID INT,
    OID INT,
    Quantity INT NOT NULL,
    PRIMARY KEY (DID, OID),
    FOREIGN KEY (DID) REFERENCES Dish(DID),
    FOREIGN KEY (OID) REFERENCES Orders(OID)
);

-- Insert 10 records into each table
INSERT INTO Category (Category_ID, Category_name) VALUES
(1, 'Main Dishes'),
(2, 'Side Dishes'),
(3, 'Drinks'),
(4, 'Sauces');

INSERT INTO Dish
(DID, DName, Price, Description, Availability, Preparation_time, Calories, Category_ID)
VALUES
(1, 'Beef Kebab', 22.00, 'Grilled beef kebab', 'available', 20, 450, 1),
(2, 'Chicken Kebab', 20.00, 'Grilled chicken kebab', 'available', 18, 400, 1),
(3, 'French Fries', 8.00, 'Crispy fried potatoes', 'available', 7, 300, 2),
(4, 'Orange Juice', 6.00, 'Fresh orange juice', 'available', 4, 110, 3),
(5, 'Tahini', 3.00, 'Creamy tahini sauce', 'available', 2, 120, 4),
(6, 'Tawook', 13.00, 'Chicken sandwich with tawook marinade', 'available', 22, 374, 1),
(7, 'Fatosha', 19.00, 'Fresh Fatosha salad with crusty bread', 'available', 5, 42, 2),
(8, 'Lemon Juice', 10.00, 'Fresh lemon drink', 'available', 3, 114, 3),
(9, 'Garlic Sauce', 2.00, 'Creamy garlic dip', 'available', 1, 168, 4),
(10, 'Water', 1.00, 'Bottled drinking water', 'available', 1, 0, 3);

INSERT INTO Employee (EID, EName, ERole, EPhone, EEmail, EHire_date) VALUES
(1, 'Ahmed Mohamed', 'Waiter', '0501234567', 'ahmed.mohamed@example.com', '2023-01-10'),
(2, 'Sara Ali', 'Cashier', '0502345678', 'sara.ali@example.com', '2023-03-15'),
(3, 'Khaled Abdullah', 'Chef', '0503456789', 'khaled.abdullah@example.com', '2023-05-20'),
(4, 'Noura Salem', 'Chef', '0504567890', 'noura.salem@example.com', '2023-07-01'),
(5, 'Fahd Hussein', 'Chef', '0505678901', 'fahd.hussein@example.com', '2023-08-12'),
(6, 'Laila Ahmed', 'Waiter', '0506789012', 'laila.ahmed@example.com', '2023-09-18'),
(7, 'Mohammed Saad', 'Cashier', '0507890123', 'moh.saad@example.com', '2023-10-05'),
(8, 'Hussain Omar', 'Chef', '0508901234', 'hussain.omar@example.com', '2023-11-02'),
(9, 'Rana Ibrahim', 'Waiter', '0509012345', 'rana.ibrahim@example.com', '2024-01-12'),
(10, 'Salem Yaser', 'Chef', '0501122334', 'salem.yaser@example.com', '2024-02-20');


INSERT INTO Customer (CID, Customer_Name, Customer_Phone, Customer_Email) VALUES
(1, 'Ali Hassan', '0551234567', 'ali.hassan@example.com'),
(2, 'Mona Saleh', '0552345678', 'mona.saleh@example.com'),
(3, 'Yousef Ahmad', '0553456789', 'yousef.ahmad@example.com'),
(4, 'Reem Abdullah', '0554567890', 'reem.abdullah@example.com'),
(5, 'Omar Khalid', '0555678901', 'omar.khalid@example.com'),
(6, 'Huda Majed', '0556789012', 'huda.majed@example.com'),
(7, 'Salman Adel', '0557890123', 'salman.adel@example.com'),
(8, 'Dalia Hassan', '0558901234', 'dalia.hassan@example.com'),
(9, 'Majid Younis', '0559012345', 'majid.younis@example.com'),
(10, 'Fatimah Saeed', '0550123456', 'fatimah.saeed@example.com');

INSERT INTO Orders (OID, Dates, Order_Type, Total_Amount, Payment_Method, EID, CID) VALUES
(1, '2025-01-10 14:20:00', 'Dine_In', 64.00, 'Cash', 1, 1),
(2, '2025-01-11 15:45:00', 'Takeaway', 36.00, 'Card', 2, 2),
(3, '2025-01-11 18:10:00', 'Dine_In', 6.00, 'Cash', 1, 3),
(4, '2025-01-12 12:30:00', 'Takeaway', 3.00, 'Card', 2, 4),
(5, '2025-01-12 19:00:00', 'Dine_In', 42.00, 'Cash', 3, 5),
(6, '2025-01-13 13:10:00', 'Dine_In', 55.00, 'Cash', 6, 6),
(7, '2025-01-13 16:45:00', 'Takeaway', 27.00, 'Card', 7, 7),
(8, '2025-01-14 11:30:00', 'Dine_In', 38.00, 'Cash', 8, 8),
(9, '2025-01-14 14:55:00', 'Takeaway', 22.00, 'Card', 9, 9),
(10, '2025-01-15 18:00:00', 'Dine_In', 70.00, 'Cash', 10, 10);

INSERT INTO Orders_Status (Ostatus, OID) VALUES
('pending', 1),
('completed', 2),
('cancelled', 3),
('completed', 4),
('preparing', 5),
('preparing', 6),
('completed', 7),
('pending', 8),
('preparing', 9),
('completed', 10);

INSERT INTO Dish_Details (DID, OID, Quantity) VALUES
(1, 1, 2),
(2, 1, 1),
(3, 2, 2),
(4, 3, 1),
(5, 4, 1),
(6, 6, 2),
(7, 7, 1),
(8, 8, 3),
(9, 9, 1),
(10, 10, 2);

-- Select all records from all tables
select*from Category;
describe Category;

select*from Customer;
describe Customer;

select*from Orders;
describe orders;

select*from Dish;
describe dish;

select*from Employee;
describe employee;

select*from Orders_Status;
describe orders_status;

select*from Dish_Details;
describe dish_details;


-- ====HAJER====
SELECT DName, Price FROM Dish WHERE Price > 10;
SELECT DName, Calories FROM Dish WHERE Calories < 100;

SELECT COUNT(*) FROM Orders;
 
SELECT Category_ID, AVG(Price) 
FROM Dish GROUP BY Category_ID;


SELECT Customer.Customer_Name, Orders.OID
FROM Customer
JOIN Orders ON Customer.CID = Orders.CID;

SELECT Orders.OID, Dish.DName, dish_details.Quantity
FROM Orders
JOIN dish_details ON Orders.OID = dish_details.OID
JOIN Dish ON Dish.DID = dish_details.DID;

SELECT DName 
FROM Dish 
WHERE Price > (SELECT AVG(Price) FROM Dish);

SELECT Customer_Name 
FROM Customer 
WHERE CID IN (SELECT CID FROM Orders WHERE Total_Amount > 50);

CREATE VIEW Order_Report AS
SELECT Orders.OID, Customer.Customer_Name AS Customer_Name, Orders.Total_Amount
FROM Orders
JOIN Customer ON Orders.CID = Customer.CID;

select * from Order_Report;



-- ====DANA====
-- selects customer names and phone numbers where the phone number starts with '055’
SELECT Customer_Name, Customer_Phone
FROM Customer
WHERE Customer_Phone LIKE '0553%';

-- displays all employee names who work as Chefs.
SELECT EName AS Chef_Employee
FROM Employee
WHERE ERole = 'Chef';

-- calculates the total revenue from all orders.
SELECT SUM(Total_Amount) AS Total_Revenue
FROM Orders;

-- finds the highest dish price on the menu.
SELECT MAX(Price) AS Highest_Price
FROM Dish;

-- lists all orders along with their status.
SELECT Orders.OID, Orders_Status.Ostatus
FROM Orders
JOIN Orders_Status ON Orders.OID = Orders_Status.OID;

-- retrieves customers and the total amount they spent in every order.
SELECT Customer.Customer_Name, Orders.Total_Amount
FROM Customer
JOIN Orders ON Customer.CID = Orders.CID;


-- Find dishes that have more calories than the average calories in their category.
SELECT DName, Calories
FROM Dish d
WHERE Calories > (
    SELECT AVG(Calories)
    FROM Dish
    WHERE Category_ID = d.Category_ID
);

-- Find dishes that were never ordered.
SELECT DName
FROM Dish
WHERE DID NOT IN (
    SELECT DISTINCT DID
    FROM Dish_Details
);
 
 -- View to show average price and calories for each category.
 CREATE VIEW Category_Stats AS
SELECT Category.Category_name, AVG(Dish.Price) AS Avg_Price, AVG(Dish.Calories) AS Avg_Calories
FROM Category
JOIN Dish ON Category.Category_ID = Dish.Category_ID
GROUP BY Category.Category_name;

select * from Category_Stats;


-- ====ALAA==== 
-- Shows dishes priced above 20 SAR
SELECT DName, Price
FROM Dish
WHERE Price > 20;

-- Shows customers whose phone number ends with the digit 9.
SELECT Customer_Name, Customer_Phone
FROM Customer
WHERE Customer_Phone LIKE '%9';

-- Counts the total number of dishes in the menu.
SELECT COUNT(*) AS Total_Dishes
FROM Dish;

-- Finds the highest total amount among all orders.
SELECT MAX(Total_Amount) AS Highest_Order_Amount
FROM Orders;


-- Shows customers along with their order IDs
SELECT Customer.Customer_Name, Orders.OID
FROM Customer
JOIN Orders ON Customer.CID = Orders.CID;

-- Shows dish names along with the category each dish belongs to.
SELECT Dish.DName, Category.Category_name
FROM Dish
JOIN Category ON Dish.Category_ID = Category.Category_ID;

-- Shows dishes priced above the average dish price
SELECT DName
FROM Dish
WHERE Price > (SELECT AVG(Price) FROM Dish);

-- Shows the dishes that belong to the "Drinks" category.
SELECT DName, Price
FROM Dish
WHERE Category_ID = (
    SELECT Category_ID
    FROM Category
    WHERE Category_name = 'Drinks'
);

-- Shows orders where the total amount is higher than the average of all orders.
SELECT OID, Total_Amount
FROM Orders
WHERE Total_Amount > (
    SELECT AVG(Total_Amount)
    FROM Orders
);


-- Lists customers who have at least one order in the system.
SELECT Customer_Name
FROM Customer
WHERE CID IN (
    SELECT CID
    FROM Orders
);

-- View showing dish names and their prices
CREATE VIEW Dish_Prices_View AS
SELECT DName, Price
FROM Dish;

SELECT * FROM Dish_Prices_View;










