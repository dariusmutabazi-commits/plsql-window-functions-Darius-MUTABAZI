INSERT INTO customers (customer_id, name, region) VALUES (1001, 'John Doe', 'Kigali');
INSERT INTO customers (customer_id, name, region) VALUES (1002, 'Amina Uwimana', 'Musanze');
INSERT INTO customers (customer_id, name, region) VALUES (1003, 'Pierre Nkurunziza', 'Huye');
INSERT INTO customers (customer_id, name, region) VALUES (1004, 'Fatima Kagabo', 'Kigali');
INSERT INTO customers (customer_id, name, region) VALUES (1005, 'Emmanuel Habimana', 'Musanze');

INSERT INTO products (product_id, name, category) VALUES (2001, 'Coffee Beans', 'Beverages');
INSERT INTO products (product_id, name, category) VALUES (2002, 'Banana Chips', 'Snacks');
INSERT INTO products (product_id, name, category) VALUES (2003, 'Notebook', 'Stationery');
INSERT INTO products (product_id, name, category) VALUES (2004, 'T-Shirt', 'Clothing');
INSERT INTO products (product_id, name, category) VALUES (2005, 'Bottled Water', 'Beverages');

INSERT INTO transactions (transaction_id, customer_id, product_id, sale_date, amount) VALUES (3001, 1001, 2001, TO_DATE('2024-01-15', 'YYYY-MM-DD'), 50000);
INSERT INTO transactions (transaction_id, customer_id, product_id, sale_date, amount) VALUES (3002, 1002, 2002, TO_DATE('2024-02-20', 'YYYY-MM-DD'), 25000);
INSERT INTO transactions (transaction_id, customer_id, product_id, sale_date, amount) VALUES (3003, 1003, 2003, TO_DATE('2024-03-10', 'YYYY-MM-DD'), 30000);
INSERT INTO transactions (transaction_id, customer_id, product_id, sale_date, amount) VALUES (3004, 1004, 2004, TO_DATE('2024-04-05', 'YYYY-MM-DD'), 45000);
INSERT INTO transactions (transaction_id, customer_id, product_id, sale_date, amount) VALUES (3005, 1005, 2005, TO_DATE('2024-05-25', 'YYYY-MM-DD'), 20000);
