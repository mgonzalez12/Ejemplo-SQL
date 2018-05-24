
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


SELECT c.nombre AS cliente, e.nombre AS empleado, p.id_pedido FROM cliente c LEFT OUTER JOIN pedido p USING(id_cliente) FULL OUTER JOIN empleado e USING (id_empleado);
SELECT c.nombre as cliente, e.nombre as empleado, p.id_pedido FROM clientes c FULL OUTER JOIN (pedidos p RIGHT OUTER JOIN empleados e USING (id_empleado)) USING(id_cliente);

SELECT id_producto,descripcion FROM producto WHERE descripcion LIKE 'P%' AND descripcion ILIKE '%As' AND descripcion ILIKE '%TA%';


SELECT pro.id_producto, pro.descripcion AS producto, dp.cantidad AS cantidad_pedida 
  FROM pedido p INNER JOIN cliente c using (id_cliente) 
  INNER JOIN detalles_pedido dp using(id_pedido) 
  INNER JOIN producto pro using (id_producto) 
  WHERE c.nombre = 'PEPE';
  
  SELECT id_producto, descripcion 
    FROM producto 
    WHERE id_producto NOT IN( SELECT id_producto 
    FROM cliente c INNER JOIN pedido p USING (id_cliente) 
    INNER JOIN detalles_pedido dp USING(id_pedido) 
    WHERE c.nombre = 'PEPE');
    
    
    SELECT id_producto,descripcion FROM producto WHERE precio > ANY ( SELECT precio FROM cliente c INNER JOIN pedido p USING (id_cliente) INNER JOIN detalles_pedido dp USING (id_pedido) INNER JOIN producto pro USING (id_producto) WHERE c.nombre = 'PEPE');
    
    SELECT id_producto,descripcion FROM producto WHERE precio > ( SELECT MIN(precio) FROM cliente c INNER JOIN pedido p USING (id_cliente) INNER JOIN detalles_pedido dp USING (id_pedido) INNER JOIN producto pro USING (id_producto) WHERE c.nombre = 'PEPE');
    
    SELECT id_pedido, fecha_pedido 
      FROM pedidos p WHERE NOT EXISTS ( SELECT * FROM detalles_pedido dp WHERE p.id_pedido=dp.id_pedido);
      
      SELECT nombre FROM empleado WHERE ciudad = 'MIERES' UNION SELECT nombre FROM cliente WHERE ciudad ='MIERES';
      
      SELECT ciudad FROM empleado EXCEPT SELECT ciudad FROM cliente;
      
      SELECT id_producto, descripcion 
        FROM producto EXCEPT SELECT pro.id_producto,pro.descripcion 
        FROM pedido p inner join cliente c USING (id_cliente) 
        INNER JOIN detalles_pedido dp USING(id_pedido) 
        INNER JOIN producto pro USING (id_producto) WHERE c.nombre LIKE 'PEPE';
        
        SELECT nombre 
          FROM cliente c1 WHERE NOT EXISTS ( SELECT id_producto --B: productos pedidos por PEPE FROM cliente c2 inner join pedido p using (id_cliente) INNER JOIN detalles_pedido dp using (id_pedido) WHERE c2.nombre = 'PEPE' EXCEPT SELECT id_producto --A: productos pedidos por cada cliente c1 FROM pedido p inner join detalles_pedido dp USING (id_pedido ) WHERE p.id_cliente = c1.id_cliente);
      
      
  
  
