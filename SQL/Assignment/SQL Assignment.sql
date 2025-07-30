--------------------------------------------------------------------------------------------------------------------
-- SQL ASSIGNMENT
-------------------------------------------------------------------------------------------------------------------
CREATE database marketco;
use marketco;

-- CREATE COMANY TABLE

CREATE TABLE Company (
    CompanyID INT PRIMARY KEY,
    CompanyName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10)
);

--------------------------------------------------------------------------------------------------------------------
-- Q.1   Statement to create the Contact table
--------------------------------------------------------------------------------------------------------------------
CREATE TABLE Contact (
    ContactID INT PRIMARY KEY,
    CompanyID INT,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10),
    IsMain BOOLEAN,
    Email VARCHAR(45),
    Phone VARCHAR(12),
    FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID)
);

-------------------------------------------------------------------------------------------------------------------
-- Q.2 Statement to create the Employee table
-------------------------------------------------------------------------------------------------------------------

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Salary DECIMAL(10,2),
    HireDate DATE,
    JobTitle VARCHAR(25),
    Email VARCHAR(45),
    Phone VARCHAR(12)
);

--------------------------------------------------------------------------------------------------------------------
-- Q.3 Statement to create the ContactEmployee table
-- HINT: Use DATE as the datatype for ContactDate. It allows you to store the
-- date in this format: YYYY-MM-DD (i.e., ‘2014-03-12’ for March 12, 2014).
---------------------------------------------------------------------------------------------------------------------

CREATE TABLE ContactEmployee (
    ContactEmployeeID INT PRIMARY KEY,
    ContactID INT,
    EmployeeID INT,
    ContactDate DATE,
    Description VARCHAR(100),
    FOREIGN KEY (ContactID) REFERENCES Contact(ContactID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

-- insert values in all the table 

INSERT INTO Company (CompanyID, CompanyName, Street, City, State, Zip) VALUES
(1, 'Urban Outfitters, Inc.', '123 Market St', 'Philadelphia', 'PA', '19107'),
(2, 'Toll Brothers', '250 Gibraltar Rd', 'Horsham', 'PA', '19044'),
(3, 'Tech Solutions', '77 Technology Dr', 'San Jose', 'CA', '95134'),
(4, 'Creative Labs', '89 Sound Blvd', 'Austin', 'TX', '73301'),
(5, 'Green Earth Corp', '12 Eco Ave', 'Denver', 'CO', '80201'),
(6, 'NovaTech', '17 Future Rd', 'Boston', 'MA', '02108'),
(7, 'SkyNet Systems', '9 Cyber Lane', 'Las Vegas', 'NV', '89101'),
(8, 'Bright Media', '42 Light St', 'Seattle', 'WA', '98101'),
(9, 'Urban Outfitters', '345 Fashion Blvd', 'Chicago', 'IL', '60601'),
(10, 'Toll Developers', '88 Build Way', 'Houston', 'TX', '77001');

INSERT INTO Contact (ContactID, CompanyID, FirstName, LastName, Street, City, State, Zip, IsMain, Email, Phone) VALUES
(1, 1, 'Dianne', 'Connor', '456 Walnut St', 'Philadelphia', 'PA', '19107', TRUE, 'dianne.connor@example.com', '215-555-1234'),
(2, 2, 'Mark', 'Peterson', '789 Chestnut St', 'Horsham', 'PA', '19044', TRUE, 'mark.peterson@example.com', '215-555-2345'),
(3, 3, 'Susan', 'Miles', '12 Innovation Blvd', 'San Jose', 'CA', '95134', FALSE, 'susan.miles@example.com', '408-555-3456'),
(4, 4, 'Alex', 'Johnson', '9 Tech St', 'Austin', 'TX', '73301', TRUE, 'alex.johnson@example.com', '512-555-4567'),
(5, 5, 'Linda', 'Bates', '34 Green Dr', 'Denver', 'CO', '80201', TRUE, 'linda.bates@example.com', '303-555-5678'),
(6, 6, 'Tom', 'Holland', '87 Nova Rd', 'Boston', 'MA', '02108', FALSE, 'tom.holland@example.com', '617-555-6789'),
(7, 7, 'Emily', 'Clark', '98 Sky St', 'Las Vegas', 'NV', '89101', FALSE, 'emily.clark@example.com', '702-555-7890'),
(8, 8, 'Steve', 'Rogers', '55 Media Way', 'Seattle', 'WA', '98101', TRUE, 'steve.rogers@example.com', '206-555-8901'),
(9, 9, 'Natalie', 'Smith', '76 Fashion St', 'Chicago', 'IL', '60601', TRUE, 'natalie.smith@example.com', '312-555-9012'),
(10, 10, 'Robert', 'Brown', '100 Build Lane', 'Houston', 'TX', '77001', TRUE, 'robert.brown@example.com', '713-555-0123');


INSERT INTO Employee (EmployeeID, FirstName, LastName, Salary, HireDate, JobTitle, Email, Phone) VALUES
(1, 'Jack', 'Lee', 70000.00, '2022-05-10', 'Sales Manager', 'jack.lee@marketco.com', '215-555-9901'),
(2, 'Maria', 'Chen', 68000.00, '2021-11-15', 'Account Executive', 'maria.chen@marketco.com', '215-555-8800'),
(3, 'Lesley', 'Bland', 72000.00, '2020-03-20', 'Marketing Lead', 'lesley.bland@marketco.com', '215-555-7777'),
(4, 'John', 'Doe', 60000.00, '2022-01-01', 'Developer', 'john.doe@marketco.com', '215-555-1234'),
(5, 'Alice', 'Wong', 65000.00, '2021-07-07', 'Designer', 'alice.wong@marketco.com', '215-555-2345'),
(6, 'Bob', 'Martin', 59000.00, '2023-02-18', 'Tester', 'bob.martin@marketco.com', '215-555-3456'),
(7, 'Clara', 'Knight', 71000.00, '2021-09-22', 'Project Manager', 'clara.knight@marketco.com', '215-555-4567'),
(8, 'Daniel', 'Green', 73000.00, '2020-12-12', 'Support Lead', 'daniel.green@marketco.com', '215-555-5678'),
(9, 'Ellen', 'Page', 68000.00, '2022-06-30', 'HR Executive', 'ellen.page@marketco.com', '215-555-6789'),
(10, 'Tom', 'Cruise', 76000.00, '2019-04-04', 'Operations Manager', 'tom.cruise@marketco.com', '215-555-7890');

INSERT INTO ContactEmployee (ContactEmployeeID, ContactID, EmployeeID, ContactDate, Description) VALUES
(1, 1, 1, '2024-03-12', 'Initial meeting with Dianne Connor'),
(2, 2, 2, '2024-04-01', 'Follow-up with Toll Brothers'),
(3, 2, 3, '2024-04-15', 'Marketing pitch to Toll Brothers'),
(4, 3, 4, '2024-05-20', 'Demo for Tech Solutions'),
(5, 1, 1, '2024-06-10', 'Second contact with Dianne Connor'),
(6, 5, 5, '2024-05-25', 'Presentation for Green Earth'),
(7, 6, 6, '2024-06-01', 'Demo for NovaTech'),
(8, 7, 7, '2024-06-10', 'Cyber security discussion'),
(9, 8, 8, '2024-07-01', 'Content review with Bright Media'),
(10, 9, 9, '2024-07-10', 'Brand strategy session');

--------------------------------------------------------------------------------------------------------------------
-- -- Q.4 In the Employee table, the statement that changes Lesley Bland’s phone number to 215-555-8800
--------------------------------------------------------------------------------------------------------------------
select * from employee;

UPDATE Employee
SET Phone = '215-555-8800'
WHERE EmployeeID = 3;

------------------------------------------------------------------------------------------------------------------
-- Q.5 In the Company table, the statement that changes the name of “Urban Outfitters, Inc.” to “Urban Outfitters” .
------------------------------------------------------------------------------------------------------------------
select * from company;

UPDATE Company
SET CompanyName = 'Urban Outfitters'
WHERE CompanyID = 1;

---------------------------------------------------------------------------------------------------------------------
-- Q.6 In ContactEmployee table, the statement that removes Dianne Connor’s contact event with Jack Lee
-- (one statement). HINT: Use the primary key of the ContactEmployee table to specify the correct record to remove.
---------------------------------------------------------------------------------------------------------------------
select * from contactemployee;
select * from employee;
select * from contact;

delete from contactemployee
where ContactEmployeeID = 5;

---------------------------------------------------------------------------------------------------------------------
-- Q.7 Write the SQL SELECT query that displays the names of the employees that have contacted Toll Brothers 
-- (one statement). Run the SQL SELECT query in MySQL Workbench. Copy the results below as well.
---------------------------------------------------------------------------------------------------------------------
select * from employee;
SELECT DISTINCT e.FirstName,e.LastName from employee e
inner join contactemployee c on e.EmployeeID = c.EmployeeID
inner join contact ce on ce.contactID = c.contactID
where ce.FirstName = 'Toll Brothers ' ;

--------------------------------------------------------------------------------------------------------------------
-- Q.8 What is the significance of “%” and “_” operators in the LIKE statement?
--------------------------------------------------------------------------------------------------------------------
   % = matches any number of characters (including 0)
   _ = matches exactly one character
   Example : 
				WHERE name LIKE 'A%'      -- Names starting with A
				WHERE name LIKE '_a%'     -- Second letter is 'a'

--------------------------------------------------------------------------------------------------------------------
-- Q.9 Explain normalization in the context of databases
--------------------------------------------------------------------------------------------------------------------

Normalization is the process of organizing data to reduce redundancy and improve data integrity.
It involves breaking tables into smaller related tables and defining relationships.

Example: separating Employee and Contact into different tables.

Benefits: avoids duplicate data, easier updates.

--------------------------------------------------------------------------------------------------------------------
-- Q.10 What does a join in MySQL mean?
-------------------------------------------------------------------------------------------------------------------

A JOIN is used to combine rows from two or more tables based on a related column
it will be combined the data for two or more tables.

--------------------------------------------------------------------------------------------------------------------
-- Q.11 What do you understand about DDL, DCL, and DML in MySQL?
--------------------------------------------------------------------------------------------------------------------
| Type | Full Form                  | Use                                                               |
| ---- | -------------------------- | ----------------------------------------------------------------- |
| DDL  | Data Definition Language   | To define or modify structure (e.g., `CREATE`, `ALTER`, `DROP`)   |
| DML  | Data Manipulation Language | To manipulate data (e.g., `INSERT`, `UPDATE`, `DELETE`, `SELECT`) |
| DCL  | Data Control Language      | To control access (e.g., `GRANT`, `REVOKE`)                       |

--------------------------------------------------------------------------------------------------------------------
-- Q.12 What is the role of the MySQL JOIN clause in a query, and what are some common types of joins?
-------------------------------------------------------------------------------------------------------------------

JOIN is used to combine data from multiple tables using a related key.

Common types:

INNER JOIN – only matching records from both tables

LEFT JOIN – all from left table + matching from right

RIGHT JOIN – all from right table + matching from left

FULL OUTER JOIN – all records from both tables 


