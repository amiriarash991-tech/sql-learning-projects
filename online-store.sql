create database onlinestore
go

use onlinestore
go

 
create table customers(
customerid int not null identity(1,1),
customername nvarchar(50),
Email nvarchar(100),
address nvarchar(100),
phone nvarchar(50)
 
constraint pk_customer primary key(customerid),
constraint uq_email unique(email)
);
go

create table categories(
categoryid int not null identity(1,1),
categoryname nvarchar(50) not null,
Description nvarchar(100),

constraint pk_category primary key(categoryid)
);
go

create table products(
productid int not null identity(1,1),
productname nvarchar(50),
Description nvarchar(100),
price decimal(10,2) not null,
unitsinstock int not null,
categoryid int not null,

constraint pk_product primary key(productid),
constraint fk_category foreign key  (categoryid) references categories(categoryid)
);
go


create table orders(
orderid int not null identity(1,1) primary key,
customerid int,
orderdate datetime not null,
shipaddress nvarchar(50),
totalamount money not null,

constraint fk_customer foreign key (customerid) references customers(customerid)
);
go


 create table OrderDetails(
 orderdetailsid int not null identity(1,1) primary key,
 orderid int not null,
 productid int not null,
 Quantity int not null,
 Unitprice decimal(10,2) not null,

 constraint fk_order foreign key (orderid) references orders(orderid),
 constraint fk_product foreign key(productid) references products(productid)
 );
 go

 create table payment(
 paymentid int identity(1,1) primary key,
 orderid int not null,
 paymentType nvarchar(50),
 paymentDate datetime,
 Amount decimal(10,2),

constraint fk_order foreign key(orderid)references orders(orderid)
);
go



