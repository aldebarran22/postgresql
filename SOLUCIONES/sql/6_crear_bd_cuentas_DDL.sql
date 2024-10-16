--create database cuenta;

create table accounts (
	user_id serial primary key,
	username varchar(50) unique not NULL,
	password varchar(50) not null,
	email varchar(255) unique not null,
	created_on timestamp not null,
	last_login timestamp
);


create table roles (
	role_id serial primary key,
	role_name varchar(255) unique not null
);


create table account_roles (
	role_id int not null,
	user_id int not null,
	grant_date timestamp,
	
	primary key(user_id, role_id),
	foreign key (role_id) references roles (role_id),
	foreign key (user_id) references accounts (user_id)
);

