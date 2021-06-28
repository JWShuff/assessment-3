-- Queries go here
\i schema.sql
\i seeds.sql

--   1. Retrieve the first name, last name, and email address of all customers that have a Gmail email address.

select first_name, last_name, email
from customers
where email ilike '%@gmail.com';
--   2. Retrieve the address of the customers and the order IDs for all orders that were placed in 2020
select C.first_name,
    C.last_name,
    A.line_1, A.line_2, A.city, A.state, A.zip, 
    O.id as "order id", 
    O.date_placed
from orders as O
    left join addresses as A on O.address_id = A.id
    left join orders_customers as ORDCUST on O.id = ORDCUST.order_id
    left join customers as C on C.id = ORDCUST.customer_id
where O.date_placed between '2020-01-01' and '2020-12-31';

--   3. Retrieve all product details for products that are under the "Kitchen" category
select P.name, 
    P.description, 
    C.name as "Category"
from products as P
left join categories as C on P.category_id = C.id
where C.name = 'Kitchen';

--   4. Retrieve the product names and prices of all products ordered by the customer with first name "Bugs" and last name "Bunny"

select P.name, P.price
from products as P
    left join orders_products as OP on P.id = OP.product_id
    left join orders_customers as OC on OP.order_id = OC.order_id
    left join customers as C on OC.customer_id = C.id
where C.first_name ilike 'bugs'
    AND C.last_name ilike 'bunny'; 