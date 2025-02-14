-- ## Question 3 (SEMI JOIN)
-- Find all suppliers who supply products that have current inventory levels below 100 units in any warehouse. Show supplier name, 
-- country, and reliability score. Order by reliability score descending.

-- Expected Output:
-- ```
-- supplier_name      | country     | reliability_score
-- ------------------|-------------|------------------
-- FitLife Supplies  | USA         | 4.90
-- TechPro Solutions | USA         | 4.80
-- SmartHome Devices | South Korea | 4.50

select distinct s.supplier_name,s.country,s.reliability_score
    from suppliers s
    Where exists(
        select 1
        from inventory i 
        where i.quantity<100 and i.supplier_id = s.supplier_id)
        order by s.reliability_score desc;

-- Comments:
-- I used EXIST clause to check the availbilty of products with inventory levels below 100 and then joined the suppliers table 
-- with inventory table using supplier_id to get the desired output as supplier_name, country and reliability
-- score of suppliers and then used ORDER BY to sort based on reliability_score.
