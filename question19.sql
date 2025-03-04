-- ## Question (SELF JOIN)
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

select a.employee_name 
from Employees_linkedin2 a, Employees_linkedin2 b
where a.hire_date > b.hire_date and a.manager_id=b.employee_id;

-- Comments
-- I used self join to join the table with itself to get the details of employees who joined after their manager.
-- Then used WHERE clause to filter the employees based on their hire_date and compared their manager_id with employee_id to get the
-- desired output.         