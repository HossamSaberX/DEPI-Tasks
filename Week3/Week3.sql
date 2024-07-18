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

--9. Find the number of orders placed by each customer.select o.customer_id, count(*) as total_orders from sales.orders ojoin sales.customers c on c.customer_id= o.customer_idgroup by o.customer_id--10. Get the total number of distinct products sold by each store.select sto.store_id, count(distinct oi.product_id) as distinct_soldfrom production.products pjoin sales.order_items oi on oi.product_id = p.product_idjoin sales.orders o on o.order_id = oi.order_idjoin sales.stores sto on sto.store_id = o.store_idgroup by sto.store_id-----------------------------Left Join-------------------------------1. List all products along with their categories. Include products that do not belong to
--   any category.select product_name, category_name from production.products p left join production.categories cat on cat.category_id = p.category_id--2. Find the total quantity of each product sold. Include products that have never been
--   soldselect p.product_id , sum(coalesce(oi.quantity, 0 )) as total_soldfrom production.products pleft join sales.order_items oi on oi.product_id = p.product_idgroup by p.product_idorder by total_sold--3. Retrieve the details of all orders along with the customer name. Include orders
--   placed by customers who are not yet registered.select order_id, order_date, order_status,concat(c.first_name, ' ', c.last_name) as customer_name from sales.orders oleft join sales.customers c on c.customer_id = o.customer_id--4. List all staff members along with the store they are assigned to. Include staff
--   members who are not currently assigned to any store.select concat(st.first_name, ' ', st.last_name) as staff_name, store_name from sales.staffs stleft join sales.stores sto on sto.store_id = st.store_id--5. Find the average rating of products in each category. Include categories that do not
--   have any products yet-- No ratings columns found--6. Get the list of all customers along with the total number of orders they have placed.
--   Include customers who have not placed any orders.select c.customer_id, case when count (o.order_id) > 0 then count(o.order_id) else 0 end as total_orders from sales.customers cleft join sales.orders o on o.customer_id = c.customer_idgroup by c.customer_id-----------------------------Self Join-------------------------------1. Retrieve the names of employees along with the names of their managers.select concat(st.first_name, ' ', st.last_name) emp_name,case when st.manager_id is null then 'No Manager' else concat(man.first_name, ' ', man.last_name) end  manager_namefrom sales.staffs stleft join sales.staffs man on man.staff_id= st.manager_id