-- ## Question 17 (FIRST_VALUE, LAST_VALUE, NTILE)
-- Analyze product performance by:
-- - First and last products sold in each category
-- - Product price quartiles within category
-- - Comparison with category boundaries

-- Expected Output:
-- ```
-- category    | product_name | price | first_sold | last_sold | quartile | price_range
-- ------------|-------------|-------|------------|-----------|----------|-------------
-- Electronics | Smart Watch | 199.99| Earbuds    | Keyboard  | 4        | High
-- Sports      | Yoga Mat    | 29.99 | Shoes      | Weights   | 2        | Medium-Low

select *,case when quartile = 1 then 'Low'
when quartile = 2 then 'Medium-Low'
when quartile = 3 then 'Medium-High'
when quartile = 4 then 'High'
end as price_range from
(select p.category,
p.product_name,
p.base_price,
first_value(p.product_name) over (partition by p.category order by i.last_updated) as first_sold,
last_value(p.product_name) over (partition by p.category order by i.last_updated rows between unbounded preceding and unbounded following) as last_sold,
ntile(4) over (partition by p.category order by p.base_price) as quartile
from products p join inventory i on p.product_id=i.product_id) as t;

--Comments:
--In the above query, I have used the FIRST_VALUE and LAST_VALUE functions to find the first and last products sold in each category. 
--I have used the NTILE function to divide the products into quartiles based on the base_price within each category. I have used the
--PARTITION BY clause to partition the data based on category and ordered the data based on last_updated column to get the desired 
--output. I have used JOIN between products and inventory table to get the product_name and base_price and made it as a temp table by
--writing these all in a subquery. So that in main query I can use CASE statement over the quartile column abd assigned the values 
--based on range and get the desired output.
