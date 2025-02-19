-- ## Question 11 (COALESCE, NULLIF, LPAD/RPAD)
-- Create a report showing formatted product details with:
-- - Product code (LPAD with zeros to 5 digits)
-- - Product name (RPAD with dots to 30 characters)
-- - Current stock (COALESCE with 'Out of Stock')
-- - Stock status (NULLIF comparison with minimum threshold)
-- For all products in Electronics category.

-- Expected Output:
-- ```
-- product_code | formatted_name                | stock_level | status
-- -------------|------------------------------|-------------|--------
-- 00001        | Wireless Earbuds............| 150         | NORMAL
-- 00002        | Gaming Mouse................| Out of Stock| LOW
-- 00006        | Smart Watch................. | 175         | NULL
-- ```

select
    LPAD(p.product_id, 5, '0') as product_code,
    RPAD(p.product_name, 30, '.') as productname,
    coalesce(i.quantity, 'Out of Stock') as stock_level,
    Nullif(
        case
    	    when i.quantity BETWEEN 0 AND 100 then 'Low'
    	    when i.quantity between 101 and 400 then 'Normal'
    	    when i.quantity > 400 then 'High'
            else 'Empty'
        end,
        'Empty') as status
from products p 
join inventory i on p.product_id=i.product_id
where p.category = 'Electronics'
order by 1;

-- Comments:
-- In the above query I have used the LPAD function to left pad the product_id with zeros to 5 digits and RPAD function to right pad 
-- the product_name with dots to 30 characters. I have used the COALESCE function to replace the NULL values with 'Out of Stock'. 
-- I have used the NULLIF function to compare the stock level with the minimum threshold and return the status accordingly. I have used
-- the CASE statement to check the quantity and return the status based on the quantity. I have used the WHERE clause to filter the
-- records where the category is 'Electronics' and then used the ORDER BY clause to order the records by product_code.