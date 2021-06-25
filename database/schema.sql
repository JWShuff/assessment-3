-- Schema creation goes here
--Your database should be designed to store customer,
-- product,
-- category,
-- and order information.We are going to ask you to complete the following three items:

drop table if exists customers cascade;

create table customers (
    id serial primary key,
    user_name varchar(255) not null,
    password varchar(255) not null,
    order_id integer null --fk to orders.id
);

drop table if exists products cascade;
create table products (
    id serial primary key,
    name varchar(20), NOT NULL
    description varchar(255) NOT NULL
    category_id integer not null --fk to categories.id
);

drop table if exists categories cascade;
create table categories (
    id serial primary key,
    name varchar(20) NOT NULL
);

drop table if exists orders cascade;
create table orders (
    id serial primary key,
    date_placed datetime NOT NULL,
    product_ordered integer not null --fk to products
);