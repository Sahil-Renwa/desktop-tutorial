-- ## Question 7 (Complex GROUP BY with conditions)
-- Find product categories where:
-- - Average inventory value > $10,000
-- - At least 3 different products in stock
-- - Maximum quantity of any product > 200
-- Show category, product count, avg value, and highest stocked product name.

-- Expected Output:
-- ```
-- category    | product_count | avg_value | highest_stocked_product
-- ------------|--------------|-----------|----------------------
-- Electronics | 5            | 12500.75  | Gaming Mouse
-- Sports      | 4            | 11200.50  | Yoga Mat
-- [...]
-- ```

select p.category, 
	count(distinct i.product_id) as product_count,
	avg(i.quantity * p.base_price) as avg_value,
    (select product_name from products 
    where product_id = (select product_id 
                        from inventory 
                        where quantity = 
                            (select max(quantity) 
                             from inventory 
                             where product_id = i.product_id))) as highest_stocked_product
    from inventory i 
    join products p on i.product_id=p.product_id
    Group by p.category
    having product_count > 2 and avg_value > 10000 and i.quantity > 200; 

-- Comments:
-- In above query I have used SELECT statement to select the columns category, used aggregate function COUNT to for distinct 
-- products count and AVG to calculate the average value. I have used the subqueries to get the highest stocked product name.
-- First i found the product_id with the maximum quantity and then used that product_id to get the product_name from the products table.
-- Then using JOIN clause I joined the inventory and products table on product_id and then used GROUP BY clause to group the records 
-- by category and then used HAVING clause to filter the records where product_count > 2, avg_value > 10000 and quantity > 200.