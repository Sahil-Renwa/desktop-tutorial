-- ## Question 18 (Role-Based Access Control)
-- Create a permission structure for an inventory management system with these roles:
-- - Inventory Manager: Full access to all tables
-- - Stock Clerk: Can view all tables, update inventory quantities
-- - Analyst: Can only view (SELECT) all tables
-- - Auditor: Can only view inventory and audit_log tables

-- Expected Output after running GRANT commands:
-- ```
-- Role              | Select | Insert | Update | Delete | References | Trigger
-- ------------------|---------|---------|---------|---------|------------|----------
-- inventory_manager | Yes    | Yes    | Yes    | Yes    | Yes       | Yes
-- stock_clerk      | Yes    | No     | Partial| No     | No        | No
-- analyst          | Yes    | No     | No     | No     | No        | No
-- auditor          | Partial| No     | No     | No     | No        | No

GRANT select, insert,update, delete ,references, trigger on inventory_management.* to 'inventory_manager';
GRANT select, update on inventory_management.* to 'stock_clerk  ';
GRANT select on inventory_management.* to 'analyst';
GRANT select on inventory_management.inventory, inventory_management.audit_log to 'auditor'; 

--Comments:
--In the above query, I have used the GRANT command to assign different permissions to different roles in the inventory management 
--system. I have granted full access to all tables in the inventory_management database to the inventory_manager role. 
--I have granted the permission to view and update inventory quantities to the stock_clerk role.
--I have granted the permission to view all tables to the analyst role. 
--I have granted the permission to view only the inventory and audit_log tables to the auditor role.