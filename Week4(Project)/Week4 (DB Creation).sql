create database Marketplace
go

use Marketplace


create table countries 
(
    countryid int primary key identity(1,1),
    countryname varchar(100) not null
);

create table users
(
	userid int primary key identity(1,1),
    username varchar(50) not null,
    email varchar(100) not null,
    passwordhash varchar(255) not null,
    [status] varchar(20) not null,
    addressline1 varchar(100),
    addressline2 varchar(100),
    city varchar(50),
    [state] varchar(50),
    postalcode varchar(20),
    countryid int,
    createdat datetime default getdate(),
    foreign key (countryid) references countries(countryid)
);

create table categories
(
    categoryid int primary key identity(1,1),
    categoryname varchar(50) not null,
    [description] text
);

create table items 
(
    itemid int primary key identity(1,1),
    sellerid int not null,
    categoryid int not null,
    title varchar(100) not null,
    description text,
    startingprice decimal(10,2) not null,
    currentprice decimal(10,2) not null,
    startdate datetime not null,
    enddate datetime not null,
    imageurl varchar(255),
    createdat datetime default getdate(),
    foreign key (sellerid) references users(userid),
    foreign key (categoryid) references categories(categoryid)
);

create table bids 
(
    bidid int primary key identity(1,1),
    itemid int not null,
    userid int not null,
    bidamount decimal(10,2) not null,
    bidtime datetime default getdate(),
    foreign key (itemid) references items(itemid),
    foreign key (userid) references users(userid)
);

create table orders 
(
    orderid int primary key identity(1,1),
    buyerid int not null,
    itemid int not null,
    orderdate datetime default getdate(),
    totalamount decimal(10,2) not null,
    foreign key (buyerid) references users(userid),
    foreign key (itemid) references items(itemid)
);

create table notifications 
(
    notificationid int primary key identity(1,1),
    userid int not null,
    message text not null,
    isread bit default 0,
    createdat datetime default getdate(),
    foreign key (userid) references users(userid)
);


