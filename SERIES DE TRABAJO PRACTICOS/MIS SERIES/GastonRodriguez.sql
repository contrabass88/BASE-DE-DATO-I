CREATE DATABASE ventas_Productos;

GO
USE ventas_Productos;
GO

CREATE TABLE VENDEDOR
(
  CUIT INT NOT NULL,
  nombre VARCHAR(20) NOT NULL,
  apellido VARCHAR(20) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  email VARCHAR(50) NOT NULL,
  edad INT NOT NULL,
  CONSTRAINT PK_VENDEDOR_CUIT PRIMARY KEY (CUIT),
  CONSTRAINT UQ_VENDEDOR_email UNIQUE (email)

);

select @@version
CREATE TABLE CLIENTE
(
  DNI INT NOT NULL,
  nombre VARCHAR(20) NOT NULL,
  apellido VARCHAR(20) NOT NULL,
  domicilio VARCHAR(50) NOT NULL,
  ciudad VARCHAR(20) NOT NULL,
  email VARCHAR(20) NOT NULL,
  telefono NUMERIC(20),
  CONSTRAINT PK_CLIENTE_DNI PRIMARY KEY (DNI),
  CONSTRAINT UQ_CLIENTE_email UNIQUE (email),
  CONSTRAINT UQ_CLIENTE_TELE UNIQUE (telefono)
);

CREATE TABLE CATEGORIA
(
  nombre_categoria VARCHAR(50) NOT NULL,
  id_categoria INT NOT NULL,
  CONSTRAINT PK_CATEGORIA_id PRIMARY KEY (id_categoria)
);

CREATE TABLE STATUS_PUBLICACION
(
  fecha_publicacion DATE NOT NULL,
  estado_publicacion VARCHAR(20) NOT NULL,
  id_status INT NOT NULL,
  CONSTRAINT PK_STATUS_PUBLICACION_id PRIMARY KEY (id_status)
);

CREATE TABLE VENTA
(
  nro_venta INT NOT NULL,
  fecha_venta DATE NOT NULL,
  nro_factura INT NOT NULL,
  monto_total FLOAT NOT NULL,
  DNI INT NOT NULL,
  CONSTRAINT PK_VENTA_nro PRIMARY KEY (nro_venta),
  CONSTRAINT FK_VENTA_DNI FOREIGN KEY (DNI) REFERENCES CLIENTE(DNI)
);

CREATE TABLE PRODUCTO
(
  id_producto INT NOT NULL,
  nombre_producto VARCHAR(50) NOT NULL,
  descripcion_producto VARCHAR(50),
  precio FLOAT NOT NULL,
  CUIT INT NOT NULL,
  nro_venta INT NULL, 
  id_categoria INT NOT NULL,
  id_status INT NOT NULL,
  CONSTRAINT PK_PRODUCTO_id PRIMARY KEY (id_producto),
  CONSTRAINT FK_PRODUCTO_CUIT FOREIGN KEY (CUIT) REFERENCES VENDEDOR(CUIT),
  CONSTRAINT FK_PRODUCTO_nro_venta FOREIGN KEY (nro_venta) REFERENCES VENTA(nro_venta),
  CONSTRAINT FK_PRODUCTO_id_categoria FOREIGN KEY (id_categoria) REFERENCES CATEGORIA(id_categoria),
  CONSTRAINT FK_PRODUCTO_IS_STATUS FOREIGN KEY (id_status) REFERENCES STATUS_PUBLICACION(id_status)
);


CREATE TABLE METODO_PAGO
(
  tipo_pago VARCHAR(20) NOT NULL,
  monto FLOAT NOT NULL,
  id_metodo_pago INT NOT NULL,
  nro_venta INT NOT NULL,
  CONSTRAINT PK_METODO_PAGO_id PRIMARY KEY (id_metodo_pago),
  CONSTRAINT FK_METODO_PAGO_nro_venta FOREIGN KEY (nro_venta) REFERENCES VENTA(nro_venta)
);

CREATE TABLE RESENIA
(
  id_resenia INT NOT NULL,
  calificacion INT NOT NULL,
  comentarioa VARCHAR(50),
  nro_venta INT NOT NULL,
  CONSTRAINT PK_RESENIA_id PRIMARY KEY (id_resenia),
  CONSTRAINT FK_RESENIA_nro_venta FOREIGN KEY (nro_venta) REFERENCES VENTA(nro_venta)
);

CREATE TABLE MATERIAL_PRODUCTO
(
  nombre_material VARCHAR(50) NOT NULL,
  porcentaje_material FLOAT NOT NULL,
  id_material INT NOT NULL,
  id_producto INT NOT NULL,
  CONSTRAINT PK_MATERIAL_PRODUCTO_id PRIMARY KEY (id_material),
  CONSTRAInt FK_MATERIAL_PRODUCTO_id_producto FOREIGN KEY (id_producto) REFERENCES PRODUCTO		(id_producto)
);

CREATE TABLE DETALLE_VENTA
(
  cantidad INT NOT NULL,
  precio_unitario FLOAT NOT NULL,
  nro_venta INT NOT NULL,
  id_producto INT NOT NULL,
  id_resenia INT NULL, 
  CONSTRAINT FK_DETALLE_VENTA_nro_venta FOREIGN KEY (nro_venta) REFERENCES VENTA(nro_venta),
  CONSTRAINT FK_DETALLE_VENTA_id_prod FOREIGN KEY (id_producto) REFERENCES PRODUCTO(id_producto),
  CONSTRAINT FK_DETALLE_VENTA_id_resenia FOREIGN KEY (id_resenia) REFERENCES RESENIA(id_resenia)
);


--RESTRICCIONES--

ALTER TABLE STATUS_PUBLICACION
ADD CONSTRAINT CK_STATUS_PUBLICACION_ESTADO
CHECK (estado_publicacion IN ('ACTIVA', 'PAUSADA'));

ALTER TABLE STATUS_PUBLICACION
ADD CONSTRAINT DF_STATUS_PUBLICACION
DEFAULT GETDATE() FOR fecha_publicacion;

ALTER TABLE VENDEDOR
ADD CONSTRAINT CK_VENDEDOR_EDAD
CHECK (DATEDIFF(YEAR, fecha_nacimiento, GETDATE()) >= 18);

ALTER TABLE RESENIA
ADD CONSTRAINT CK_RESENIA_CALIFICACION
CHECK (calificacion BETWEEN 1 AND 10);


--LOTE DE DATOS -- 
-- Datos válidos para la tabla VENDEDOR
INSERT INTO VENDEDOR (CUIT, nombre, apellido, fecha_nacimiento, email, edad)
VALUES (20301234567, 'Juan', 'Pérez', '1985-06-15', 'juan.perez@mail.com', 39),
       (20123456789, 'María', 'Gómez', '1990-02-25', 'maria.gomez@mail.com', 34);

select * from VENDEDOR;

-- Datos válidos para la tabla CLIENTE
INSERT INTO CLIENTE (DNI, nombre, apellido, domicilio, ciudad, email, telefono)
VALUES (40123456, 'Carlos', 'López', 'Av. Siempre Viva 123', 'Buenos Aires', 'carlos.lopez@mail.com', 1134567890),
       (40234567, 'Ana', 'Martínez', 'Calle Falsa 456', 'Córdoba', 'ana.martinez@mail.com', 1123456789);

select * from CATEGORIA;

-- Datos válidos para la tabla CATEGORIA
INSERT INTO CATEGORIA (id_categoria, nombre_categoria)
VALUES (1, 'Ropa'), 
       (2, 'Accesorios');

select * from STATUS_PUBLICACION;

-- Datos válidos para la tabla STATUS_PUBLICACION
INSERT INTO STATUS_PUBLICACION (id_status, estado_publicacion, fecha_publicacion)
VALUES (1, 'ACTIVA', '2024-09-01'), 
       (2, 'PAUSADA', '2024-08-01');

select * from VENTA;

-- Datos válidos para la tabla VENTA
INSERT INTO VENTA (nro_venta, fecha_venta, nro_factura, monto_total, DNI)
VALUES (1, '2024-09-10', 1001, 1500.50, 40123456),
       (2, '2024-09-15', 1002, 2300.00, 40234567);



select * from PRODUCTO;

INSERT INTO PRODUCTO (id_producto, nombre_producto, descripcion_producto, precio, CUIT, id_categoria, id_status)
VALUES (1, 'Bikini Floral', 'Bikini de flores', 1500.50, 20301234567, 1, 1),
       (2, 'Pulsera Artesanal', 'Pulsera de hilo', 300.00, 20123456789, 2, 2);


INSERT INTO METODO_PAGO (id_metodo_pago, tipo_pago, monto, nro_venta)
VALUES (1, 'Tarjeta', 1500.50, 1),
       (2, 'Efectivo', 2300.00, 2);

select * from RESENIA;

INSERT INTO RESENIA (id_resenia, calificacion, comentarioa, nro_venta)
VALUES (1, 5, 'Excelente calidad', 1),
       (2, 3, 'Podría mejorar', 2);

select * from MATERIAL_PRODUCTO;


INSERT INTO MATERIAL_PRODUCTO (id_material, nombre_material, porcentaje_material, id_producto)
VALUES (1, 'Algodón', 80.0, 1),
       (2, 'Nylon', 50.0, 2);

	   select * from DETALLE_VENTA;


INSERT INTO DETALLE_VENTA (cantidad, precio_unitario, nro_venta, id_producto)
VALUES (2, 750.25, 1, 1),
       (1, 300.00, 2, 2);



INSERT INTO VENDEDOR (CUIT, nombre, apellido, fecha_nacimiento, email, edad)
VALUES (20234567890, 'Pedro', 'Rodríguez', '2010-07-25', 'pedro.rodriguez@mail.com', 14); -- Violación de CHECK en edad


INSERT INTO CLIENTE (DNI, nombre, apellido, domicilio, ciudad, email, telefono)
VALUES (40345678, 'Lucía', 'Fernández', 'Calle Falsa 789', 'Rosario', 'ana.martinez@mail.com', 1145678901); -- Email duplicado


INSERT INTO CATEGORIA (id_categoria, nombre_categoria)
VALUES (1, 'Electrónica'); 


INSERT INTO STATUS_PUBLICACION (id_status, estado_publicacion, fecha_publicacion)
VALUES (3, 'FINALIZADA', '2024-09-20'); 


INSERT INTO VENTA (nro_venta, fecha_venta, nro_factura, monto_total, DNI)
VALUES (3, '2024-09-20', 1003, 5000.00, 40987654); 


INSERT INTO PRODUCTO (id_producto, nombre_producto, descripcion_producto, precio, CUIT, id_categoria, id_status)
VALUES (3, 'Sombrero', 'Sombrero de playa', 500.00, 20987654321, 2, 1); 


INSERT INTO DETALLE_VENTA (cantidad, precio_unitario, nro_venta, id_producto)
VALUES (1, 500.00, 4, 1); 

