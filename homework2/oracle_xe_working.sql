create table xx_warehouse
(Warehouse_id number primary key,
Warehouse_Name varchar2(300));

create table xx_items
(item_id number primary key,
description varchar2(500),
name varchar2(200),
weight number,
inventory_status varchar2(200),
sellable_status varchar2(200));

create table xx_address
(address_id number primary key,
street_name varchar2(300),
building_nr varchar2(200),
office_nr varchar2(200),
country varchar2(200),
city varchar2(200),
postal_code varchar2(200));

create table xx_availability
(warehouse_id number,
item_id number,
quantity number,

constraint fk_warehouse
foreign key(warehouse_id)
references xx_warehouse(warehouse_id),

constraint fk_item
foreign key(item_id)
references xx_items(item_id));

create table xx_customers
(customer_id number primary key,
customer_name varchar2(300),
account_number varchar2(400),
status varchar2(300),
address_id number,
e_mail varchar2(300),
phone_number number,

constraint fk_address
foreign key (address_id)
references xx_address(address_id));

create table xx_orders
(order_id number primary key,
order_number number,
customer_id number,
shipment_date date,
status varchar2(200),
total_amount number,
currency varchar2(200),
warehouse_id number,
order_date date,

constraint fk_customer
foreign key (customer_id)
references xx_customers(customer_id),

constraint fk_orders_warehouse
foreign key (warehouse_id)
references xx_warehouse (warehouse_id));

create table xx_order_lines
(line_id number primary key,
order_id number,
line_number number,
item_id number,
unit_price number,
quantity number,
status varchar2(200),
UOM varchar2(200),

constraint fk_order_lines_items
foreign key (item_id)
references xx_items (item_id),

constraint fk_order_lines_orders
foreign key (order_id)
references xx_orders (order_id)
);
