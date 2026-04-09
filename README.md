# Kababa Restaurant Database System
### Relational Database Design and SQL Implementation

## 1. Project Overview
This project involves the design and implementation of a relational database for **"Kababa"**, a Saudi grilled cuisine restaurant. The system is engineered to manage core restaurant operations, including menu management, employee roles, customer data, and order processing.



## 2. Database Schema & Design
The database consists of 7 interconnected tables designed to ensure data integrity and minimize redundancy through normalization. 

### Core Entities:
* **Category & Dish:** Manages the menu items, pricing, and nutritional information.
* **Employee:** Tracks staff information and roles (Waiters, Cashiers, Chefs).
* **Customer:** Stores client contact details for order history.
* **Orders & Orders_Status:** Handles transaction records and real-time order tracking.
* **Dish_Details:** A junction table managing the many-to-many relationship between orders and dishes.

## 3. Key Implementation Features
The project showcases advanced SQL capabilities, including:
* **Data Definition (DDL):** Precise table creation with primary keys, foreign keys, and constraints.
* **Relational Joins:** Complex queries merging data from multiple tables to generate detailed reports.
* **Subqueries:** Advanced data retrieval for business analytics (e.g., identifying high-calorie dishes or frequent customers).
* **Database Views:** Implementation of views like `Order_Report` and `Category_Stats` for simplified data access.

## 4. Technologies Used
* **Language:** SQL (Structured Query Language)
* **Tools:** MySQL Workbench


## 6. Project Documentation
For the full ER Diagram and Relational Schema, please refer to the project report:
* [Database Project Report (PDF)](./DB_Project.pdf)
