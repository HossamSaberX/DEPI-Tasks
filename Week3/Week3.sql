-----------------------------Inner Join-----------------------------
--1. List all products with their respective categories and brands.
select product_id, product_name, brand_name, category_name from production.products p
join production.brands b on b.brand_id = p.brand_id
join production.categories c on c.category_id = p.category_id

--2. Find the total quantity of each product sold.
select p.product_id, sum (oi.quantity) as sold from production.products p
join sales.order_items oi on oi.product_id = p.product_id
group by p.product_id

--3. Get the list of customers who have placed orders along with the store where they
-- placed the order.
select c.customer_id, concat(c.first_name, ' ', c.last_name) as fullName, s.store_name from sales.customers c 
join sales.orders o on c.customer_id = o. customer_id
join sales.stores s on s.store_id = o.store_id

--4. Find the total sales amount for each store.
select s.store_name, COUNT(*) as total_orders from sales.stores s 
join sales.orders o on o.store_id = s.store_id
group by s.store_name


select s.store_id, s.store_name, sum ((1-oi.discount)*(oi.list_price * oi.quantity)) as total_money
from sales.stores s 
join sales.orders o on o.store_id = s.store_id
join sales.order_items oi on oi.order_id = o.order_id
group by s.store_id, s.store_name

--5. Retrieve the details of orders along with the customer name, store name, and the
--   staff who processed the order
select order_id,
concat(c.first_name, ' ', c.last_name) as customer_name, store_name,
concat(sta.first_name, ' ', sta.last_name) as staff_name from sales.orders o
join sales.customers c on o.customer_id = c.customer_id
join sales.staffs sta on sta.staff_id = o.staff_id
join sales.stores sto on sto.store_id = o .store_id

--6. Get the list of products that have never been ordered.
select p.product_id, product_name from production.products p
full outer join sales.order_items oi on oi.product_id= p.product_id
where oi.order_id is NULL

--7. Find the average price of products in each category.
select cat.category_id, cat.category_name, avg(list_price) as avg_price
from production.products p
join production.categories cat on cat.category_id= p.category_id
group by cat.category_id, category_name

--8. List all products along with their current stock quantities.
select p.product_id, p.product_name, sum (coalesce(st.quantity, 0)) as stock
from production.products p 
left join production.stocks st on st.product_id = p.product_id
group by p.product_id, p.product_name
order by stock desc


--9. Find the number of orders placed by each customer.
--   any category.
--   sold
--   placed by customers who are not yet registered.
--   members who are not currently assigned to any store.
--   have any products yet
--   Include customers who have not placed any orders.