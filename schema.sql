-- Customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(50)
);

-- Products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

-- Sales table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    sale_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Sales items table
CREATE TABLE sales_items (
    sales_item_id INT PRIMARY KEY,
    sale_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    total_price DECIMAL(10,2),
    FOREIGN KEY (sale_id) REFERENCES sales(sale_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Payments table
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    sale_id INT,
    payment_date DATE,
    amount DECIMAL(10,2),
    payment_method VARCHAR(20),
    FOREIGN KEY (sale_id) REFERENCES sales(sale_id)
);
Added database schema with primary and foreign keys
