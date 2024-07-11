use BikeStores

------------------------------------Select Queries------------------------------------

--1. Write a query to select all columns from the `products` table
select * from production.products

--2. Write a query to select the `product_name` and `list_price` from the`products` table.
select product_name, list_price from production.products

--3. Write a query to select the distinct `category_id` from the `products` table
select distinct category_id from production.products

--4. Write a query to select the `first_name` and `last_name` of customers from the `customers` table
select first_name, last_name from sales.customers

--5. Write a query to select the top 5 products with the highest `list_price` from the `products` table.
select top 5 * from production.products
order by list_price desc


------------------------------------Where Queries------------------------------------

--6. Write a query to select all products with a `list_price` greater than 100
select * from production.products
where list_price > 100

--7. Write a query to select all customers who live in the city 'New York'.
select * from sales.customers
where city = 'New York'

--8. Write a query to select all orders with an `order_status` of 1
select * from sales.orders
where order_status =1


------------------------------------Ordering Queries------------------------------------

--9. Write a query to select all products and order them by `list_price` in descending order
select * from production.products
order by list_price desc

--10. Write a query to select all customers and order them by `last_name` and then `first_name
select * from sales.customers
order by last_name, first_name


------------------------------------Grouping Queries------------------------------------

--11. Write a query to find the total `list_price` of all products grouped by `category_id
select category_id, sum(list_price) as Category_Sum from production.products
group by category_id

--12. Write a query to find the total number of orders grouped by `customer_id`.
select  customer_id , count(*) as orders_count from sales.orders
group by customer_id


------------------------------------Having Queries------------------------------------

--13. Write a query to find the total `list_price` of all products grouped by
--`category_id` and show only those categories with a total `list_price` greater
-- than 500.
select category_id, sum(list_price) from production.products
group by category_id
having SUM(list_price)> 500  


------------------------------------Insertions Queries------------------------------------

--14. Insert a new brand into the `brands` table with the name 'BrandX'.
INSERT INTO production.brands (brand_name)
VALUES ('BrandX');

--15. Insert a new category into the `categories` table with the name 'Electronics'.
INSERT INTO production.categories (category_name)
VALUES ('Electronics');

--16.
INSERT INTO sales.customers (first_name, last_name, phone, email, street, city, state, zip_code)
VALUES ('Alice', 'Johnson', '987-654-3210', 'alice.johnson@example.com', '456 Elm St', 'Othertown', 'TX', '54321');

--17. 
INSERT INTO sales.stores (store_name, phone, email, street, city, state, zip_code)
VALUES ('Tech Store', '555-123-4567', 'contact@techstore.com', '789 Tech Ave', 'Techville', 'CA', '67890');

--18.
INSERT INTO sales.staffs (first_name, last_name, email, phone, active, store_id, manager_id)
VALUES ('Bob', 'Smith', 'bob.smith@example.com', '555-987-6543', 1, 1, NULL);


------------------------------------Updates Queries------------------------------------

--19. Update the `list_price` of the product with `product_id` 1 to 119.99.
UPDATE production.products
SET list_price = 119.99
WHERE product_id = 1;

--20. Update the `email` of the customer with `customer_id` 2 to 'new.email@example.com'.
UPDATE sales.customers
SET email = 'new.email@example.com'
WHERE customer_id = 2;

--21. Update the `phone` number of the store with `store_id` 3 to '123-456-7890'.
UPDATE sales.stores
SET phone = '123-456-7890'
WHERE store_id = 3;

--22. Update the `category_name` of the category with `category_id` 2 to 'Home Appliances'.
UPDATE production.categories
SET category_name = 'Home Appliances'
WHERE category_id = 2;

--23. Update the `active` status of all staff members in store 1 to 0.
UPDATE sales.staffs
SET active = 0
WHERE store_id = 1;


------------------------------------Deletions Queries------------------------------------

--24. Delete the brand with `brand_id` 2 from the `brands` table
delete from production.brands
where brand_id = 2

--25. Delete the category with `category_id` 3 from the `categories` table
delete from production.categories
where category_id = 3

--26. Delete the customer with `customer_id` 4 from the `customers` table.
delete from sales.customers
where customer_id = 4

--27. Delete the store with `store_id` 5 from the `stores` table.
DELETE from sales.stores
WHERE store_id = 5;

--28. Delete the staff member with `staff_id` 6 from the `staffs` table.
delete from sales.orders
where staff_id = 6 

DELETE from sales.staffs
where staff_id = 6;

--29. Insert a new order into the `orders` table with the following details:
-- customer_id 1, order_status 1, order_date '2024-07-01', required_date
-- '2024-07-10', shipped_date NULL, store_id 1, staff_id 1.

insert into sales.orders (customer_id, order_status, order_date , required_date, shipped_date, store_id, staff_id)
values 
(
1, 1,'2024-07-01', '2024-07-10', NULL, 1, 1 
)

--30. Update the `shipped_date` of the order with `order_id` 1 to '2024-07-05'
update sales.orders
set shipped_date = '2024-07-05'
where order_id = 1

