insert into customer(
	customer_id,
	first_name,
	last_name,
	phone_number,
	billing_info
)values(
	3,
	'Joe',
	'Black',
	'111-223-4444',
	'1234-2323-2323'
);

insert into salesperson(
	salesperson_id,
	s_first_name,
	s_last_name,
	sales_total
)values(
	4,
	'Charles',
	'Barkley',
	'9000'
);

insert into car(
	car_id,
	customer_id,
	salesperson_id,
	car_price,
	make,
	model,
	year_made
)values(
	298876,
	4,
	3,
	'$80000',
	'Hyundai',
	'Palisade',
	2024
);

insert into invoice(
	invoice_id,
	customer_id,
	salesperson_id,
	cost_total
)values(
	5,
	3,
	4,
	'$9500'
);

insert into mechanic(
	mechanic_id,
	car_id,
	m_first_name,
	m_last_name
)values(
	23,
	323323,
	'Jack',
	'Sparrow'
);

insert into service record(
	record_id,
	car_id,
	mechanic_id,
	parts_cost,
	service_cost
) values(
	2,
	323323,
	4,
	'$100.50',
	'$25'
);


select * from invoice;

create or replace procedure tax(
	customer Integer,
	tax Decimal
)
language plpgsql
as $$
begin
	update cost_total
	set cost_total = cost_total + tax
	where customer_id = customer
	commit;
end;
$$
end

call tax();


create or replace function add_car(car_id Integer, customer_id Integer,	salesperson_id Integer, car_price Varchar, make Varchar, model Varchar, year_made Integer)
returns void
as $Main$
begin
	insert into car(car_id, customer_id, salesperson_id, car_price, make, model, year_made)
	values(_car_id, _customer_id, _salesperson_id, _car_price, _make, _model, _year_made)
end;
$Main$
language plpgsql;

select add_car(321123, 6, 1, '$70000', 'Kia', 'Sorrento', 2024);
select * from car;

