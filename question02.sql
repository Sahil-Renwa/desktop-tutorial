-- ## Question 2 (INNER JOIN)
-- List all warehouses that store electronics products, along with the total quantity and total value of electronics inventory 
-- (quantity * base_price). Only include warehouses with electronics inventory worth over $20,000. Order by total value descending.

-- Expected Output:
-- ```
-- location    | total_quantity | total_value
-- ------------|---------------|-------------
-- Seattle, WA | 350           | 31497.50
-- Boston, MA  | 365           | 25696.35
-- Chicago, IL | 275           | 21997.25
-- ```

select w.location, sum(i.quantity) as total_quantity, sum(i.quantity * p.base_price) as total_value
    from warehouses w 
    inner join inventory i on w.warehouse_id = i.warehouse_id
    inner join products p on i.product_id = p.product_id
    where p.category = 'Electronics'
    group by w.location
    having sum(i.quantity * p.base_price) > 20000
    order by total_value desc;

-- Comments:
-- This query retrieves the location, total_quantity,total_value of warehouses that store electronics products.
-- I used INNER JOINs to combine data from the warehouses, inventory, and products tables.
-- Then applied WHERE clause to filter 'Electronics' category and used GROUP BY to group the results by warehouse location.
-- Further using HAVING clause to include locations worth inventory over 20000 and then ORDER BY to sort in descending order.