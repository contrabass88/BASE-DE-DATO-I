CREATE DATABASE gestion_Hotel;
go
use gestion_Hotel;
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
  CONSTRAINT PK_reservas PRIMARY KEY (ID_Reserva,ID_Huesped),
  CONSTRAINT FK_Reservas_Estado_Reserva FOREIGN KEY (ID_Estado_Reserva) REFERENCES Estado_Reserva(ID_Estado_Reserva),
  CONSTRAINT FK_Reservas_Huespedes FOREIGN KEY (ID_Huesped) REFERENCES Huespedes(ID_Huesped),
  CONSTRAINT CK_Reservas_FechasValidas CHECK (Fecha_checkOut > Fecha_checkIn),
  CONSTRAINT CK_Reservas_Estadia_minima CHECK (DATEDIFF(day, Fecha_checkIn, Fecha_checkOut) >= 1)
);
go
CREATE TABLE Empleados
(
  ID_Empleado INT IDENTITY(1,1) NOT NULL,
  Nombre VARCHAR(100) NOT NULL,
  Apellido VARCHAR(100) NOT NULL,
  DNI VARCHAR(8) NOT NULL,
  Telefono VARCHAR(15) NOT NULL,
  Direccion VARCHAR(200) NOT NULL,
  Email VARCHAR(50) NOT NULL,
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
GO

CREATE TABLE Consumo
(
  ID_Consumo INT NOT NULL,
  Fecha DATETIME NOT NULL,
  Cantidad INT NOT NULL,
  Total FLOAT NOT NULL,
  ID_Servicio INT NOT NULL,
  ID_Reserva INT NOT NULL,
  ID_Huesped INT NOT NULL,
  Fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
  CONSTRAINT PK_Consumo PRIMARY KEY (ID_Consumo,ID_Servicio,ID_Reserva,ID_Huesped),
  CONSTRAINT FK_Consumo_Servicios_adicionales FOREIGN KEY (ID_Servicio) REFERENCES Servicios_adicionales(ID_Servicio),
  CONSTRAINT FK_Consumo_Reservas FOREIGN KEY (ID_Reserva, ID_Huesped) REFERENCES Reservas(ID_Reserva, ID_Huesped),
  CONSTRAINT CK_Consumo_Cantidad CHECK (Cantidad > 0),
  CONSTRAINT CK_Consumo_Total CHECK (Total > 0)
);
go
CREATE TABLE ReservasHabitaciones
(
  ID_Reserva INT NOT NULL,
  ID_Huesped INT NOT NULL,
  Nro_habitacion INT NOT NULL,
  ID_Hotel INT NOT NULL,
  Fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
  CONSTRAINT PK_ReservasHabitaciones PRIMARY KEY (ID_Reserva,ID_Huesped,Nro_habitacion,ID_Hotel),
  CONSTRAINT FK_ReservasHabitaciones_Reservas FOREIGN KEY (ID_Reserva, ID_Huesped) REFERENCES Reservas(ID_Reserva, ID_Huesped),
  CONSTRAINT FK_ReservasHabitaciones_Habitaciones FOREIGN KEY (Nro_habitacion, ID_Hotel) REFERENCES Habitaciones(Nro_habitacion, ID_Hotel)
);

