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
VALUES ('9 Endrus Rd.', 'Unit 2', 'Wasaga Beach', 'OR', '97420');

INSERT INTO addresses (line_1, city, state, zip) 
VALUES ('45 S. Main St.', 'Houston', 'TX', '78453');

insert into addresses (line_1, line_2, city, state, zip)
values('Rabbit Warren #30', 'C/O The Law Dogs', 'Albuequrque', 'NM', '00000');

-- Products - Office
insert into products(name, description, category_id, price)
values ('Black Pen', 'The easiest to steal ubiquitous black pen.', 1, 1.00);

insert into products(name, description, category_id, price)
values ('Paper Clip', 'No one notices it has gone, but it has low value', 1, .2);

insert into products(name, description, category_id, price)
values ('Ream of Paper', 'Hard to steal, and can be used as a weapon. Careful.', 1, 5.45);

-- Products - Home
insert into products(name, description, category_id, price)
values ('Badly Designed Rug', 'The art style of this rug is a crime against god, proceed with caution.', 2, 150.00);

insert into products(name, description, category_id, price)
values ('Lamp', 'We all love lamp here.', 2, 15.00);

insert into products(name, description, category_id, price)
values ('Throw Pillow', 'Someone is convinced we need more of these.', 2, 5.99);

-- Products - Kitchen
insert into products(name, description, category_id, price)
values ('Blender', 'Will it blend?', 3, 45.67);

insert into products(name, description, category_id, price)
values ('Knife', 'You pay for the whole thing, but only need the edge.', 3, 3.50);

insert into products(name, description, category_id, price)
values ('Collins Glass', 'I think you can drink water from it.', 3, 1.00);

-- Products - Bed and Bath
insert into products(name, description, category_id, price)
values ('Bathmat', 'To prevent slipping.', 4, 4.49);

insert into products(name, description, category_id, price)
values ('Towel', 'To prevent dampness.', 4, 10.00);

insert into products(name, description, category_id, price)
values ('Mirror', 'To introspect.', 4, 75.00);

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

insert into orders (date_placed, address_id)
values ('2021-05-26', 4);
insert into orders (date_placed, address_id)
values ('2021-05-26', 4);

--Customers
INSERT INTO customers (first_name, last_name, email, address_id) 
VALUES ('Tim', 'Shuff', 'nottimshuff@gmail.com', 1);

INSERT INTO customers (first_name, last_name, email, address_id)
VALUES ('Hiram', 'Felton', 'Gamefuel@outlook.com', 2);

INSERT INTO customers (first_name, last_name, email, address_id)
VALUES ('Rosalynd', 'Bricker', 'Lexishin@hotmail.com', 3);

INSERT INTO customers (first_name, last_name, email, address_id)
VALUES ('Gmail', 'Lover', 'AccountID1@gmail.com', 1);

insert into customers (first_name, last_name, email, address_id)
values ('Bugs', 'Bunny', 'WhoEvenOwnsThisIPAnyway@notwarner.com', 4);

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

insert into orders_customers (order_id, customer_id)
values (10, 5);

insert into orders_customers (order_id, customer_id)
values (11, 5);


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


insert into orders_products(product_id, order_id)
values(4, 10);
insert into orders_products(product_id, order_id)
values(5, 10);
insert into orders_products(product_id, order_id)
values(6, 10);
insert into orders_products(product_id, order_id)
values(1, 10);
insert into orders_products(product_id, order_id)
values(9, 10);

insert into orders_products(product_id, order_id)
values(2, 11);
insert into orders_products(product_id, order_id)
values(8, 11);
insert into orders_products(product_id, order_id)
values(4, 11);
insert into orders_products(product_id, order_id)
values(5, 11);
insert into orders_products(product_id, order_id)
values(1, 11);