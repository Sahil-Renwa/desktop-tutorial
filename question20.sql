-- ## Question (RECURSIVE QUERY)
-- Write a query to find all employees who joined after their manager.
-- hashtag#Create_the_Employees_table
-- CREATE TABLE Employees_linkedin2 (
-- employee_id INT PRIMARY KEY,
-- employee_name VARCHAR(255),
-- hire_date DATE,
-- manager_id INT 
-- );
-- hashtag#Insert_data_into_the_Employees_table
-- INSERT INTO Employees_linkedin2 (employee_id, employee_name, hire_date, manager_id) VALUES
-- (1, 'John Doe', '2023-01-15', NULL), 
-- (2, 'Jane Smith', '2023-02-20', 1),
-- (3, 'David Lee', '2023-03-10', 1),
-- (4, 'Sarah Jones', '2022-01-05', 2);

-- Expected O/P:
-- employee_name
-- Jane Smith
-- David Lee

-- for the same data, try to write a Recursive query. Create a new column, that shows how many managers were there above him.
-- For eg:
-- for employee_id 4: he has 2 managers above him (employee_id: 2 and 1)
-- for employee_id: 2 and 3, has only 1 manager (employee_id: 1)
-- for employee_id:1, he is the manager (He reports to no one as his manager_id is null)

-- Write your query here
WITH RECURSIVE cte AS (
  SELECT employee_id, employee_name, manager_id, 0 as level
  FROM Employees_linkedin2
  WHERE manager_id IS NULL
  UNION all
  SELECT e.employee_id, e.employee_name, e.manager_id, c.level + 1
  FROM Employees_linkedin2 e
  JOIN cte c
  ON c.employee_id = e.manager_id
)   
select * from cte;

--Comments:
--In the above query, I have used a recursive common table expression (CTE) to find all employees who joined after their manager.
--I have used the WITH RECURSIVE clause to define the recursive CTE named cte. In the initial part of the CTE, I have selected the
--employees who have a NULL manager_id, which means they are managers themselves. In the recursive part of the CTE, I have joined the
--Employees_linkedin2 table with the cte to find the employees who report to the managers identified in the initial part. I have
--incremented the level by 1 in each recursive step to keep track of the number of managers above each employee. Finally, I have
--selected all columns from the cte to get the desired output.