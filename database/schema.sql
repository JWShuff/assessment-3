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

create table orders (
    id serial primary key,
    date_placed date NOT NULL,
    product_id integer not null, --fk to products.id ordered
    customer_id integer not null, --fk to customers.id
    address_id integer not null
);

create table products (
    id serial primary key,
    name varchar(20) NOT NULL,
    description varchar(255) NOT NULL,
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
    order_id integer null, --fk to orders.id
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

ALTER TABLE orders
    ADD CONSTRAINT fk_orders_product_id 
    FOREIGN KEY(product_id) 
    REFERENCES products (id);
ALTER TABLE orders
    ADD CONSTRAINT fk_orders_customer_id
    FOREIGN KEY(customer_id) 
    REFERENCES customers (id);
ALTER TABLE orders
    ADD CONSTRAINT fk_orders_address_id 
    FOREIGN KEY(address_id) 
    REFERENCES addresses (id);
ALTER TABLE products
    ADD CONSTRAINT fk_products_category_id 
    FOREIGN KEY(category_id) 
    REFERENCES categories (id);
ALTER TABLE customers
    ADD CONSTRAINT fk_customers_order_id 
    FOREIGN KEY(order_id) 
    REFERENCES orders (id);
ALTER TABLE customers
    ADD CONSTRAINT fk_customers_address_id 
    FOREIGN KEY(address_id) 
    REFERENCES addresses (id);

