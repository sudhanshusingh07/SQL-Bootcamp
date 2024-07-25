SHOW DATABASES; --it show all databases
CREATE DATABASE techforall;   --it create a database name as takeforall
CREATE DATABASE techforall; -- this will give error if database already exits that's why we use below code to get the warning if the database is already present
CREATE DATABASE IF NOT EXISTS techforallwithpriya; -- warning are better than error  
USE techforallwithpriya;
SELECT database(); -- to find out which database is currently being used

-- creating the table employee
CREATE TABLE employee(
	EID			INT PRIMARY KEY, -- PRIMARY KEY constraint uniquely identifies each record in a table
    FirstName 	varchar(50) NOT NULL,
    LastName 	varchar(50) NOT NULL,
    Age 		INT NOT NULL,
    Salary 		INT NOT NULL,
    Location 	varchar(50) NOT NULL,
);

--another way to creating the table
CREATE TABLE employee(
	EID			INT AUTO_INCREMENT,  -- Auto-increment allows a unique number to be generated automatically when a new record is inserted into a table,by defult initialy its value is 1
    FirstName 	varchar(50) NOT NULL,
    LastName 	varchar(50) NOT NULL,
    Age 		INT NOT NULL,
    Salary 		INT NOT NULL,
    Location 	varchar(50) NOT NULL,
    PRIMARY KEY(EID)
);
DESC employee; -- shows the schema of the table like attributes, domain and constraints details
DROP TABLE employee; -- Delete the table
SHOW TABLES; -- show all tables inside the selected database
 
# insertion of entities inside the table
INSERT INTO employee VALUES(1,"Monu","KD",20,127001,"Delhi"); --this is use for first type of table in second type of table it show error
INSERT INTO employee(FirstName,LastName,Age,Salary,Location) VALUES("Monu","KD",20,127001,"Delhi"); -- this is use for second type of table no need to provide the value of EID
INSERT INTO employee(FirstName,LastName,Age,Salary,Location) VALUES("Jack","Huggins",22,150000,"US");
INSERT INTO employee(FirstName, LastName, Age, Salary, Location) VALUES
  ("John", "Doe", 30, 75000, "US"),
  ("Jane", "Smith", 25, 80000, "UK"),
  ("Emily", "Jones", 42, 90000, "CA"),
  ("Michael", "Brown", 28, 68000, "AU"),
  ("Sarah", "Garcia", 35, 100000, "FR"),
  ("David", "Miller", 21, 55000, "DE"),
  ("Amanda", "Davis", 48, 120000, "JP"),
  ("Christopher", "Clark", 33, 85000, "IN"),
  ("Olivia", "Robinson", 27, 95000, "BR"),
  ("Matthew", "Williams", 45, 110000, "IT");
SELECT * FROM employee;


-- Filtering Records using WHERE Clause
SELECT * FROM employee WHERE Salary > 100000;

-- Selective Filtering
SELECT FirstName,Age,Location FROM employee WHERE Salary > 100000;

-- what will be the flow of this command 
-- my ans -> 1.FROM  2.WHERE  3.SELECT -> Output

-- Question_1 : Give me the record of the employee having the age more than 25?
SELECT * FROM employee WHERE Age > 25;

-- Question_2 : Update the Jhon's LastName to Wick? 
UPDATE employee SET LastName = 'Wick' WHERE EID = 3;
SELECT * FROM employee WHERE EID = 3;
-- Note : use UPDATE commands with PRIMARY KEY only cause seletion must be done through unique identifiers for no future regrets!

-- Question_3 : Difference B/W UPDATE and ALTER command?
-- Answer : UPDATE is DML command and ALTER is DDL command 
		 -- works of record level  |  works on schema level
         
-- Question_4 : Delet any record using EID?
DELETE FROM employee WHERE EID = 4;
SELECT * FROM employee WHERE EID = 4;
SELECT * FROM employee;
