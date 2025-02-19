-- ## Question 16 (Self Join)
-- Find all pairs of products that:
-- - Are in the same category
-- - Have price difference < $20
-- - Are stocked in same warehouse
-- List them as potential substitute products.

-- Expected Output:
-- ```
-- category    | product1     | price1 | product2     | price2 | warehouse
-- ------------|-------------|---------|--------------|---------|----------
-- Electronics | Gaming Mouse | 59.99   | Keyboard    | 49.99   | Seattle
-- Sports      | Yoga Mat    | 29.99   | Water Bottle| 19.99   | Dallas
-- ```

select p1.category as category1, 
    p1.product_name as product1,
    p1.base_price as price1,
    p2.product_name as product2,
    p2.base_price as price2,
    w.location
from products p1 join products p2
join inventory i on p1.product_id=i.product_id
join warehouses w on i.warehouse_id=w.warehouse_id
where p1.product_id!=p2.product_id and p1.category=p2.category and abs(p1.base_price - p2.base_price) < 20;

-- Comments:
-- In the above query I have used the SELF JOIN to join the products table with itself. I have used the WHERE clause to filter the 
-- records where the product_id of the first product is not equal to the product_id of the second product, the category of the first
-- product is equal to the category of the second product and the absolute difference between the base_price of the first product and
-- the base_price of the second product is less than 20. I have used the JOIN clause to join the products and inventory table on
-- product_id and then joined the inventory and warehouses table on warehouse_id to get the location. 