--Permisos a nivel de usuarios--

--Se crea login para el usuario administrador
CREATE LOGIN PortilloMarcelo WITH PASSWORD = 'marcelo16';

--Se crea login para el usuario solo lectura--
CREATE LOGIN GastonRodriguez WITH PASSWORD = 'gaston03';

--Cambiamos a la base de datos especifica--
USE gestion_Hotel_1;
GO

--Se crea el usuario de base de datos para el administrador--
CREATE USER PortilloMarcelo FOR LOGIN PortilloMarcelo;

--Se crea el usuario de base de datos para el usuario solo lectura--

CREATE USER GastonRodriguez FOR LOGIN GastonRodriguez;


--Se le otorga el permiso de administrador al usuario Portillo Marcelo--
ALTER ROLE db_owner ADD MEMBER PortilloMarcelo;

--Se le otorga el permiso de solo lectura al usuario Ggaston Rodriguez--
ALTER ROLE db_datareader ADD MEMBER GastonRodriguez;



--Permitir ejecución del procedimiento Almacenado para el usuario solo lectura (GastonRodriguez)--
GRANT EXECUTE ON InsertEmpleado TO GastonRodriguez;

EXEC InsertEmpleado 'Marcelo', 'Portillo', '12362363', '3757465363', 'Las heras 356',
'marce.porti@hotmail.com', '2023-06-01', 1, 2, 1;

select * from empleados

--Si queremos insertar con el usuario PortilloMarcelo (usuario administrador) vemos que inserta correctamente --

EXEC InsertEmpleado 'Juan', 'Perez', '52363256', '375154692', 'San Martin 356',
'juancito@hotmail.com', '2022-06-01', 1, 2, 1;


--Si queremos insertar con el usuario GastonRodriguez (usuario solo lectura) vemos que no se inserta correctamente --
INSERT INTO Empleados ( Nombre, Apellido, DNI, Telefono, Direccion, Email, Fecha_contratacion, ID_Cargo, ID_Turno, ID_Hotel)
VALUES ('Lucas', 'Paredes', '25632541', '+5437946366236', 'Calle Falsa 456', 'robertz@gmail.com', '2023-07-15', 1, 1, 1);

--Lo mismo ocurre si queremos usar procedimientos almacenados-- 
EXEC InsertEmpleado 'Carlos', 'Gomez', '40123456', '1122334455', 'Av. Libertador 789',
'carlos.gomez@email.com', '2023-08-15', 2, 3, 1;

--Permitir ejecución del procedimiento Almacenado para el usuario solo lectura (GastonRodriguez)--
GRANT EXECUTE ON InsertEmpleado TO GastonRodriguez;

--Probamos nuevamente utilizar el procedimiento almacenado para ver que inserta--
EXEC InsertEmpleado 'Carlos', 'Gomez', '40123456', '1122334455', 'Av. Libertador 789',
'carlos.gomez@email.com', '2023-08-15', 2, 3, 1;

select * from empleados

--Permisos a nivel de roles del DBMS--

-- Creamos un login para un usuario nuevo
CREATE LOGIN RomeroKarin WITH PASSWORD = 'romero123';

-- Creamos otro login para un usuario nuevo
CREATE LOGIN OrtelladoAgostina WITH PASSWORD = 'ortellado123';
 
 -- Creamos el usuario de la base de datos asociados al  login
CREATE USER RomeroKarin FOR LOGIN RomeroKarin;

-- Creamos el usuario de la base de datos asociados al  login
CREATE USER OrtelladoAgostina FOR LOGIN OrtelladoAgostina;

-- Creamos un rol llamado 'SoloLectura' para permisos de solo lectura
CREATE ROLE SoloLectura;

-- Dar permisos de solo lectura sobre la tabla 'Empleados' a este rol
GRANT SELECT ON dbo.Empleados TO SoloLectura;

-- Asignar el rol 'SoloLectura' al usuario 'RomeroKarin'
ALTER ROLE SoloLectura ADD MEMBER RomeroKarin;

SELECT * FROM empleados







