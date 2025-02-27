create database AmazonDB;
use AmazonDB;
create table users(user_id int auto_increment primary key,
				   user_name varchar(100) not null,
                   email_id varchar(150) unique not null,
                   registered_date date not null,
                   membership enum('Basic','Prime') default 'Basic');
insert into users(user_name,email_id,registered_date,membership) values
				 ('Alice Johnson', 'alice.j@example.com', '2024-01-15', 'Prime'),
                 ('Bob Smith', 'bob.s@example.com', '2024-02-01', 'Basic'),
                 ('Charlie Brown', 'charlie.b@example.com', '2024-03-10', 'Prime'),
				 ('Daisy Ridley', 'daisy.r@example.com', '2024-04-12', 'Basic');
create table products(product_id int auto_increment primary key,
					 prod_name varchar(200) not null,
                     price decimal(10,2) not null,
                     category varchar(100) not null,
                     stock int not null);
insert into products(prod_name, price,category,stock) values
					('Echo Dot', 49.99, 'Electronics', 120),
                    ('Kindle Paperwhite', 129.99, 'Books', 50),
					('Fire Stick', 39.99, 'Electronics', 80),
					('Yoga Mat', 19.99, 'Fitness', 200),
					('Wireless Mouse', 24.99, 'Electronics', 150);
create table orders(order_id int auto_increment primary key,
				    user_id int,
                    order_date date not null,
                    total_amount decimal(10,2) not null,
                    foreign key (user_id) references users(user_id));
insert into orders(user_id,order_date,total_amount) values
				  (1, '2024-05-01', 79.98),
				  (2, '2024-05-03', 129.99),
	              (1, '2024-05-04', 49.99),
                  (3, '2024-05-05', 24.99);
create table orderdetails(order_details_id int auto_increment primary key,
					      order_id int,
                          product_id int,
                          quantity int not null,
                          foreign key (order_id) references orders(order_id),
                          foreign key (product_id) references products(product_id));
insert into orderdetails(order_id,product_id,quantity) values
						 (1, 1, 2),
						 (2, 2, 1),
						 (3, 1, 1),
						 (4, 5, 1);
select * from orderdetails;
delete from orderdetails;
set sql_safe_updates=0;
truncate table orderdetails;
select * from 