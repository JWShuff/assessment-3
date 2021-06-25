-- Seed data goes here

--Categories:
insert into categories(name, description)
values ('Office', 'All the easily misplaced office supplies you need to replace!');

insert into categories(name, description)
values ('Home', 'More difficult to steal, but still purloinable, durable goods');

insert into categories(name, description)
values ('Kitchen', 'Risky theft opportunities given the usually armed status of the occupants.');

insert into categories(name, description)
values ('Bed and Bath', 'Like taking candy from the defenseless, because they are.');

-- Addresses:
INSERT INTO addresses (line_1, line_2, city, state, zip) 
VALUES ('6500 S. Webster Ave.', 'Unit 5', 'Oakland', 'CA', '94605' );

INSERT INTO addresses (line_1, line_2, city, state, zip) 
VALUES ('9 Endrus Rd.', 'Unit 2', 'Wasaga Beach', 'or', '97420');

INSERT INTO addresses (line_1, city, state, zip) 
VALUES ('45 S. Main St.', 'Houston', 'TX', '78453');

-- Products - Office
insert into products(name, description, category_id)
values ('Black Pen', 'The easiest to steal ubiquitous black pen.', 1);

insert into products(name, description, category_id)
values ('Paper Clip', 'No one notices it has gone, but it has low value', 1);

insert into products(name, description, category_id)
values ('Ream of Paper', 'Hard to steal, and can be used as a weapon. Careful.', 1);

-- Products - Home
insert into products(name, description, category_id)
values ('Badly Designed Rug', 'The art style of this rug is a crime against god, proceed with caution.', 2);

insert into products(name, description, category_id)
values ('Lamp', 'We all love lamp here.', 2);

insert into products(name, description, category_id)
values ('Throw Pillow', 'Someone is convinced we need more of these.', 2);

-- Products - Kitchen
insert into products(name, description, category_id)
values ('Blender', 'Will it blend?', 3);

insert into products(name, description, category_id)
values ('Knife', 'You pay for the whole thing, but only need the edge.', 3);

insert into products(name, description, category_id)
values ('Collins Glass', 'I think you can drink water from it.', 3);

-- Products - Bed and Bath
insert into products(name, description, category_id)
values ('Bathmat', 'To prevent slipping.', 4);

insert into products(name, description, category_id)
values ('Towel', 'To prevent dampness.', 4);

insert into products(name, description, category_id)
values ('Mirror', 'To introspect.', 4);

-- Orders
insert into orders (date_placed, address_id)
values ('2020-12-31', 1); 

insert into orders (date_placed, address_id)
values ('2020-01-10', 2);

insert into orders (date_placed, address_id)
values ('2020-10-30', 3);

insert into orders (date_placed, address_id)
values ('2019-07-26', 1);
insert into orders (date_placed, address_id)
values ('2019-07-26', 2); 
insert into orders (date_placed, address_id)
values ('2019-07-26', 3);

insert into orders (date_placed, address_id)
values ('2021-05-26', 1);
insert into orders (date_placed, address_id)
values ('2021-05-26', 2);
insert into orders (date_placed, address_id)
values ('2021-05-26', 3);

--Customers
INSERT INTO customers (first_name, last_name, email, address_id) 
VALUES ('Tim', 'Shuff', 'nottimshuff@gmail.com', 1);

INSERT INTO customers (first_name, last_name, email, address_id)
VALUES ('Hiram', 'Felton', 'Gamefuel@outlook.com', 2);

INSERT INTO customers (first_name, last_name, email, address_id)
VALUES ('Rosalynd', 'Bricker', 'Lexishin@hotmail.com', 3);

-- Orders/Customers Join
insert into orders_customers (order_id, customer_id)
values (1, 1);
insert into orders_customers (order_id, customer_id)
values (2, 2);
insert into orders_customers (order_id, customer_id)
values (3, 3);

insert into orders_customers (order_id, customer_id)
values (4, 1);
insert into orders_customers (order_id, customer_id)
values (5, 2);
insert into orders_customers (order_id, customer_id)
values (6, 3);

insert into orders_customers (order_id, customer_id)
values (7,1);
insert into orders_customers (order_id, customer_id)
values (8,2);
insert into orders_customers (order_id, customer_id)
values (9,3);

-- Orders/Products Join
insert into orders_products(product_id, order_id)
values(1,1);
insert into orders_products(product_id, order_id)
values(4, 1);
insert into orders_products(product_id, order_id)
values(7, 1);
insert into orders_products(product_id, order_id)
values(10, 1);

insert into orders_products(product_id, order_id)
values(2, 2);
insert into orders_products(product_id, order_id)
values(5, 2);
insert into orders_products(product_id, order_id)
values(8, 2);
insert into orders_products(product_id, order_id)
values(11, 2);

insert into orders_products(product_id, order_id)
values(3, 3);
insert into orders_products(product_id, order_id)
values(6, 3);
insert into orders_products(product_id, order_id)
values(9, 3);
insert into orders_products(product_id, order_id)
values(12,3);