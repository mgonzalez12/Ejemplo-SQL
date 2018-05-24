CREATE DATABASE ventas;

USE ventas;

CREATE TABLE clientes (
  id_cliente int not null,
  rifc varchar (15) NOT NULL,
  nombres varchar(40) default NULL,
  apellidos varchar(40) default NULL,
  telefono varchar(20) default NULL,
  direccion varchar(40) default NULL,
  PRIMARY KEY  (id_cliente)
);

CREATE TABLE vendedores (
  id_vendedor int not null,
  nombres varchar(40) default NULL,
  apellidos varchar(40) default NULL,
  PRIMARY KEY  (id_vendedor)
);

CREATE TABLE productos (
  id_producto int not null,
  descripcion varchar(40) default NULL,
  precio float default 0.0,
  stock int default 0,
  PRIMARY KEY  (id_producto)
);

CREATE TABLE facturas (
  id_factura int not null,
  id_cliente int not null,
  id_vendedor int not null, 
  precio double,
  stock int default 0,
  PRIMARY KEY  (id_factura),
  CONSTRAINT cliente_fk FOREIGN KEY (id_cliente)
  REFERENCES clientes (id_cliente),
  CONSTRAINT vendedor_fk FOREIGN KEY (id_vendedor)
  REFERENCES vendedores (id_vendedor)
);

CREATE TABLE detalles (
  id_factura int not null,
  id_producto int not null,
  cantidad int default 0,
  precio double,
  subtotal double,
  PRIMARY KEY  (id_factura,id_producto),
  CONSTRAINT fact_fk FOREIGN KEY (id_factura)
  REFERENCES facturas (id_factura),
  CONSTRAINT prod_fk FOREIGN KEY (id_producto)
  REFERENCES productos (id_producto)
);