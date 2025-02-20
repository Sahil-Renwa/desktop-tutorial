-- ## Question 1 (LEFT JOIN)
-- Find all products and their current inventory levels in Seattle warehouse (warehouse_id = 1), including products with no inventory. 
-- Display product name, category, and quantity. Order by quantity descending, with NULLs last.

-- Expected Output:
-- ```
-- product_name        | category    | quantity
-- -------------------|-------------|----------
-- Gaming Mouse       | Electronics | 200
-- Wireless Earbuds   | Electronics | 150
-- Tennis Racket      | Sports      | NULL
-- Smart Watch        | Electronics | NULL
-- [...remaining products with NULL quantities...]

Select p.product_name,p.category,i.quantity 
    from Products p 
    left join Inventory i on p.product_id=i.product_id
    Where i.warehouse_id = 1  
    Order by i.quantity desc;

-- Comments:
-- This query retrieves all product_name, category and inventory levels of prodcuts in Seattle warehouse. I used LEFT JOIN to include 
-- products with no inventory in the results and used where condition to get data for only seattle warehouse (warehouse id = 1) and 
-- ordered the results in descending order of quantity with NULLs at last.