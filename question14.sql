-- ## Question 14 (Single-Row and Multi-Row Subqueries)
-- Find products that meet ALL these conditions:
-- - Price higher than average category price (single-row subquery)
-- - Stocked in warehouses with >80% capacity utilization (multi-row subquery)
-- - Total inventory value higher than any Sports category product (multi-row subquery)

-- Expected Output:
-- ```
-- product_name    | category    | price  | total_value | warehouses
-- ----------------|------------|--------|-------------|------------
-- Gaming Mouse    | Electronics| 199.99 | 45000.50   | Seattle, Dallas
-- Smart Watch     | Electronics| 159.99 | 42500.75   | Chicago, Boston

select p.product_name,
		p.category,	
        p.base_price,
        (i.quantity*p.base_price) as total_value,
        Group_concat(w.location) as location
from products p 
join inventory i on p.product_id=i.product_id
join warehouses w on i.warehouse_id=w.warehouse_id
where p.base_price > (select avg(base_price) from products group by category having category=p.category)
and (i.quantity * p.base_price) > 
								(select max(sp) from 
													(select (i.quantity*p.base_price) as sp 
                                                         from products p
                                      					 join inventory i on p.product_id=i.product_id
 														 where p.category='Sports') as a)
and i.quantity > 0.8*w.capacity;

--Comments:
--In the above query, I have used a single-row subquery to find the average price of the products in the category and used it to 
--filter the products with a price higher than the average category price. I have used a multi-row subquery to find the total 
--inventory value of the products in the Sports category and used it to filter the products with a total inventory value higher than 
--any Sports category product. I have used a condition in WHERE clause to filter the products stocked in warehouses with more than 80%
--capacity utilization. I have used JOIN between products, inventory, and warehouses tables to get the desired output. I have used
--GROUP_CONCAT function to concatenate the warehouse locations for each product.	
