-- ## Question 8 (UNION and UNION ALL)
-- Create a report showing:
-- 1. Products with zero inventory (from LEFT JOIN)
-- 2. Products with over 400 units in any warehouse
-- 3. Products with value over $10,000 in any warehouse
-- Label each row with its source category.

-- Expected Output:
-- ```
-- source_category | product_name    | quantity | value
-- ----------------|----------------|----------|-------
-- No Stock        | Smart Watch    | 0        | 0.00
-- High Stock      | Backpack       | 450      | 22495.50
-- High Value      | Gaming Mouse   | 350      | 20996.50
-- [...]
-- ```

select 'No Stock' as source_category,p.product_name,i.quantity,sum(i.quantity*p.base_price) as value
from products p 
left join inventory i on p.product_id=i.product_id
where i.quantity = 0
union all
select 'High Stock' as source_category,p.product_name,i.quantity,sum(i.quantity*p.base_price) as value
from products p 
left join inventory i on p.product_id=i.product_id
where i.quantity > 400
union all
select 'High Value' as source_category,p.product_name,i.quantity,sum(i.quantity*p.base_price) as value
from products p 
left join inventory i on p.product_id=i.product_id
group by p.product_name
having value > 10000;

-- Comments:
-- In the above query I have used the UNION ALL operator to combine the results of the three SELECT statements. I have used the
-- SELECT statement to select the columns source_category, product_name, quantity and value. I have used the LEFT JOIN clause to join
-- the products and inventory table on product_id. I have used the WHERE clause to filter the records where quantity = 0, 
-- quantity > 400.For High Value source_category I have used the GROUP BY clause to group the records by product_name and then used 
-- the HAVING clause to filter the records where value > 10000.