-- Seed data goes here

--Categories:
insert into categories(name, description)
values ('Office', 'All the easily misplaced office supplies you need to replace!');

-- Addresses:
INSERT INTO addresses (id, line_1, line_2, city, state, zip) 
VALUES (1, '6500 S. Webster Ave.', 'Unit 5', 'Oakland', 'CA', '94605' );

INSERT INTO addresses (id, line_1, line_2, city, state, zip) 
VALUES (2, '9 Endrus Rd.', 'Unit 2', 'Wasaga Beach', 'or', '97420');

INSERT INTO addresses (id, line_1, city, state, zip) 
VALUES (3, '45 S. Main St.', 'Houston', 'TX', '78453');

-- Products
insert into products(name, description, category_id)
values ('Black Pen', 'The easiest to steal ubiquitous black pen.', 1);

-- Orders
insert into orders (date_placed, product_id, address_id)
values ();

--Customers

-- Orders/Customers Join
