-- ## Question 13 (LEAD/LAG Analysis)
-- Analyze inventory changes by comparing:
-- - Current quantity with previous month
-- - Current quantity with next month
-- - Percentage change from previous
-- - Projected next month change
-- For each product in a specific warehouse.

-- Expected Output:
-- ```
-- product_name    | current_qty | prev_month_qty | next_month_qty | pct_change | projected_change
-- ----------------|-------------|----------------|----------------|------------|------------------
-- Wireless Earbuds| 150         | 120            | 180            | +25%       | +20%
-- Gaming Mouse    | 200         | 180            | 220            | +11%       | +10%
-- Smart Watch     | 175         | NULL           | 160            | NULL       | -8.5%
-- ```

select productname, current_qty, prev_month_qty, next_month_qty, pct_change, projected_change from
(select 
    p.product_name as productname,
    i.quantity as current_qty,
    lag(i.quantity) over (partition by i.product_id order by i.last_updated) as prev_month_qty,
    lead(i.quantity) over (partition by i.product_id order by i.last_updated) as next_month_qty,
    concat(round(((i.quantity-lag(i.quantity) over (partition by i.product_id order by i.last_updated))*100.0/lag(i.quantity) over 
    (partition by i.product_id order by i.last_updated)),2),'%') as pct_change,
    concat(round(((lead(i.quantity) over (partition by i.product_id order by i.last_updated)-i.quantity)*100.0/i.quantity),2),'%')
    as projected_change
from inventory i
join products p on i.product_id=p.product_id) as t
where month(t.last_updated) = month(current_timestamp());

-- Comments:
-- In the above query I have used the LAG and LEAD functions to compare the current quantity with the previous month and next month
-- respectively. I have used the CONCAT function to concatenate the percentage change values and used the ROUND function to round the
-- values to 2 decimal places. I have used the PARTITION BY clause to partition the data based on product_id and ordered the data base
-- on last_updated column to get the desired output. I have used JOIN between inventory and products table to get the product_name.