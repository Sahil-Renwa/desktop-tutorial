-- ## Question 5 (Multiple Aggregations)
-- Generate a warehouse analytics report showing:
-- - Total number of products
-- - Average quantity per product
-- - Total inventory value
-- - Maximum and minimum stock levels
-- - Number of distinct categories
-- Group by warehouse location and only show warehouses with total inventory value > $50,000.

-- Expected Output:
-- ```
-- location    | product_count | avg_quantity | total_value | max_stock | min_stock | category_count
-- ------------|--------------|--------------|-------------|-----------|-----------|---------------
-- Chicago, IL | 8            | 245.5        | 75890.50    | 500       | 125       | 4
-- Dallas, TX  | 7            | 232.1        | 68720.25    | 450       | 100       | 3
-- [...]


select w.location,
	Count(distinct i.product_id) as product_count,
    Avg(i.quantity) as avg_quantity,
    sum(i.quantity*p.base_price) as total_value,
    Max(i.quantity) as max_stock,
    Min(i.quantity) as min_stock,
    Count(Distinct p.category) as category_count
    From warehouses w 
    inner join inventory i on w.warehouse_id = i.warehouse_id
    inner join products p on i.product_id = p.product_id
    Group by w.location
    having total_value > 50000;

-- Comments:
-- I used different aggregation functions like COUNT(Using DISTINCT to get total number of products & categories), 
-- AVG(for average quantity per product), SUM(total inventory value), MAX & MIN(maximum and minimum stock levels)
-- I used INNER JOINs to combine data from the warehouses, inventory, and products tables and then used GROUP BY 
-- to group the results by warehouse location and HAVING clause to filter the results where total inventory value > 50,000. 