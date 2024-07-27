USE techforall 

Select * FROM employee

--for each location, what is thecount of each employee and avg salary of the employee in those location
SELECT  LearnerSOJ, count(*) as n
from Learners
group by LearnerSOJ
having n>2;

--for each location, what is thecount of each employee and avg salary of the employee in those location
--but also first name ans last name corresponding to each record
SELECT FirstName, LastName, Employee.Location, Total,Avg_Salary
From employee
join
(SELECT Location, count(Location) as Total,AVG(Salary) as Avg_Salary
FROM employee
GROUP BY Location) AS temp
on Employee.Location=temp.Location

--optimize the above queries via window funtion
SELECT FirstName,LastName, Location,
COUNT(Location) OVER(PARTITION BY Location) AS Total,
AVG(Salary) OVER (PARTITION BY Location) AS AVG_Salary
FROM employee

--display the table according to the priority higher salary has higher priority
SELECT Firstname,Lastname,Salary,
ROW_NUMBER() OVER (ORDER BY Salary DESC) AS Priority_emp
FROM employee
--there there is a problem in this query it shows same salary as different priorit to same salary

--now we can use rank
SELECT Firstname,Lastname,Salary,
rank() OVER (ORDER BY Salary DESC) AS Priority_emp
FROM employee
--it shows same priorit to same salary but skip the count let say 1 and 2 has same salary then rank(1,1,3) it skip 2

--TO SOLVE THIS PROBLEN DENSE_RANK COMES IN THE PICTURE
SELECT Firstname,Lastname,Salary,
DENSE_RANK() OVER (ORDER BY Salary DESC) AS Priority_emp
FROM employee


--Give the employee name how has seconh highet salary
Select * FROM
(SELECT Firstname,Lastname,Salary,
DENSE_RANK() OVER (ORDER BY Salary DESC) AS Priority_emp
FROM employee) AS temp
WHERE Priority_emp=2

--Give the first employee name how has seconh highet salary
Select * FROM
(SELECT Firstname,Lastname,Salary,
ROW_NUMBER() OVER (ORDER BY Salary DESC) AS Priority_emp
FROM employee) AS temp
WHERE Priority_emp=2

--specify the details of higher salary people in each location
Select * FROM
(SELECT Firstname,Lastname,Salary,Location,
ROW_NUMBER() OVER (PARTITION BY Location ORDER BY Salary DESC) AS Priority_emp
FROM employee) AS temp
WHERE Priority_emp=1

