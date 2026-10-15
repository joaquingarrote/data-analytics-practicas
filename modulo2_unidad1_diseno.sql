
------------creacion base de datos-----------------
create database practicas;
use practicas;


------------creacion tabla cliente-----------------

create table clientes(
id_cliente int not null IDENTITY(1,1) PRIMARY KEY,
nombre varchar(100) not null,
perfil_bio varchar(500) not null,
fecha_registro date not null
);

-----------consulta tabla-------------------------

select * from clientes;

------------creacion tabla productos--------------

create table productos(
id_producto int not null identity (1,1) primary key,
descripcion varchar(255) not null,
precio decimal(10,2) not null,
esta_activo bit not null default 1
);

---------------------se uso bit en esta_activo para que devuelva true o false dependiendo el estado