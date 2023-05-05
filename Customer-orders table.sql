CREATE TABLE Customers (
    customer_id INT not null,
    customer_name VARCHAR(50) not null,
    address VARCHAR(50) not null,
    city VARCHAR(50) not null,
    country VARCHAR(50) not null,
    PRIMARY KEY(customer_id)
);

INSERT INTO Customers (customer_id, customer_name, address, city, country)
VALUES 
    (1, 'John Doe', '123 Main St', 'New York', 'USA'),
    (2, 'Alice Smith', '456 Elm St', 'Los Angeles', 'USA'),
    (3, 'Bob Johnson', '789 Oak St', 'Chicago', 'USA'),
    (4, 'David Lee', '234 Pine St', 'Houston', 'USA'),
    (5, 'Carol Wang', '567 Maple St', 'Miami', 'USA'),
    (6, 'Mary Jones', '890 Cedar St', 'Boston', 'USA'),
    (7, 'Peter Kim', '901 Walnut St', 'San Francisco', 'USA'),
    (8, 'Jessica Chen', '345 Cedar St', 'Seattle', 'USA'),
    (9, 'Tom Smith', '678 Walnut St', 'Philadelphia', 'USA'),
    (10, 'Alex Park', '123 Oak St', 'Washington D.C.', 'USA'),
    (11, 'Emma Davis', '234 Main St', 'New York', 'USA'),
    (12, 'Michael Brown', '567 Elm St', 'Los Angeles', 'USA'),
    (13, 'Sophia Wilson', '890 Oak St', 'Chicago', 'USA'),
    (14, 'Lucas Johnson', '123 Pine St', 'Houston', 'USA'),
    (15, 'Olivia Lee', '456 Maple St', 'Miami', 'USA'),
    (16, 'Ethan Wang', '789 Cedar St', 'Boston', 'USA'),
    (17, 'Chloe Jones', '901 Walnut St', 'San Francisco', 'USA'),
    (18, 'Aiden Kim', '345 Cedar St', 'Seattle', 'USA'),
    (19, 'Ava Smith', '678 Walnut St', 'Philadelphia', 'USA'),
    (20, 'Liam Park', '123 Oak St', 'Washington D.C.', 'USA');
    
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT not null,
    order_date DATE not null,
    product_type varchar(50) not null,
    quantity int not null,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
INSERT INTO Orders (order_id, customer_id, order_date, product_type, quantity)
VALUES
    (1, 5, '2023-05-05', 'shirt', 2),
    (2, 6, '2023-05-05', 'pants', 3),
    (3, 7, '2023-05-06', 'jacket', 1),
    (4, 8, '2023-05-07', 'shoes', 1),
    (5, 9, '2023-05-07', 'hat', 2),
    (6, 10, '2023-05-08', 'socks', 4),
    (7, 16, '2023-05-09', 'shirt', 1),
    (8, 17, '2023-05-10', 'pants', 2),
    (9, 18, '2023-05-10', 'jacket', 1),
    (10, 19, '2023-05-11', 'shoes', 2),
    (11, 20, '2023-05-12', 'hat', 1),
    (12, 15, '2023-05-13', 'socks', 3),
    (13, 14, '2023-05-14', 'shirt', 2),
    (14, 13, '2023-05-15', 'pants', 1),
    (15, 12, '2023-05-16', 'jacket', 1),
    (16, 1, '2023-05-17', 'shoes', 3),
    (17, 2, '2023-05-18', 'hat', 1),
    (18, 3, '2023-05-19', 'socks', 2),
    (19, 11, '2023-05-20', 'shirt', 2),
    (20, 4, '2023-05-20', 'pants', 1);
