-- Schema creation goes here
--Your database should be designed to store customer,
-- product,
-- category,
-- and order information.We are going to ask you to complete the following three items:

drop table if exists customers cascade;
drop table if exists addresses cascade;
drop table if exists products cascade;
drop table if exists categories cascade;
drop table if exists orders cascade;
drop table if exists addresses cascade;
drop table if exists orders_customers cascade;
drop table if exists orders_products cascade;

create table orders (
    id serial primary key,
    date_placed date NOT NULL,
    address_id integer not null
);

create table products (
    id serial primary key,
    name varchar(20) NOT NULL,
    description varchar(255) NOT NULL,
    price numeric not null,
    category_id integer not null --fk to categories.id
);

create table categories (
    id serial primary key,
    name varchar(20) NOT NULL,
    description varchar(100) NOT NULL
);

create table customers (
    id serial primary key,
    first_name varchar(255),
    last_name varchar(255),
    email varchar(255) not null,
    address_id integer null --fk to addresses.id
);

create table addresses (
    id serial primary key,
    line_1 varchar(255) not null,
    line_2 varchar(255) null,
    city varchar(100),
    state varchar(20),
    zip varchar(10)
);

--orders/customer join table
create table orders_customers (
    id serial primary key,
    order_id integer not null, --fk to orders.id
    customer_id integer not null --fk to customers.id
);

--orders/products join table
create table orders_products (
    id serial primary key,
    order_id integer not null, --fk to orders.id
    product_id integer not null -- fk to products.id
);

ALTER TABLE orders_customers
    ADD CONSTRAINT fk_ordcust_customer_id
    FOREIGN KEY(customer_id) 
    REFERENCES customers (id);
ALTER TABLE orders_customers
    ADD CONSTRAINT fk_ordcust_order_id 
    FOREIGN KEY(order_id) 
    REFERENCES orders (id);
ALTER TABLE orders_products
    ADD CONSTRAINT fk_ordprod_order_id 
    FOREIGN KEY(order_id) 
    REFERENCES orders (id);
ALTER TABLE orders_products
    ADD CONSTRAINT fk_ordprod_product_id 
    FOREIGN KEY(product_id) 
    REFERENCES products (id);
ALTER TABLE orders
    ADD CONSTRAINT fk_orders_address_id 
    FOREIGN KEY(address_id) 
    REFERENCES addresses (id);
ALTER TABLE products
    ADD CONSTRAINT fk_products_category_id 
    FOREIGN KEY(category_id) 
    REFERENCES categories (id);
ALTER TABLE customers
    ADD CONSTRAINT fk_customers_address_id 
    FOREIGN KEY(address_id) 
    REFERENCES addresses (id);

