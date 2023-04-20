create table Customer(
	customer_id SERIAL primary key,
	first_name Varchar(100),
	last_name Varchar(150),
	phone_number Varchar(150),
	billing_info Varchar(150)
);

create table Salesperson(
	salesperson_id SERIAL primary key,
	s_first_name Varchar(100),
	s_last_name Varchar(100),
	sales_total Varchar(100)
);

create table Car(
	car_id SERIAL primary key,
	foreign key(customer_id) references customer(customer_id),
	foreign key(salesperson_id) references salesperson(salesperson_id),
	car_price Varchar(100),
	make Varchar(150),
	model Varchar(150),
	year_made Integer
);

create table Invoice(
	invoice_id SERIAL primary key,
	foreign key(customer_id) references customer(customer_id),
	foreign key(salesperson_id) references salesperson(salesperson_id),
	cost_total Varchar(100)
);

create table Mechanic(
	mechanic_id SERIAL primary key,
	foreign key(car_id) references car(car_id),
	m_first_name Varchar(100),
	m_last_name Varchar(100)
);

create table Service Record(
	record_id SERIAL primary key,
	foreign key(car_id) references car(car_id),
	foreign key(mechanic_id) references mechanic(mechanic_id),
	parts_cost Varchar(100),
	service_cost Varchar(150)
);
