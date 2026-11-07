/*Tema: Optimización de consultas a través de índices

Objetivos de Aprendizaje:

Conocer los tipos de índices y sus aplicaciones.
Evaluar el impacto de los índices en el rendimiento de las consultas.

Criterios de Evaluación:

Medición correcta de los tiempos de respuesta antes y después de aplicar índices.
Documentación detallada de los planes de ejecución de las consultas.
Evaluación de la mejora en el rendimiento.

Tareas: 

Realizar una carga masiva de por lo menos un millón de registro sobre alguna tabla que contenga un campo fecha (sin índice). 
Hacerlo con un script para poder automatizarlo.
Realizar una búsqueda por periodo y registrar el plan de ejecución utilizado por el motor y los tiempos de respuesta.
Definir un índice agrupado sobre la columna fecha y repetir la consulta anterior. Registrar el plan de ejecución utilizado por 
el motor y los tiempos de respuesta.
Borrar el índice creado
Definir otro índice agrupado sobre la columna fecha pero que además incluya las columnas seleccionadas y repetir la consulta 
anterior. Registrar el plan de ejecución utilizado por el motor y los tiempos de respuesta.
Expresar las conclusiones en base a las pruebas realizadas.*/

use gestion_Hotel_Optimizacion;
--como primer paso agregamos mas columnas a nuestra tabla HUESPEDES para que tengamos mayor variedad de datos en el millon 
--que tenemos que ingresar
/*ID_Reserva INT NOT NULL,
  Fecha_reserva DATETIME DEFAULT GETDATE() NOT NULL,
  Fecha_checkIn DATETIME NOT NULL,
  Fecha_checkOut DATETIME NOT NULL,
  ID_Estado_Reserva INT NOT NULL,
  ID_Huesped INT NOT NULL,*/
  INSERT INTO Reservas (ID_Reserva, Fecha_checkIn, Fecha_checkOut, ID_Estado_Reserva, ID_Huesped) VALUES (2665, '2024-11-12', '2025-01-13',1,1);
  INSERT INTO Reservas (ID_Reserva, Fecha_checkIn, Fecha_checkOut, ID_Estado_Reserva, ID_Huesped) VALUES (3666, '2024-11-24', '2025-01-13',2,2);
  INSERT INTO Reservas (ID_Reserva, Fecha_checkIn, Fecha_checkOut, ID_Estado_Reserva, ID_Huesped) VALUES (16527, '2024-11-12', '2025-02-27',3,3);
  INSERT INTO Reservas (ID_Reserva, Fecha_checkIn, Fecha_checkOut, ID_Estado_Reserva, ID_Huesped) VALUES (16582, '2024-11-21', '2025-02-21',1,1);
  INSERT INTO Reservas (ID_Reserva, Fecha_checkIn, Fecha_checkOut, ID_Estado_Reserva, ID_Huesped) VALUES (16592, '2024-12-12', '2025-02-23',1,1);
  INSERT INTO Reservas (ID_Reserva, Fecha_checkIn, Fecha_checkOut, ID_Estado_Reserva, ID_Huesped) VALUES (25602, '2024-12-22', '2025-01-23',2,2);
  INSERT INTO Reservas (ID_Reserva, Fecha_checkIn, Fecha_checkOut, ID_Estado_Reserva, ID_Huesped) VALUES (21652, '2024-11-15', '2025-01-30',3,3);
  INSERT INTO Reservas (ID_Reserva, Fecha_checkIn, Fecha_checkOut, ID_Estado_Reserva, ID_Huesped) VALUES (25622, '2024-12-14', '2025-02-24',1,1);
  INSERT INTO Reservas (ID_Reserva, Fecha_checkIn, Fecha_checkOut, ID_Estado_Reserva, ID_Huesped) VALUES (25632, '2024-12-22', '2025-01-22',3,3);
  INSERT INTO Reservas (ID_Reserva, Fecha_checkIn, Fecha_checkOut, ID_Estado_Reserva, ID_Huesped) VALUES (26642, '2024-12-03', '2025-02-03',2,2);

  --declaramos variables que nos ayudaran a calcular valores aleatorios para el ingreso de algunos datos
/*******INICIO DE EJECUCION******/
DECLARE @Counter INT = 1;
DECLARE @MaxRecords INT = 100;
DECLARE @BaseID_Reserva INT;
DECLARE @BaseCheckin DATE;
DECLARE @BaseCheckout DATE;
DECLARE @BaseEstado_Reserva INT;
DECLARE @BaseID_Huesped INT;

-- Datos existentes // alamacenamos en una variable temporal @Datos para el ingreso masivo
DECLARE @Datos TABLE (ID_Reserva INT, Checkin DATE, Checkout DATE, Estado_Reserva INT, ID_Huesped INT);

INSERT INTO @Datos (ID_Reserva, Checkin , Checkout, Estado_Reserva, ID_Huesped)
VALUES 
(78, '2024-11-12', '2025-01-13',1,1),(81, '2024-11-24', '2025-01-13',2,2),
(29,'2024-11-24', '2025-01-11',2,2),(30, '2024-11-12', '2025-02-27',3,3),
(67, '2024-12-22', '2025-01-02',3,2),(211, '2024-12-03', '2025-02-03',2,2),
(26,'2024-12-22', '2025-01-23',3,2),(74, '2024-12-22', '2025-01-22',2,2),
(28,'2024-11-21', '2025-02-21',3,1),(29, '2024-12-14', '2025-02-24',1,1),
(35, '2024-11-21', '2025-02-21',3,1),(33, '2024-12-22', '2025-01-23',3,3),
(36, '2024-11-24', '2025-01-13',2,2),(37, '2024-11-21', '2025-02-21',1,1),
(55, '2024-11-24', '2025-01-13',2,2);

WHILE @Counter <= (@MaxRecords - (SELECT COUNT(*) FROM @Datos))
BEGIN
    -- Selecciona un registro aleatorio de los datos existentes
    SELECT TOP 1 @BaseID_Reserva = ID_Reserva, @BaseCheckin = Checkin, @BaseCheckout = Checkout, @BaseEstado_Reserva = Estado_Reserva, @BaseID_Huesped = ID_Huesped
    FROM @Datos
    ORDER BY NEWID();  -- Aleatorio

    -- Modificar el DNI para que sea único
    SET @BaseID_Reserva = @BaseID_Reserva + @Counter;

    -- Insertar el nuevo registro con variaciones
    INSERT INTO Reservas (ID_Reserva, Fecha_checkIn, Fecha_checkOut, ID_Estado_Reserva, ID_Huesped)
    VALUES (
        @BaseID_Reserva,
        @BaseCheckin,
		DATEADD(DAY, ROUND(RAND() * 365, 0), @BaseCheckout),  -- Fecha variada
		@BaseEstado_Reserva,
		@BaseID_Huesped
        
    );

    SET @Counter = @Counter + 1;
END
/*******FIN DE EJECUCION******/

--TIEMPO ESTIMADO CERCA DE 3 MINUTOS

--.VERIFICAMOS QUE SE CARGARON 1 MILLON DE REGISTROS

select * from Reservas

--La condición completa @Counter <= (@MaxRecords - (SELECT COUNT(*) FROM @Datos)) 
--significa que el bucle continuará ejecutándose mientras el contador (@Counter) 
--sea menor o igual a la cantidad de registros que aún se pueden insertar.

--BUSCAMOS UN RANGO DE FECHAS DE MAYOR A MENOR "NO TIENEN INDICE"
SELECT TOP 1  Fecha_checkOut from Reservas
ORDER BY  Fecha_checkOut ASC   --2024-10-10
SELECT TOP 1  Fecha_checkOut from Reservas
ORDER BY  Fecha_checkOut DESC  --2026-02-27

--Consulta Inicial sin Índice, ASIQUE ELIMINAMOS PRIMERO NUESTRA CLAVE PRIMARIA EN Reservas

ALTER TABLE Reservas
DROP CONSTRAINT PK_reservas

--Sentencia utilizada cuando no es posible eliminar el PK
/*SELECT * 
FROM Reservas  WITH (INDEX(0))
WHERE Fecha_checkOut BETWEEN '2024-10-10' AND '2026-02-27'*/


/****************************Realiza una consulta que filtre por un rango de fechas****************************/

                        /******************CONSULTA SIN INDICES*****************/

-- Habilitar el plan de ejecución para la consulta sin índice.Esto te mostrará el plan de ejecución sin ejecutar la consulta
SET SHOWPLAN_ALL ON;
go
SELECT * 
FROM Reservas 
WHERE Fecha_checkOut BETWEEN '2024-10-10' AND '2026-02-27'
ORDER BY Fecha_checkOut
go
SET SHOWPLAN_ALL OFF;-- Deshabilitar el plan de ejecución
go

SET STATISTICS TIME ON;--Muestra el tiempo de CPU y el tiempo total transcurrido para la ejecución de cada consulta.
SET STATISTICS IO ON; --Muestra información sobre las operaciones de lectura y escritura de disco realizadas durante la ejecución de cada consulta.

SELECT * 
FROM Reservas WITH (INDEX(0))
WHERE Fecha_checkOut BETWEEN '2024-10-10' AND '2026-02-27'
ORDER BY Fecha_checkOut

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;

                   /******************CONSULTA CON INDICE AGRUPADO******************/

----CREAR UN INDICE DE FECHA---
-- Crear un índice agrupado sobre la columna FECHA_checkOut
CREATE CLUSTERED INDEX idx_fecha_checkOut ON Reservas(Fecha_checkOut);

SET SHOWPLAN_ALL ON;-- Habilitar el plan de ejecución para la consulta sin índice
go
SELECT * 
FROM Reservas 
WHERE Fecha_checkOut BETWEEN '2024-10-10' AND '2026-02-27'
ORDER BY Fecha_checkOut
go
SET SHOWPLAN_ALL OFF;-- Deshabilitar el plan de ejecución
go

--Ejecucion con indice agrupado
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

SELECT * 
FROM Reservas
WHERE Fecha_checkOut BETWEEN '2024-10-10' AND '2026-02-27'
ORDER BY Fecha_checkOut

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;

---BORRAR INDICE CREADO---
DROP INDEX idx_fecha_checkOut ON Reservas;

                 /******************CONSULTA CON INDICES NO AGRUPADOS**************/

-- Crear un índice no agrupado que incluya columnas
CREATE NONCLUSTERED INDEX idx_fecha_checkOut_dato ON Reservas(Fecha_checkOut)
INCLUDE (Fecha_checkIn);

SET SHOWPLAN_ALL ON;-- Habilitar el plan de ejecución para la consulta sin índice
go
SELECT * 
FROM Reservas
WHERE Fecha_checkOut BETWEEN '2024-10-10' AND '2026-02-27'
ORDER BY Fecha_checkOut
go
SET SHOWPLAN_ALL OFF;-- Deshabilitar el plan de ejecución
go

--Ejecucion con indices no agrupado
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

SELECT * 
FROM Reservas
WHERE Fecha_checkOut BETWEEN '2024-10-10' AND '2026-02-27'
ORDER BY Fecha_checkOut

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;

--BORRAR INDICE
DROP INDEX idx_fecha_checkOut_dato ON Reservas;

--Creamos nuevamente el id de la tabla. Fin
ALTER TABLE Reservas
ADD CONSTRAINT PK_reservas PRIMARY KEY (ID_Reserva)


/*******************************************************************************************************************************/



CREATE DATABASE gestion_Hotel_Optimizacion;
go
use gestion_Hotel_Optimizacion;
go
CREATE TABLE Tipo_habitacion
(
  ID_TipoHabitacion INT NOT NULL,
  Precio_noche_tipo FLOAT NOT NULL,
  Descripcion VARCHAR(100) NOT NULL,
  Fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
  CONSTRAINT PK_Tipo_habitacion PRIMARY KEY (ID_TipoHabitacion),
  CONSTRAINT CK_Tipo_habitacion_Precio_noche_tipo CHECK (Precio_noche_tipo > 0)
);
Select * from Tipo_habitacion
go
CREATE TABLE Servicios_adicionales
(
  ID_Servicio INT NOT NULL,
  Descripcion VARCHAR(200) NOT NULL,
  Precio_unitario FLOAT NOT NULL,
  Fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
  CONSTRAINT PK_Servicios PRIMARY KEY (ID_Servicio),
  CONSTRAINT CK_Servicios_adicionales_Precio_unitario CHECK (Precio_unitario > 0)
);
go
CREATE TABLE Estado_Habitacion
(
  ID_Estado_Habitacion INT NOT NULL,
  Descripcion VARCHAR(200) NOT NULL,
  Fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
  CONSTRAINT PK_Estado_Habitacion PRIMARY KEY (ID_Estado_Habitacion)
);
go
CREATE TABLE Turno
(
  ID_Turno INT NOT NULL,
  Descripción VARCHAR(200) NOT NULL,
  Horario_inicio TIME NOT NULL,
  Horario_fin TIME NOT NULL,
  Fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
  CONSTRAINT PK_Turno PRIMARY KEY (ID_Turno),
  CONSTRAINT CK_Turno_Horarios CHECK (
  (Horario_fin > Horario_inicio) OR -- caso normal en un mismo dia
  (Horario_inicio >= '22:00' AND Horario_fin <= '06:00') -- excepcion para el turno noche
  )
);
go
CREATE TABLE Categoria
(
  ID_Categoria INT NOT NULL,
  Nro_estrellas INT NOT NULL,
  Fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
  CONSTRAINT PK_Categoria PRIMARY KEY (ID_Categoria),
  CONSTRAINT CK_Categoria_Nro_estrellas CHECK (Nro_estrellas > 0)
);
go
CREATE TABLE Estado_Reserva
(
  ID_Estado_Reserva INT NOT NULL,
  Descripcion VARCHAR(100) NOT NULL,
  Fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
  CONSTRAINT PK_Estado_Reserva PRIMARY KEY (ID_Estado_Reserva)
);
select * from Estado_Reserva
go
CREATE TABLE Cargo
(
  ID_Cargo INT NOT NULL,
  Descripcion VARCHAR(200) NOT NULL,
  Fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
  CONSTRAINT PK_Cargo PRIMARY KEY (ID_Cargo)
);
go
CREATE TABLE Pais
(
  ID_Pais INT NOT NULL,
  Nombre VARCHAR (50) NOT NULL,
  Fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
  CONSTRAINT PK_Pais PRIMARY KEY (ID_Pais)
);
go
CREATE TABLE Provincia
(
  ID_Provincia INT NOT NULL,
  Nombre VARCHAR(50) NOT NULL,
  ID_Pais INT NOT NULL,
  Fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
  CONSTRAINT PK_Provincia PRIMARY KEY (ID_Provincia, ID_Pais),
  CONSTRAINT FK_Provincia_Pais FOREIGN KEY (ID_Pais) REFERENCES Pais(ID_Pais)
);
go
CREATE TABLE Ciudades
(
  ID_Ciudad INT NOT NULL,
  Nombre VARCHAR(50) NOT NULL,
  ID_Provincia INT NOT NULL,
  ID_Pais INT NOT NULL,
  Fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
  CONSTRAINT PK_Ciudades PRIMARY KEY (ID_Ciudad, ID_Provincia, ID_Pais),
  CONSTRAINT FK_Ciudades_Provincia FOREIGN KEY (ID_Provincia, ID_Pais) REFERENCES Provincia(ID_Provincia,ID_Pais)
);
select * from Ciudades;
go
CREATE TABLE Hotel
(
  ID_Hotel INT NOT NULL,
  Nombre VARCHAR(100) NOT NULL,
  Direccion VARCHAR(200) NOT NULL,
  Email VARCHAR(100) NOT NULL,
  ID_Categoria INT NOT NULL,
  ID_Ciudad INT NOT NULL,
  ID_Provincia INT NOT NULL,
  ID_Pais INT NOT NULL,
  Fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
  CONSTRAINT PK_Hotel PRIMARY KEY (ID_Hotel),
  CONSTRAINT FK_Hotel_Categoria FOREIGN KEY (ID_Categoria) REFERENCES Categoria(ID_Categoria),
  CONSTRAINT FK_Hotel_Ciudades FOREIGN KEY (ID_Ciudad, ID_Provincia, ID_Pais) REFERENCES Ciudades(ID_Ciudad, ID_Provincia, ID_Pais),
  CONSTRAINT UQ_Hotel_Email UNIQUE (Email)
);
go
CREATE TABLE Telefono
(
  ID_Telefono INT NOT NULL,
  Numero VARCHAR(15) NOT NULL,
  Tipo VARCHAR(50) NOT NULL,
  ID_Hotel INT NOT NULL,
  Fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
  CONSTRAINT PK_Telefono PRIMARY KEY (ID_Telefono),
  CONSTRAINT FK_Telefono_Hotel FOREIGN KEY (ID_Hotel) REFERENCES Hotel(ID_Hotel)
);
go
CREATE TABLE Habitaciones
(
  Nro_habitacion INT NOT NULL,
  Capacidad INT NOT NULL,
  Precio_noche FLOAT NOT NULL,
  Piso INT NOT NULL,
  ID_TipoHabitacion INT NOT NULL,
  ID_Estado_Habitacion INT NOT NULL,
  ID_Hotel INT NOT NULL,
  Fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
  CONSTRAINT PK_Habitaciones PRIMARY KEY (Nro_habitacion,ID_Hotel),
  CONSTRAINT FK_Habitaciones_Tipo_habitacion FOREIGN KEY (ID_TipoHabitacion) REFERENCES Tipo_habitacion(ID_TipoHabitacion),
  CONSTRAINT FK_Habitaciones_Estado_Habitación FOREIGN KEY (ID_Estado_Habitacion) REFERENCES Estado_Habitacion(ID_Estado_Habitacion),
  CONSTRAINT FK_Habitaciones_Hotel FOREIGN KEY (ID_Hotel) REFERENCES Hotel(ID_Hotel),
  CONSTRAINT CK_Habitaciones_Capacidad CHECK (Capacidad > 0),
  CONSTRAINT CK_Habitaciones_Precio_noche CHECK (Precio_noche > 0)
);
go
CREATE TABLE Huespedes
(
  ID_Huesped INT NOT NULL,
  Nombre VARCHAR(100) NOT NULL,
  Apellido VARCHAR(100) NOT NULL,
  DNI VARCHAR(8) NOT NULL,
  Direccion VARCHAR(200) NOT NULL,
  Telefono VARCHAR(15) NOT NULL,
  Email VARCHAR(100) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  ID_Ciudad INT NOT NULL,
  ID_Provincia INT NOT NULL,
  ID_Pais INT NOT NULL,
  Fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
  CONSTRAINT PK_Huespedes PRIMARY KEY (ID_Huesped),
  CONSTRAINT FK_Huespedes_Ciudades FOREIGN KEY (ID_Ciudad, ID_Provincia, ID_Pais) REFERENCES Ciudades(ID_Ciudad, ID_Provincia, ID_Pais),
  CONSTRAINT UQ_Huespedes_DNI UNIQUE (DNI),
  CONSTRAINT UQ_Huespedes_Telefono UNIQUE (Telefono),
  CONSTRAINT UQ_Huespedes_Email UNIQUE (Email),
  CONSTRAINT CK_Huespedes_Edad CHECK (DATEDIFF(YEAR, fecha_nacimiento, GETDATE()) >= 18)
);
select * from Huespedes
go
CREATE TABLE Reservas
(
  ID_Reserva INT NOT NULL,
  Fecha_reserva DATETIME DEFAULT GETDATE() NOT NULL,
  Fecha_checkIn DATETIME NOT NULL,
  Fecha_checkOut DATETIME NOT NULL,
  ID_Estado_Reserva INT NOT NULL,
  ID_Huesped INT NOT NULL,
  Fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
  CONSTRAINT PK_reservas PRIMARY KEY (ID_Reserva),
  CONSTRAINT FK_Reservas_Estado_Reserva FOREIGN KEY (ID_Estado_Reserva) REFERENCES Estado_Reserva(ID_Estado_Reserva),
  CONSTRAINT FK_Reservas_Huespedes FOREIGN KEY (ID_Huesped) REFERENCES Huespedes(ID_Huesped),
  CONSTRAINT CK_Reservas_FechasValidas CHECK (Fecha_checkOut > Fecha_checkIn),
  CONSTRAINT CK_Reservas_Estadia_minima CHECK (DATEDIFF(day, Fecha_checkIn, Fecha_checkOut) >= 1)
);
go
CREATE TABLE Empleados
(
  ID_Empleado INT NOT NULL,
  Nombre VARCHAR(100) NOT NULL,
  Apellido VARCHAR(100) NOT NULL,
  DNI VARCHAR(8) NOT NULL,
  Telefono VARCHAR(15) NOT NULL,
  Direccion VARCHAR(200) NOT NULL,
  Email VARCHAR (50) NOT NULL,
  Fecha_contratacion DATE NOT NULL,
  ID_Cargo INT NOT NULL,
  ID_Turno INT NOT NULL,
  ID_Hotel INT NOT NULL,
  Fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
  CONSTRAINT PK_Empleados PRIMARY KEY (ID_Empleado),
  CONSTRAINT FK_Empleados_Cargo FOREIGN KEY (ID_Cargo) REFERENCES Cargo(ID_Cargo),
  CONSTRAINT FK_Empleados_Turno FOREIGN KEY (ID_Turno) REFERENCES Turno(ID_Turno),
  CONSTRAINT FK_Empleados_Hotel FOREIGN KEY (ID_Hotel) REFERENCES Hotel(ID_Hotel),
  CONSTRAINT UQ_Empleados_Telefono UNIQUE (Telefono),
  CONSTRAINT UQ_Empleados_DNI UNIQUE (DNI),
  CONSTRAINT UQ_Empleados_Email UNIQUE (Email)
);
