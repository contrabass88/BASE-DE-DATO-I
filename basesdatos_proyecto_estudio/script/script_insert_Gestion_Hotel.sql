-- SCRIPT "Gestion de Hoteles"
-- INSERCIÓN DEL LOTE DE DATOS

-- Insert Tipo_habitacion
INSERT INTO Tipo_habitacion (ID_TipoHabitacion, Precio_noche_tipo, Descripcion)
VALUES (1, 1500.00, 'Habitación simple'),
       (2, 2500.00, 'Habitación doble'),
       (3, 3500.00, 'Suite');

-- Insert Servicios_adicionales
INSERT INTO Servicios_adicionales (ID_Servicio, Descripcion, Precio_unitario)
VALUES (1, 'Spa', 500.00),
       (2, 'Desayuno buffet', 300.00),
       (3, 'Lavandería', 200.00);

-- Insert Estado_Habitacion
INSERT INTO Estado_Habitacion (ID_Estado_Habitacion, Descripcion)
VALUES (1, 'Disponible'),
       (2, 'Ocupada'),
       (3, 'Mantenimiento');

-- Insert Turno
INSERT INTO Turno (ID_Turno, Descripción, Horario_inicio, Horario_fin)
VALUES (1, 'Turno Mañana', '06:00', '14:00'),
       (2, 'Turno Tarde', '14:00', '22:00'),
       (3, 'Turno Noche', '22:00', '06:00');

-- Insert Categoria
INSERT INTO Categoria (ID_Categoria, Nro_estrellas)
VALUES (1, 3),
       (2, 4),
       (3, 5);

-- Insert Estado_Reserva
INSERT INTO Estado_Reserva (ID_Estado_Reserva, Descripcion)
VALUES (1, 'Confirmada'),
       (2, 'Cancelada'),
       (3, 'Pendiente');

-- Insert Cargo
INSERT INTO Cargo (ID_Cargo, Descripcion)
VALUES (1, 'Recepcionista'),
       (2, 'Gerente'),
       (3, 'Limpieza');

-- Insert Pais
INSERT INTO Pais (ID_Pais, Nombre)
VALUES (1, 'Argentina'),
       (2, 'Brasil'),
       (3, 'Chile');

-- Insert Provincia 
INSERT INTO Provincia (ID_Provincia, Nombre, ID_Pais)
VALUES (1, 'Buenos Aires', 1),
       (2, 'Rio de Janeiro', 2),
       (3, 'Santiago', 3);

-- Insert Ciudades 
INSERT INTO Ciudades (ID_Ciudad, Nombre, ID_Provincia, ID_Pais)
VALUES (1, 'La Plata', 1, 1),
       (2, 'Rio de Janeiro', 2, 2),
       (3, 'Santiago', 3, 3);

-- Insert Hotel (Solo Argentina)
INSERT INTO Hotel (ID_Hotel, Nombre, Direccion, Email, ID_Categoria, ID_Ciudad, ID_Provincia, ID_Pais)
VALUES (1, 'Hotel La Plata', 'Calle Falsa 123', 'contacto@hotelplata.com', 2, 1, 1, 1);

-- Insert Telefono
INSERT INTO Telefono (ID_Telefono, Numero, Tipo, ID_Hotel)
VALUES (1, '+541122334455', 'Fijo', 1),
       (2, '+541155667788', 'Móvil', 1);

-- Insert Habitaciones
INSERT INTO Habitaciones (Nro_habitacion, Capacidad, Precio_noche, Piso, ID_TipoHabitacion, ID_Estado_Habitacion, ID_Hotel)
VALUES (101, 2, 1500.00, 1, 1, 1, 1),
       (102, 4, 2500.00, 1, 2, 1, 1),
       (201, 6, 3500.00, 2, 3, 1, 1);

-- Insert Huespedes (Distintos países)
INSERT INTO Huespedes (ID_Huesped, Nombre, Apellido, DNI, Direccion, Telefono, Email, fecha_nacimiento, ID_Ciudad, ID_Provincia, ID_Pais)
VALUES (1, 'Juan', 'Pérez', '12345678', 'Calle Real 123', '+5491122334455', 'juanperez@gmail.com', '1990-05-15', 1, 1, 1),
       (2, 'Ana', 'Gómez', '87654321', 'Avenida Brasil 456', '+5571122334455', 'anagomez@gmail.com', '1985-08-22', 2, 2, 2),
       (3, 'Carlos', 'Sánchez', '45678912', 'Calle Chile 789', '+5691122334455', 'carlossanchez@gmail.com', '1992-11-30', 3, 3, 3);

-- Insert Reservas
INSERT INTO Reservas (ID_Reserva, Fecha_reserva, Fecha_checkIn, Fecha_checkOut, ID_Estado_Reserva, ID_Huesped)
VALUES (1, GETDATE(), '2024-10-05', '2024-10-10', 1, 1),
       (2, GETDATE(), '2024-10-12', '2024-10-15', 1, 2),
       (3, GETDATE(), '2024-11-01', '2024-11-05', 1, 3);

-- Insert Empleados
INSERT INTO Empleados (ID_Empleado, Nombre, Apellido, DNI, Telefono, Direccion, Email, Fecha_contratacion, ID_Cargo, ID_Turno, ID_Hotel)
VALUES (1, 'Roberto', 'Martínez', '32165498', '+5491144556677', 'Calle Falsa 456', 'robertomartinez@gmail.com', '2023-01-15', 1, 1, 1),
       (2, 'Lucía', 'Fernández', '78945612', '+5491144667788', 'Avenida Siempreviva 789', 'luciafernandez@gmail.com', '2022-06-20', 2, 2, 1);

-- Insert Consumo
INSERT INTO Consumo (ID_Consumo, Fecha, Cantidad, Total, ID_Servicio, ID_Reserva, ID_Huesped)
VALUES (1, GETDATE(), 2, 1000.00, 1, 1, 1),
       (2, GETDATE(), 1, 300.00, 2, 2, 2);

-- Insert ReservasHabitaciones
INSERT INTO ReservasHabitaciones (ID_Reserva, ID_Huesped, Nro_habitacion, ID_Hotel)
VALUES (1, 1, 101, 1),
       (2, 2, 102, 1),
       (3, 3, 201, 1);

--Lotes de datos para probar las restricciones

-- Datos inválidos (Precio_noche_tipo <= 0)
INSERT INTO Tipo_habitacion (ID_TipoHabitacion, Precio_noche_tipo, Descripcion)
VALUES (4, -500.00, 'Suite de lujo'); -- Violación: Precio_noche negativo

-- Datos inválidos (Precio_unitario <= 0)
INSERT INTO Servicios_adicionales (ID_Servicio, Descripcion, Precio_unitario)
VALUES (5, 'Lavandería', 0.00); -- Violación: Precio unitario igual a 0

-- Datos inválidos (Turno donde Horario_fin <= Horario_inicio)
INSERT INTO Turno (ID_Turno, Descripción, Horario_inicio, Horario_fin)
VALUES (4, 'Turno Inverso', '14:00', '10:00'); -- Violación: Fin menor al inicio

-- Datos inválidos (Nro_estrellas <= 0)
INSERT INTO Categoria (ID_Categoria, Nro_estrellas)
VALUES (4, 0); -- Violación: Nro_estrellas igual a 0

-- Datos inválidos (Email duplicado)
INSERT INTO Hotel (ID_Hotel, Nombre, Direccion, Email, ID_Categoria, ID_Ciudad, ID_Provincia, ID_Pais)
VALUES (3, 'Hotel Córdoba', 'Calle Real 456', 'contacto@hotelplata.com', 2, 1, 1, 1); -- Violación: Email duplicado

-- Datos inválidos (Menor de edad)
INSERT INTO Huespedes (ID_Huesped, Nombre, Apellido, DNI, Direccion, Telefono, Email, fecha_nacimiento, ID_Ciudad, ID_Provincia, ID_Pais)
VALUES (4, 'Ana', 'Ramirez', '87654329', 'Avenida Siempreviva 456', '+5491122334466', 'anaramirez@gmail.com', '2010-08-22', 1, 1, 1); -- Violación: Menor de edad

-- Datos inválidos (Fecha_checkOut <= Fecha_checkIn)
INSERT INTO Reservas (ID_Reserva, Fecha_reserva, Fecha_checkIn, Fecha_checkOut, ID_Estado_Reserva, ID_Huesped)
VALUES (2, GETDATE(), '2024-10-05', '2024-10-04', 1, 1); -- Violación: Fecha_checkOut menor a Fecha_checkIn

-- Datos inválidos (DNI duplicado)
INSERT INTO Empleados (ID_Empleado, Nombre, Apellido, DNI, Telefono, Direccion, Email, Fecha_contratacion, ID_Cargo, ID_Turno, ID_Hotel)
VALUES (5, 'Lucía', 'Fernández', '32165498', '+5491144667788', 'Avenida Real 789', 'lufernandez@gmail.com', '2022-06-20', 2, 2, 1); -- Violación: DNI duplicado

-- Datos inválidos (Cantidad <= 0)
INSERT INTO Consumo (ID_Consumo, Fecha, Cantidad, Total, ID_Servicio, ID_Reserva, ID_Huesped)
VALUES (2, GETDATE(), 0, 0.00, 1, 1, 1); -- Violación: Cantidad y Total menores o iguales a 0











