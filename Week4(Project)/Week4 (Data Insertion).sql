--- Dummy Data Insertions using AI ---

-- Insert data into countries table
INSERT INTO countries (countryname) VALUES 
('United States'), ('Canada'), ('United Kingdom'), ('Germany'), ('France');

-- Insert data into users table
INSERT INTO users (username, email, passwordhash, status, addressline1, city, state, postalcode, countryid) VALUES 
('john_doe', 'john@example.com', 'hashed_password_1', 'active', '123 Main St', 'New York', 'NY', '10001', 1),
('jane_smith', 'jane@example.com', 'hashed_password_2', 'active', '456 Elm St', 'Toronto', 'ON', 'M5V 2H1', 2),
('mike_brown', 'mike@example.com', 'hashed_password_3', 'inactive', '789 Oak Rd', 'London', 'England', 'SW1A 1AA', 3),
('lisa_green', 'lisa@example.com', 'hashed_password_4', 'active', '321 Pine Ave', 'Berlin', 'Berlin', '10115', 4),
('alex_white', 'alex@example.com', 'hashed_password_5', 'active', '654 Maple Ln', 'Paris', 'Île-de-France', '75001', 5);

-- Insert data into categories table
INSERT INTO categories (categoryname, description) VALUES 
('Electronics', 'Gadgets, devices, and electronic equipment'),
('Clothing', 'Apparel and accessories for all ages'),
('Home & Garden', 'Items for home improvement and gardening'),
('Sports & Outdoors', 'Equipment and gear for various sports and outdoor activities'),
('Books', 'Fiction, non-fiction, and educational materials');

-- Insert data into items table
INSERT INTO items (sellerid, categoryid, title, description, startingprice, currentprice, startdate, enddate, imageurl) VALUES 
(1, 1, 'iPhone 12 Pro', 'Used iPhone 12 Pro in excellent condition', 500.00, 500.00, DATEADD(day, -5, GETDATE()), DATEADD(day, 5, GETDATE()), 'http://example.com/iphone12.jpg'),
(2, 2, 'Vintage Leather Jacket', 'Genuine leather jacket from the 80s', 150.00, 175.00, DATEADD(day, -3, GETDATE()), DATEADD(day, 7, GETDATE()), 'http://example.com/jacket.jpg'),
(3, 3, 'Garden Tool Set', 'Complete set of essential garden tools', 75.00, 80.00, DATEADD(day, -2, GETDATE()), DATEADD(day, 8, GETDATE()), 'http://example.com/gardentools.jpg'),
(4, 4, 'Mountain Bike', 'High-quality mountain bike, barely used', 300.00, 350.00, DATEADD(day, -1, GETDATE()), DATEADD(day, 9, GETDATE()), 'http://example.com/bike.jpg'),
(5, 5, 'Classic Novel Collection', 'Set of 10 classic novels in hardcover', 100.00, 100.00, DATEADD(day, 0, GETDATE()), DATEADD(day, 10, GETDATE()), 'http://example.com/books.jpg');

-- Insert data into bids table
INSERT INTO bids (itemid, userid, bidamount) VALUES 
(1, 2, 520.00),
(1, 3, 550.00),
(2, 4, 160.00),
(2, 5, 175.00),
(3, 1, 80.00);

-- Insert data into orders table
INSERT INTO orders (buyerid, itemid, totalamount) VALUES 
(3, 1, 550.00),
(5, 2, 175.00);

-- Insert data into notifications table
INSERT INTO notifications (userid, message) VALUES 
(1, 'Your item "iPhone 12 Pro" has been sold!'),
(2, 'Your item "Vintage Leather Jacket" has been sold!'),
(3, 'You won the auction for "iPhone 12 Pro"!'),
(4, 'You have been outbid on "Vintage Leather Jacket"'),
(5, 'You won the auction for "Vintage Leather Jacket"!');
