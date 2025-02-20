-- ## Question 12 (Cumulative Sum and Average)
-- Generate a monthly sales trend analysis showing:
-- - Running total of inventory value
-- - Running average of quantity
-- - Percentage of total inventory
-- Ordered by warehouse location and product category.

-- Expected Output:
-- ```
-- location    | category    | quantity | running_total | running_avg | pct_of_total
-- ------------|------------|----------|---------------|-------------|-------------
-- Chicago, IL | Electronics| 250      | 12500.00      | 250.00      | 15.5
-- Chicago, IL | Sports     | 300      | 27500.00      | 275.00      | 28.3
-- Dallas, TX  | Electronics| 200      | 37500.00      | 250.00      | 35.8
-- ```

select 
    w.location,
    p.category,
    i.quantity,
    p.base_price,
    round(sum(i.quantity * p.base_price) over(rows between unbounded preceding and current row),2) as running_total,
    round(avg(i.quantity) over (rows between unbounded preceding and current row),2) as running_avg,
 	round((sum(i.quantity * p.base_price) over (rows between unbounded preceding and current row)/sum(i.quantity * p.base_price) over()) * 100, 1) as pct_of_total
from inventory i
join products p on i.product_id=p.product_id
join warehouses w on i.warehouse_id=w.warehouse_id;

-- Comments:
-- In the above query I have used the SUM function along with OVER keyword to calculate the cumulative sum of the inventory value
-- and to calculate the percentage of total inventory. I have used the ROUND function to round the values to 2 decimal places.
-- Similarly, I have used the AVG function tocalculate the running average of the quantity and used join between inventory, products
-- and warehouses table to get the location and category.