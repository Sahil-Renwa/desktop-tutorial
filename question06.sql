-- ## Question 6 (MERGE/UPSERT)
-- Using this temporary table structure and data:
-- ```sql
-- CREATE TEMP TABLE inventory_updates (
--     inventoryid INT,
--     productid INT,
--     warehouseid INT,
--     new_quantity INT,
--     lastupdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );

-- INSERT INTO inventory_updates VALUES
-- (1, 1, 1, 200, Current_Timestamp),  -- Update existing
-- (21, 20, 1, 100, Current_timestamp); -- Insert new
-- ```
-- Write a MERGE (UPSERT) query to update inventory quantities, inserting new records if they don't exist.

-- solution
-- Update existing records
UPDATE inventory
SET quantity = iu.new_quantity, last_updated = iu.lastupdated
FROM inventory_updates iu
WHERE inventory_id = iu.inventoryid and product_id = iu.productid AND warehouse_id = iu.warehouseid;

-- Comments:
-- The above query will update the exisitng reocrds in the inventory table using SET clause I have updated the quantity and 
-- last_updated columns with the new ones from the inventory_updates table. I have used the WHERE clause to match the records so that
-- the correct records are updated.

-- Inserting New records
INSERT INTO inventory (inventory_id, product_id, warehouse_id, quantity, last_updated)
SELECT iu.inventoryid, iu.productid, iu.warehouseid, iu.new_quantity, iu.lastupdated
FROM inventory_updates iu
where not exists(
  select 1 from inventory i
  where i.inventory_id=iu.inventoryid and i.product_id=iu.productid and i.warehouse_id=iu.warehouseid);

-- Comments:
-- The above query will insert the new records into the inventory table. I have used the SELECT statement to select the columns 
-- from the inventory_updates table and then used the WHERE clause to check if the records already exist in the inventory table.
-- If the records do not exist then the records are inserted into the inventory table.

-- Another Method
insert into inventory(inventory_id, product_id, warehouse_id, quantity, last_updated) 
select u_inventory_id, u_product_id, u_warehouse_id, new_quantity, u_last_updated 
from inventory_updates
on duplicate key update
    quantity = VALUES(quantity),
    last_updated = VALUES(last_updated);

-- Comments:
-- The above query will insert the records from the inventory_updates table into the inventory table. The ON DUPLICATE KEY UPDATE
-- clause is used to update the quantity and last_updated columns if there is a duplicate key conflict. The VALUES function is used
-- to get the new values from the inventory_updates table.