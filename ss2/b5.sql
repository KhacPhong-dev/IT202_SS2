create database b5;
use b5;

create table users (
    user_id int primary key auto_increment -- 1 anh bảo vệ PK
);

create table wallets (
    wallet_id int primary key auto_increment,
    user_id int not null unique,         -- 2 và 3 anh bảo vệ NOT NULL UNIQUE
    balance decimal(12,2) not null default 0, -- 4 anh bảo vệ DEFAULT
    foreign key (user_id) references users(user_id), -- 5 anh bảo vệ FK
    check (balance >= 0) -- 6 anh bảo vệ CHECK
);

create table transactions (
    transaction_id int primary key auto_increment,
    wallet_id int not null,
    type enum('deposit','withdraw','payment') not null,
    amount decimal(12,2) not null,
    status enum('pending','success','failed') default 'pending',
    created_at datetime default current_timestamp,
    foreign key (wallet_id) references wallets(wallet_id),
    check (amount > 0)
);
/*
5 lỗi người dùng có thể gây ra
nạp / thanh toán số tiền âm
một user tạo nhiều ví
giao dịch không rõ trạng thái (pending/failed…)
giao dịch không gắn với ví nào
số dư ví bị âm

*/