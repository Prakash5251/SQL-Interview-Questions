----------------------------------------------------------------------------------------------------------------------------------------------------------
-- Video URL: https://www.youtube.com/watch?v=y0oPrNhcYrU&ab_channel=DATAWITHDIVYANKA
-- Title: Meesho Data Analyst Interview SQL Question

-- Code Used: 
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20)
);
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);
CREATE TABLE Order_Items (
    item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    brand VARCHAR(50) NOT NULL,
    stock_quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);
CREATE TABLE Shipping_Info (
    shipping_id INT PRIMARY KEY,
    order_id INT,
    address VARCHAR(200) NOT NULL,
    city VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Insert sample customers data
INSERT INTO Customers (customer_id, first_name, last_name, email, phone)
VALUES
    (1, 'om', 'kapoor', 'om.k@example.com', '+1234567890'),
    (2, 'kiran' 'patil', 'ki.ran@example.com', '+9876543210'),
    (3, 'sid', 'jha', 'sid.jha@example.com', '+1112223334');

-- Insert sample products data
INSERT INTO Products (product_id, product_name, category, brand, stock_quantity, price)
VALUES
    (101, 'Product A', 'Electronics', 'Brand X', 50, 500),
    (102, 'Product B', 'Clothing', 'Brand Y', 100, 50),
    (103, 'Product C', 'Books', 'Brand Z', 30, 20);

-- Insert sample orders data
INSERT INTO Orders (order_id, customer_id, order_date, total_amount, status)
VALUES
    (1001, 1, '2023-07-01', 1000.00, 'completed'),
    (1002, 2, '2023-07-02', 150.50, 'completed'),
    (1003, 1, '2023-07-03', 300.25, 'completed'),
    (1004, 3, '2023-07-04', 75.80, 'completed');

-- Insert sample order items data
INSERT INTO Order_Items (item_id, order_id, product_id, quantity, unit_price)
VALUES
    (2001, 1001, 101, 2, 500),
    (2002, 1002, 102, 3, 50),
    (2003, 1002, 103, 1, 20),
    (2004, 1003, 101, 1, 500),
    (2005, 1003, 102, 1, 50),
    (2006, 1003, 103, 2, 20),
    (2007, 1004, 102, 2, 50);

-- Insert sample shipping info data
INSERT INTO Shipping_Info (shipping_id, order_id, address, city, country, postal_code)
VALUES
    (3001, 1001, '123 Main St', 'New York', 'USA', '10001'),
    (3002, 1002, '456 Oak Ave', 'Los Angeles', 'USA', '90001'),
    (3003, 1003, '789 Maple Rd', 'Chicago', 'USA', '60601'),
    (3004, 1004, '101 Pine Blvd', 'San Francisco', 'USA', '94101');


----------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------
