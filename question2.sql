-- ## Question 2 (INNER JOIN)
-- List all warehouses that store electronics products, along with the total quantity and total value of electronics inventory (quantity * base_price). Only include warehouses with electronics inventory worth over $20,000. Order by total value descending.

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