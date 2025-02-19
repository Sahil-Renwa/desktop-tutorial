*CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    base_price DECIMAL(10,2),
    weight_kg DECIMAL(5,2)
);
CREATE TABLE warehouses (
    warehouse_id INT PRIMARY KEY,
    location VARCHAR(100),
    capacity INT,
    warehouse_type VARCHAR(50)
);
CREATE TABLE inventory (
    inventory_id INT PRIMARY KEY,
    product_id INT,
    warehouse_id INT,
    quantity INT,
    last_updated TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
);

CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100),
    country VARCHAR(50),
    lead_time_days INT,
    reliability_score DECIMAL(3,2)
);

INSERT INTO products VALUES
(1, 'Wireless Earbuds', 'Electronics', 129.99, 0.2),
(2, 'Gaming Mouse', 'Electronics', 59.99, 0.3),
(3, 'Yoga Mat', 'Sports', 29.99, 1.0),
(4, 'Coffee Maker', 'Appliances', 89.99, 3.5),
(5, 'Running Shoes', 'Sports', 79.99, 0.8),
(6, 'Smart Watch', 'Electronics', 199.99, 0.15),
(7, 'Backpack', 'Fashion', 49.99, 0.9),
(8, 'Protein Powder', 'Health', 39.99, 2.2),
(9, 'Laptop Stand', 'Office', 29.99, 1.5),
(10, 'Water Bottle', 'Sports', 19.99, 0.4),
(11, 'Drawing Tablet', 'Electronics', 159.99, 0.7),
(12, 'Desk Chair', 'Furniture', 199.99, 12.0),
(13, 'Blender', 'Appliances', 69.99, 2.8),
(14, 'Dumbbell Set', 'Sports', 149.99, 20.0),
(15, 'Wireless Keyboard', 'Electronics', 79.99, 0.6),
(16, 'Air Purifier', 'Appliances', 149.99, 4.5),
(17, 'Hiking Boots', 'Sports', 129.99, 1.2),
(18, 'Security Camera', 'Electronics', 89.99, 0.3),
(19, 'Office Desk', 'Furniture', 299.99, 25.0),
(20, 'Tennis Racket', 'Sports', 59.99, 0.4);


INSERT INTO warehouses VALUES
(1, 'Seattle, WA', 10000, 'Standard'),
(2, 'Dallas, TX', 15000, 'Large'),
(3, 'Atlanta, GA', 12000, 'Standard'),
(4, 'Phoenix, AZ', 8000, 'Small'),
(5, 'Chicago, IL', 20000, 'Large'),
(6, 'Miami, FL', 9000, 'Standard'),
(7, 'Denver, CO', 11000, 'Standard'),
(8, 'Las Vegas, NV', 7000, 'Small'),
(9, 'Boston, MA', 13000, 'Standard'),
(10, 'Portland, OR', 10000, 'Standard'),
(11, 'Houston, TX', 16000, 'Large'),
(12, 'San Diego, CA', 9500, 'Standard'),
(13, 'Detroit, MI', 8500, 'Small'),
(14, 'Nashville, TN', 11500, 'Standard'),
(15, 'Sacramento, CA', 9000, 'Standard'),
(16, 'Kansas City, MO', 12500, 'Standard'),
(17, 'Columbus, OH', 10500, 'Standard'),
(18, 'San Antonio, TX', 13500, 'Standard'),
(19, 'Minneapolis, MN', 14000, 'Standard'),
(20, 'New Orleans, LA', 8000, 'Small');

INSERT INTO inventory VALUES
(1, 1, 1, 150, '2025-02-01 10:00:00'),
(2, 2, 1, 200, '2025-02-01 10:30:00'),
(3, 3, 2, 300, '2025-02-01 11:00:00'),
(4, 4, 2, 100, '2025-02-01 11:30:00'),
(5, 5, 3, 250, '2025-02-01 12:00:00'),
(6, 6, 3, 175, '2025-02-01 12:30:00'),
(7, 7, 4, 400, '2025-02-01 13:00:00'),
(8, 8, 4, 350, '2025-02-01 13:30:00'),
(9, 9, 5, 225, '2025-02-01 14:00:00'),
(10, 10, 5, 500, '2025-02-01 14:30:00'),
(11, 11, 6, 125, '2025-02-01 15:00:00'),
(12, 12, 6, 75, '2025-02-01 15:30:00'),
(13, 13, 7, 200, '2025-02-01 16:00:00'),
(14, 14, 7, 150, '2025-02-01 16:30:00'),
(15, 15, 8, 275, '2025-02-01 17:00:00'),
(16, 16, 8, 180, '2025-02-01 17:30:00'),
(17, 17, 9, 220, '2025-02-01 18:00:00'),
(18, 18, 9, 190, '2025-02-01 18:30:00'),
(19, 19, 10, 85, '2025-02-01 19:00:00'),
(20, 20, 10, 310, '2025-02-01 19:30:00');


INSERT INTO suppliers VALUES
(1, 'TechPro Solutions', 'USA', 3, 4.8),
(2, 'GlobalGear Manufacturing', 'China', 15, 4.2),
(3, 'SportEquip International', 'Vietnam', 10, 4.5),
(4, 'ElectroTech Industries', 'Taiwan', 12, 4.3),
(5, 'FitLife Supplies', 'USA', 4, 4.9),
(6, 'Smart Devices Co', 'South Korea', 8, 4.6),
(7, 'HomeStyle Products', 'Mexico', 6, 4.4),
(8, 'HealthPlus Corporation', 'Canada', 5, 4.7),
(9, 'Office Essentials Ltd', 'India', 14, 4.0),
(10, 'EcoFriendly Goods', 'Germany', 11, 4.5),
(11, 'Digital Dreams Inc', 'Japan', 9, 4.8),
(12, 'Comfort Living Co', 'Malaysia', 13, 4.2),
(13, 'PowerTools Plus', 'USA', 4, 4.6),
(14, 'FitPro Equipment', 'Thailand', 12, 4.3),
(15, 'TechnoWorld Systems', 'Singapore', 7, 4.7),
(16, 'Clean Air Solutions', 'USA', 3, 4.9),
(17, 'OutdoorPro Gear', 'Indonesia', 16, 4.1),
(18, 'SmartHome Devices', 'South Korea', 8, 4.5),
(19, 'WorkSpace Solutions', 'Taiwan', 11, 4.4),
(20, 'SportMaster Inc', 'Vietnam', 9, 4.6);