-- ## Question 4 (CROSS JOIN)
-- Generate a report showing all possible product-warehouse combinations for 'Sports' category products and 
-- 'Large' type warehouses to help with expansion planning. Show product name, warehouse location, and warehouse capacity.

-- Expected Output:
-- ```
-- product_name  | location    | capacity
-- -------------|-------------|----------
-- Yoga Mat     | Dallas, TX  | 15000
-- Yoga Mat     | Chicago, IL | 20000
-- Yoga Mat     | Houston, TX | 16000
-- Running Shoes| Dallas, TX  | 15000
-- [...all combinations...]
-- ```

select p.product_name,w.location,w.capacity
from products p
cross join warehouses w
where p.category = 'Sports' and w.warehouse_type='Large';

-- Comments: 
-- I used CROSS JOIN to get all possible combinations between products and warehouses table to get product_name, location and capacity.
-- Then used WHERE clause to filter the results based on product category as 'Sports' and warehouse type as 'Large'