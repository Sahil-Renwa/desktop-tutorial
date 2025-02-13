Select p.product_name,p.category,i.quantity 
from Products p 
left join Inventory i on p.product_id=i.product_id
Where i.warehouse_id = 1  Order by i.quantity desc;