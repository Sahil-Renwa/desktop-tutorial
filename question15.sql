-- ## Question 15 (RANK, DENSE_RANK, ROW_NUMBER)
-- Create a warehouse performance report showing:
-- - Regular ranking by total inventory value
-- - Dense ranking by number of products
-- - Row number by average quantity
-- Include only warehouses handling >5 products.

-- Expected Output:
-- ```
-- warehouse    | total_value | value_rank | products | product_rank | avg_qty | qty_rn
-- -------------|-------------|------------|----------|--------------|---------|--------
-- Chicago      | 120500.75  | 1          | 12       | 1            | 245     | 3
-- Dallas       | 120500.75  | 1          | 10       | 2            | 300     | 1
-- Seattle      | 98750.50   | 3          | 10       | 2            | 280     | 2


select w.location as warehouse,
    sum(i.quantity*p.base_price) as total_value,
    rank() over (order by sum(i.quantity*p.base_price) desc) as value_rank,
    count(distinct i.product_id) as products,
    dense_rank() over (order by count(distinct i.product_id) desc) as product_rank,
    avg(i.quantity) as avg_qty,
    row_number() over (order by avg(i.quantity) desc) as qty_rn
    from warehouses w 
    inner join inventory i on w.warehouse_id = i.warehouse_id
    inner join products p on i.product_id = p.product_id
    group by w.location
    having count(distinct i.product_id) > 5
    order by value_rank;

-- Comments:
-- In the above query I have used the RANK() window function to rank the warehouses based on the total inventory value and to calculate
-- total_value I have used SUM function to calculate the product of quantity and base_price. I have used the DENSE_RANK() window 
-- function to rank the warehouses based on the number of products and to calculate the number of products I have used COUNT function.
-- I have used the ROW_NUMBER() window function to rank the warehouses based on the average quantity and to calculate the average 
-- quantity I have used AVG function. I have used the GROUP BY clause to group the records based on the location of the warehouse and
-- used the HAVING clause to filter the records where the number of products is greater than 5 and used JOIN to join the tables atlast
-- ORDER BY clause to order the records based on the value_rank.