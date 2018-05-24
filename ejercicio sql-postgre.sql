
CREATE TABLE cliente(
  id_cliente int NOT NULL,
  rifc varchar (15) NOT NULL,
  nombres varchar (40) default NULL,
  apellido varchar (40) default NULL,
  telefono varchar (20) default NULL,
  direccion varchar (40) default NULL,
  PRIMARY KEY (id_cliente)
);

CREATE TABLE vendedores (
 id_vendedor int NOT NULL,
 nombres varchar (40) default NULL,
 apellido varchar (40) default NULL,
 PRIMARY KEY (id_vendedor)
);

CREATE TABLE productos(
 id_producto int NOT NULL,
 descripcion varchar(40) default NULL,
 precio float default 0.0,
 stock int default 0,
 PRIMARY KEY (id_producto)
);

CREATE TABLE facturas(
 id_factura int NOT NULL,
 id_cliente int NOT NULL,
 id_vendedor int NOT NULL,
 precio float,
 stock int default 0,
 PRIMARY KEY (id_factura),
 CONSTRAINT cliente_fk FOREIGN KEY (id_cliente)
 REFERENCES cliente(id_cliente),
 CONSTRAINT vendedor_fk FOREIGN KEY (id_vendedor)
 REFERENCES vendedores(id_vendedor)
);

CREATE TABLE detalles(
  id_factura int NOT NULL,
  id_producto int NOT NULL,
  cantidad int default 0,
  precio float,
  sudtotal float,
  PRIMARY KEY (id_factura,id_producto),
  CONSTRAINT fact_fk FOREIGN KEY (id_factura)
  REFERENCES facturas(id_factura),
  CONSTRAINT prod_fk FOREIGN KEY (id_producto)
  REFERENCES productos(id_producto)
);