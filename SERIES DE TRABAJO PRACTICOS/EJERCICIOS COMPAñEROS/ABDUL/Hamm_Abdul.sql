--Hamm, Abdul

CREATE DATABASE Parcial_Hamm-Abdul;
GO
USE Parcial_Hamm-Abdul;
GO

CREATE TABLE Vendedor
(
  id_vendedor INT NOT NULL,
  nombre_vendedor VARCHAR(30) NOT NULL,
  apellido_vendedor VARCHAR(30) NOT NULL,
  cuit_vendedor VARCHAR(14) NOT NULL,
  fechaNac_vendedor DATE NOT NULL,
  email_vendedor INT NOT NULL,
  CONSTRAINT PK_Vendedor_id PRIMARY KEY (id_vendedor),
  CONSTRAINT UQ_Vendedor_cuit UNIQUE (cuit_vendedor),
  CONSTRAINT UQ_Vendedor_email UNIQUE (email_vendedor),
);

CREATE TABLE Categoria_Producto
(
  id_categoriaProducto INT NOT NULL,
  nombre_categoriaProduct VARCHAR(20) NOT NULL,
  CONSTRAINT PK_CategoriaProducto_id PRIMARY KEY (id_categoriaProducto)
);

CREATE TABLE Materiales
(
  id_materiales INT NOT NULL,
  nombre_matrial VARCHAR(30) NOT NULL,
  CONSTRAINT PK_Materiales_id PRIMARY KEY (id_materiales)
);

CREATE TABLE Cliente
(
  id_cliente INT NOT NULL,
  nombre_cliente VARCHAR(20) NOT NULL,
  apellido_cliente VARCHAR(20) NOT NULL,
  dni_cliente INT NOT NULL,
  domicilio_cliente VARCHAR(20) NOT NULL,
  email_cliente VARCHAR(50) NOT NULL,
  ciudad_cliente VARCHAR(30) NOT NULL,
  nro_telefono INT,
  CONSTRAINT PK_Cliente_id PRIMARY KEY (id_cliente),
  CONSTRAINT UQ_Cliente_dni UNIQUE (dni_cliente),
  CONSTRAINT UQ_Cliente_email UNIQUE (email_cliente),
  CONSTRAINT UQ_Cliente_nroTelefono UNIQUE (nro_telefono),
);

CREATE TABLE Venta
(
  id_venta INT NOT NULL,
  fecha_venta DATE NOT NULL,
  num_facturacion INT NOT NULL,
  id_cliente INT NOT NULL,
  CONSTRAINT PK_Venta_id PRIMARY KEY (id_venta),
  CONSTRAINT FK_Venta_id_cliente FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Metodo_Pago
(
  id_MetodoPago INT NOT NULL,
  tipo_metodoPago VARCHAR(30) NOT NULL,
  CONSTRAINT PK_MetodoPago_id PRIMARY KEY (id_MetodoPago)
);

CREATE TABLE Producto
(
  id_producto INT NOT NULL,
  nombre_producto VARCHAR(20) NOT NULL,
  descripcion_producto VARCHAR(30),
  precio_producto FLOAT NOT NULL,
  status_producto VARCHAR(10) NOT NULL,
  fechaPublic_producto DATE NOT NULL,
  id_categoriaProducto INT NOT NULL,
  id_vendedor INT NOT NULL,
  CONSTRAINT PK_Producto_id PRIMARY KEY (id_producto),
  CONSTRAINT FK_Producto_id_categoriaProducto FOREIGN KEY (id_categoriaProducto) REFERENCES Categoria_Producto(id_categoriaProducto),
  CONSTRAINT FK_Producto_id_vendedor FOREIGN KEY (id_vendedor) REFERENCES Vendedor(id_vendedor),
  CONSTRAINT DF_Producto_fechaPublic DEFAULT GETDATE();
);

CREATE TABLE Materiales_Producto
(
  porcentaje_MaterialProduct DECIMAL(5, 2) NOT NULL,
  id_producto INT NOT NULL,
  id_materiales INT NOT NULL,
  CONSTRAINT PK_MaterialesProducto_id PRIMARY KEY (id_producto, id_materiales),
  CONSTRAINT FK_MaterialesProducto_id_producto FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
  CONSTRAINT FK_MaterialesProducto_id_materiales FOREIGN KEY (id_materiales) REFERENCES Materiales(id_materiales)
);

CREATE TABLE Venta_Producto
(
  cantidad_producVenta INT NOT NULL,
  id_venta INT NOT NULL,
  id_producto INT NOT NULL,
  CONSTRAINT PK_Venta_Producto_id PRIMARY KEY (id_venta, id_producto),
  CONSTRAINT FK_Venta_Producto_id_venta FOREIGN KEY (id_venta) REFERENCES Venta(id_venta),
  CONSTRAINT FK_Venta_Producto_id_producto FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);

CREATE TABLE Pago
(
  id_pago INT NOT NULL,
  monoto_pago FLOAT NOT NULL,
  id_MetodoPago INT NOT NULL,
  id_venta INT NOT NULL,
  id_producto INT NOT NULL,
  CONSTRAINT PK_Pago_id PRIMARY KEY (id_pago),
  CONSTRAINT FK_Pago_id_MetodoPago FOREIGN KEY (id_MetodoPago) REFERENCES Metodo_Pago(id_MetodoPago),
  CONSTRAINT FK_Pago_id_venta_id_producto FOREIGN KEY (id_venta, id_producto) REFERENCES Venta_Producto(id_venta, id_producto)
);

CREATE TABLE Resena
(
  id_resena INT NOT NULL,
  calif_resena INT NOT NULL,
  coment_resena VARCHAR(50),
  id_producto INT NOT NULL,
  id_cliente INT NOT NULL,
  CONSTRAINT PK_Resena_id PRIMARY KEY (id_resena),
  CONSTRAINT FK_Resena_id_producto FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
  CONSTRAINT FK_Resena_id_cliente FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);


-- -----------------------------
-- Restricciones ---------------
-- -----------------------------

ALTER TABLE Vendedor
ADD CONSTRAINT CK_Vendedor_edad
CHECK (DATEDIFF(YEAR, fechaNac_vendedor, GETDATE()) >= 18);


ALTER TABLE Resena
ADD CONSTRAINT CK_Resena_Calificacion
CHECK (calif_resena BETWEEN 1 AND 10);

ALTER TABLE Producto
ADD CONSTRAINT CK_Status_Producto
CHECK (status_producto IN ('activa','pausada'));


-- ---------------------
-- LOTES DE DATOS ------
------------------------

SELECT * FROM Vendedor;
INSERT INTO Vendedor (id_vendedor, nombre_vendedor, apellido_vendedor, cuit_vendedor, fechaNac_vendedor, email_vendedor)
VALUES 
(1, 'Juan', 'Pérez', '20-12345678-9', '1980-05-15', 'juan.perez@example.com'),
(2, 'María', 'Gómez', '27-87654321-0', '1990-08-22', 'maria.gomez@example.com');

SELECT * FROM Categoria_Producto;
INSERT INTO Categoria_Producto (id_categoriaProducto, nombre_categoriaProduct)
VALUES 
(1, 'Hogar'),
(2, 'Jardín'),
(3, 'Decoración');


SELECT * FROM Materiales;
INSERT INTO Materiales (id_materiales, nombre_matrial)
VALUES 
(1, 'Madera'),
(2, 'Metal'),
(3, 'Vidrio');

SELECT * FROM Cliente;
INSERT INTO Cliente (id_cliente, nombre_cliente, apellido_cliente, dni_cliente, domicilio_cliente, email_cliente, ciudad_cliente, nro_telefono)
VALUES 
(1, 'Carlos', 'López', 12345678, 'Calle Falsa 123', 'carlos.lopez@example.com', 'Buenos Aires', 1122334455),
(2, 'Ana', 'Martínez', 87654321, 'Avenida Siempre Viva 742', 'ana.martinez@example.com', 'Córdoba', 2233445566);

SELECT * FROM Venta;
INSERT INTO Venta (id_venta, fecha_venta, num_facturacion, id_cliente)
VALUES 
(1, '2024-09-16', 1001, 1),
(2, '2024-09-17', 1002, 2);

SELECT * FROM Metodo_Pago;
INSERT INTO Metodo_Pago (id_MetodoPago, tipo_metodoPago)
VALUES 
(1, 'Tarjeta de Crédito'),
(2, 'Transferencia Bancaria'),
(3, 'Efectivo');

SELECT * FROM Producto;
INSERT INTO Producto (id_producto, nombre_producto, descripcion_producto, precio_producto, status_producto, fechaPublic_producto, id_categoriaProducto, id_vendedor)
VALUES 
(1, 'Mesa de Madera', 'Mesa hecha a mano', 1500.00, 'activa', GETDATE(), 1, 1),
(2, 'Silla de Jardín', 'Silla resistente al clima', 750.00, '2020-05-15','pausada', 2, 2);

SELECT * FROM Materiales_Producto;
INSERT INTO Materiales_Producto (porcentaje_MaterialProduct, id_producto, id_materiales)
VALUES 
(60.00, 1, 1),
(20.00, 1, 2),
(10.00, 1, 3),
(80.00, 2, 1),
(15.00, 2, 2);

SELECT * FROM Venta_Producto;
INSERT INTO Venta_Producto (cantidad_producVenta, id_venta, id_producto)
VALUES 
(2, 1, 1),
(1, 2, 2);

SELECT * FROM Pago;
INSERT INTO Pago (id_pago, monoto_pago, id_MetodoPago, id_venta, id_producto)
VALUES 
(1, 3000.00, 1, 1, 1),
(2, 750.00, 2, 2, 2);

SELECT * FROM Resena;
INSERT INTO Resena (id_resena, calif_resena, coment_resena, id_producto, id_cliente)
VALUES 
(1, 8, 'Buen producto, muy satisfecho', 1, 1),
(2, 9, 'Excelente calidad y diseño', 1, 2),
(3, 7, 'Buena relación calidad-precio', 2, 1),
(4, 10, 'Perfecto para mi jardín', 2, 2);


---- Validacion de restricciones

-- UQ_CUIT

INSERT INTO Vendedor (id_vendedor, nombre_vendedor, apellido_vendedor, cuit_vendedor, fechaNac_vendedor, email_vendedor)
VALUES 
(3, 'Juan', 'Pérez', '20-12345678-9', '1980-05-15', 'juan.perez@example.com');

-- CK_Edad 
INSERT INTO Vendedor (id_vendedor, nombre_vendedor, apellido_vendedor, cuit_vendedor, fechaNac_vendedor, email_vendedor)
VALUES 
(4, 'Juan', 'Pérez', '26-12345678-9', '2020-05-15', 'juan.perez@example.com');

-- DF_fecha
INSERT INTO Producto (id_producto, nombre_producto, descripcion_producto, precio_producto, status_producto, id_categoriaProducto, id_vendedor)
VALUES 
(1, 'Mesa de Madera', 'Mesa hecha a mano', 1500.00, 'activa', 1, 1);

--Profe no me dio el tiempo para probarlo en el SQL server ni seguir probando todas las restrincciones, peremos que este todo correcto desde ya 
--muchas gracias por llegar aca.