create database b3;
use b3;


create table customers (
    customer_id int primary key auto_increment,
    name varchar(100) not null,
    email varchar(100) not null unique
);

create table orders (
    order_id int primary key auto_increment,
    order_date datetime default current_timestamp,
    total_amount decimal(10,2) not null check (total_amount >= 0),
    customer_id int not null,
    foreign key (customer_id) references customers(customer_id)
);