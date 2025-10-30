use restaurant;

create table tblTable(
	id int primary key auto_increment,
    type varchar(50) not null,
    available int not null,
    price float not null
);

create table tblCustomer(
	id int primary key auto_increment,
    name varchar(255) not null,
    phone varchar(255) not null,
    email varchar(255)
);

-- create table Membership(
-- );

create table tblReservation(
	id int primary key auto_increment,
    reservationTime date not null,
    type varchar(50) not null,
    checkin date,
    checkout date, 
    status int not null,
    tblTableId int not null,
    tblCustomerId int not null,
    foreign key (tblTableId) references tblTable(id),
    foreign key (tblCustomerId) references tblCustomer(id)
);

create table tblStaff(
	id int primary key auto_increment,
    username varchar(255) not null,
    password varchar(255) not null,
    name varchar(255) not null,
    phone varchar(255) not null,
    email varchar(255) not null
);

create table tblSaleStaff(
	tblStaffId int primary key,
	foreign key (tblStaffId) references tblStaff(id)
);

-- create table tblWarehouseStaff();

create table tblInvoice(
	id int primary key auto_increment,
    payTime date not null,
    tblReservationId int not null,
    tblSaleStaffId int not null,
    foreign key (tblReservationId) references tblReservation(id),
    foreign key (tblSaleStaffId) references tblSaleStaff(tblStaffId)
);

create table tblOrder(
	id int primary key auto_increment,
    note varchar(255),
    status int not null,
    type varchar(255) not null,
    tblReservationId int not null, 
    tblInvoiceId int,
    foreign key (tblReservationId) references tblReservation(id),
    foreign key (tblInvoiceId) references tblInvoice(id)
);

create table tblDish(
	id int primary key auto_increment,
    name varchar(255) not null,
    price float not null,
    description varchar(255)
);

create table tblCombo(
	id int primary key auto_increment,
    name varchar(255) not null,
    price float not null,
    description varchar(255)
);

create table tblDishOrder(
	id int primary key auto_increment,
    amount int not null,
    price float not null,
    tblDishId int,
    tblOrderId int,
    foreign key (tblDishId) references tblDish(id),
    foreign key (tblOrderId) references tblOrder(id)
);

create table tblComboOrder(
	id int primary key auto_increment,
    amount int not null,
    price float not null,
    tblComboId int,
    tblOrderId int,
    foreign key (tblComboId) references tblCombo(id),
    foreign key (tblOrderId) references tblOrder(id)
);

create table tblDishCombo(
	id int primary key auto_increment,
    amount int not null,
    tblDishId int,
    tblComboId int,
    foreign key (tblDishId) references tblDish(id),
    foreign key (tblComboId) references tblCombo(id)
);