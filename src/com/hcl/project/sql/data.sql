create database surabi_billing_system;

-- drop database surabi_billing_system;

use surabi_billing_system;

create table roles (
	id int not null primary key,
    name varchar(255) not null
);

insert into roles (id, name) values (1, 'ROLE_ADMIN'), (2, 'ROLE_CUSTOMER');

create table users (
	id int not null primary key auto_increment,
    userName varchar(255) not null,
    password varchar(255) not null,
    roleId int not null,
    foreign key (roleId) references roles(id)
);

create table items (
	id int not null primary key auto_increment,
    name varchar(255) not null,
    price decimal(6,2) not null
);

create table menu (
	id int not null primary key auto_increment,
    name varchar(255) not null
);

create table menu_details (
	id int not null primary key auto_increment,
    menuId int not null, 
    itemId int not null,
    foreign key (menuId) references menu(id),
    foreign key (itemId) references items(id)
);

create table orders (
	id int not null primary key auto_increment,
    quantity int not null,
    totalPrice decimal(6,2) not null,
    status varchar(255) not null,
    orderDate date not null, 
    userId int not null,
    foreign key (userId) references users(id)
);

create table order_details (
	id int not null primary key auto_increment,
    orderId int not null,
    itemId int not null,
    numberOfPlates int not null,
    foreign key (orderId) references orders(id),
    foreign key (itemId) references items(id)
);

INSERT INTO items (name, price) VALUES ('Pasta', 1.09);
INSERT INTO items (name, price) VALUES ('French Fries', 1.89);
INSERT INTO items (name, price) VALUES ('Ice Cream', 1.45);
INSERT INTO items (name, price) VALUES ('Bread', 2.50);
INSERT INTO items (name, price) VALUES ('Fried Rice', 3.28);
INSERT INTO items (name, price) VALUES ('Pancakes', 2.18);
INSERT INTO items (name, price) VALUES ('Burger', 4.89);
INSERT INTO items (name, price) VALUES ('Pizza', 7.25);
INSERT INTO items (name, price) VALUES ('Pumpkin Pie', 3.98);
INSERT INTO items (name, price) VALUES ('Chicken Pot Pie', 2.48);
INSERT INTO items (name, price) VALUES ('Apple Pie', 3.05);
INSERT INTO items (name, price) VALUES ('Banana', 0.62);
INSERT INTO items (name, price) VALUES ('Salad', 2.98);
INSERT INTO items (name, price) VALUES ('Ribs', 5.17);
INSERT INTO items (name, price) VALUES ('Hot Dogs', 3.67);

-- NSERT INTO users (`id`,`userName`,`password`,`roleId`) VALUES (1,'admin','',1);
-- INSERT INTO users (`id`,`userName`,`password`,`roleId`) VALUES (2,'trinh','123',2);
-- INSERT INTO users (`id`,`userName`,`password`,`roleId`) VALUES (3,'hieu','000',2);

-- INSERT INTO orders (`id`,`quantity`,`totalPrice`,`status`,`orderDate`,`userId`) VALUES (1,2,12.10,'Processing','2022-03-01',2);
-- INSERT INTO orders (`id`,`quantity`,`totalPrice`,`status`,`orderDate`,`userId`) VALUES (2,2,46.34,'Processing','2022-03-02',3);
-- INSERT INTO orders (`id`,`quantity`,`totalPrice`,`status`,`orderDate`,`userId`) VALUES (3,1,17.01,'Processing','2022-03-02',3);

-- INSERT INTO order_details (`id`,`orderId`,`itemId`,`numberOfPlates`) VALUES (1,1,10,4);
-- INSERT INTO order_details (`id`,`orderId`,`itemId`,`numberOfPlates`) VALUES (2,1,6,1);
-- INSERT INTO order_details (`id`,`orderId`,`itemId`,`numberOfPlates`) VALUES (3,2,3,10);
-- INSERT INTO order_details (`id`,`orderId`,`itemId`,`numberOfPlates`) VALUES (4,2,9,8);
-- INSERT INTO order_details (`id`,`orderId`,`itemId`,`numberOfPlates`) VALUES (5,3,2,9);

-- INSERT INTO menu (`id`,`name`) VALUES (1,'Breakfast');
-- INSERT INTO menu (`id`,`name`) VALUES (2,'Lunch');
-- INSERT INTO menu (`id`,`name`) VALUES (3,'Dinner');

-- INSERT INTO menu_details (`id`,`menuId`,`itemId`) VALUES (1,1,5);
-- INSERT INTO menu_details (`id`,`menuId`,`itemId`) VALUES (2,2,9);
-- INSERT INTO menu_details (`id`,`menuId`,`itemId`) VALUES (3,2,10);
-- INSERT INTO menu_details (`id`,`menuId`,`itemId`) VALUES (4,3,11);
-- INSERT INTO menu_details (`id`,`menuId`,`itemId`) VALUES (5,3,6);
-- INSERT INTO menu_details (`id`,`menuId`,`itemId`) VALUES (6,3,2);

select * from users;

select * from items;

select * from order_details;

select * from roles;

select * from menu;

select * from menu_details;