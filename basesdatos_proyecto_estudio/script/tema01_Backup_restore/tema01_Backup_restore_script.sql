use gestion_Hotel;

/*Tema: Backup y restore. Backup en línea.

Objetivos de Aprendizaje:

Conocer las técnicas de backup y restore, incluyendo backup en línea.
Implementar estrategias de respaldo para asegurar la integridad y recuperación de datos.
Criterios de Evaluación:

Implementación correcta de los procedimientos de backup y restore.
Documentación del proceso y verificación de la restauración de datos en los puntos indicados.
Claridad en las conclusiones sobre la efectividad del proceso.
*/

--==================================================================================================
--Verificar que el modelo de recuperación de la base de datos esté en el modo adecuado para realizar backup en línea

--(1) Verifico el modo de recuperación de la base de datos para asegurarme de que esté configurado en Full 
--(para permitir backups de logs de transacciones).
USE master;
SELECT name, recovery_model_desc 
FROM sys.databases 
WHERE name = 'gestion_Hotel';
--recovery_model_desc: Simple

--(2)Si el modo de recuperación no es Full, se debe cambiar:
ALTER DATABASE gestion_Hotel SET RECOVERY FULL;
--volver a ejecutar (1) para ver si cambió el modo 

--==================================================================================================
--Realizar un backup full de la base de datos.

BACKUP DATABASE [gestion_Hotel] 
TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\gestion_Hotel.bak' 
WITH NOFORMAT, NOINIT,  NAME = N'gestion_Hotel-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO
--==================================================================================================
--Generar 10 inserts sobre una tabla de referencia.

INSERT INTO Huespedes (ID_Huesped, Nombre, Apellido, DNI, Direccion, Telefono, Email, fecha_nacimiento, ID_Ciudad, ID_Provincia, ID_Pais)
VALUES (4, 'Manuel', 'Rodríguez', '78656790', 'Irigoyen 900', '+5498789875687', 'manurodriguez@gmail.com', '1990-05-09', 1, 1, 1),
       (5, 'Araceli', 'González', '65435423', 'Molina 8768', '+55788979709546', 'aracelig@gmail.com', '1985-08-21', 2, 2, 2),
       (6, 'Ciro', 'Valiente', '87546429', 'Republica 4367', '+5690986274214', 'cirovaliente7@gmail.com', '1992-07-14', 3, 3, 3),
	   (7, 'Joaquin', 'Paez', '87342435', 'Paraguay 2424', '+5491726395786', 'paezj45@gmail.com', '1967-02-19', 1, 1, 1),
       (8, 'Rut', 'Gómez', '98567654', 'Bombinhas 9320', '+5570077553344', 'gomezrutt90@gmail.com', '1979-06-12', 2, 2, 2),
       (9, 'Felipe', 'Sánchez', '72439640', 'Coronel 1325', '+5698753426545', 'felipe7485@gmail.com', '2003-12-10', 3, 3, 3),
	   (10, 'Damian', 'Romero', '94332547', 'Malvinas 2655', '+5496429647659', 'damiromero22@gmail.com', '1993-01-16', 1, 1, 1),
       (11, 'Camila', 'Portillo', '87099964', 'Avenida Brasil 456', '+5572743216439', 'camportillo3@gmail.com', '2001-09-28', 2, 2, 2),
       (12, 'Sofia', 'Lezcano', '59216493', 'Moreno 8790', '+5699078452354', 'sofialezcano@gmail.com', '2004-04-23', 3, 3, 3),
	   (13, 'Martha', 'Santana', '17390250', 'Janeiro 3141', '+5694856342077', 'marthasantana@gmail.com', '1999-03-31', 2, 2, 2);

select * from Huespedes;
--==================================================================================================
--Realizar backup del archivo de log y registrar la hora del backup

BACKUP LOG [gestion_Hotel]  --Realiza un backup del log de transacciones 
TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\gestion_Hotel_log1.trn' 
WITH NOFORMAT, NOINIT,  NAME = N'gestion_Hotel-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10

DECLARE @HoraBackup DATETIME;
SET @HoraBackup = GETDATE(); --registra la fecha y hora del backup del log
PRINT 'Hora del backup: ' + CONVERT(VARCHAR, @HoraBackup, 120); --120 es el formato de fecha y hora YYYY-MM-DD HH:MI:SS

--==================================================================================================
--Generar otros 10 insert sobre la tabla de referencia.

INSERT INTO Huespedes (ID_Huesped, Nombre, Apellido, DNI, Direccion, Telefono, Email, fecha_nacimiento, ID_Ciudad, ID_Provincia, ID_Pais)
VALUES (14, 'Ana', 'Rodríguez', '49837584', 'Cuba 487', '+5498389855660', 'anarodri@gmail.com', '1994-07-09', 1, 1, 1),
       (15, 'Maria', 'Sanchez', '74634526', 'Jujuy 5433', '+55783979609542', 'mariasanchez@gmail.com', '1986-08-26', 2, 2, 2),
       (16, 'Celeste', 'Martinez', '34675789', 'Roman 3434', '+5694986573254', 'celestem@gmail.com', '1993-05-14', 3, 3, 3),
	   (17, 'Elias', 'Perez', '98564789', 'Buenos Aires 2343', '+5491326297786', 'eliasp@gmail.com', '1961-07-19', 1, 1, 1),
       (18, 'Sara', 'Romero', '49037465', 'Brasil 4545', '+5520067543546', 'sararomero@gmail.com', '1999-06-11', 2, 2, 2),
       (19, 'Juan', 'Moralez', '98456304', 'Libertad 5434', '+5698343423520', 'juanmoralez9@gmail.com', '2005-12-12', 3, 3, 3),
	   (20, 'Alan', 'Castillo', '47352453', 'General Guemes 5353', '+5496426747689', 'alancastillo@gmail.com', '1992-03-16', 1, 1, 1),
       (21, 'Gaston', 'Cardozo', '87435466', 'Avenida Brasil 4532', '+5542743516639', 'gastoncardozo@gmail.com', '2000-09-03', 2, 2, 2),
       (22, 'Fiorella', 'Mendez', '19453768', 'Santiago 2344', '+5629038462854', 'fiorellamendez@gmail.com', '2001-05-22', 3, 3, 3),
	   (23, 'Santino', 'Castro', '94075689', 'Rio 5644', '+5644556372087', 'santinocastro@gmail.com', '1987-02-21', 2, 2, 2);

select * from Huespedes;

--==================================================================================================
--Realizar nuevamente backup de archivo de log  en otro archivo físico.

BACKUP LOG [gestion_Hotel] --Realiza otro backup del log
TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\gestion_Hotel_log2.trn' 
WITH NOFORMAT, NOINIT,  NAME = N'gestion_Hotel-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10

DECLARE @HoraBackup2 DATETIME;
SET @HoraBackup2 = GETDATE(); --guarda la fecha y hora del segundo backup del log
PRINT 'Hora del backup 2: ' + CONVERT(VARCHAR, @HoraBackup2, 120); --120 es el formato de fecha y hora YYYY-MM-DD HH:MI:SS
--==================================================================================================
--Restaurar la base de datos al momento del primer backup del archivo de log. Es decir después de los primeros 10 insert.

--Primero se debe eliminar la base de datos [gestion_Hotel] y luego ejecutar el codigo

USE [master]
RESTORE DATABASE [gestion_Hotel] --Restaura el backup completo de la base de datos en modo NORECOVERY
FROM  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\gestion_Hotel.bak' 
WITH  FILE = 1,  NORECOVERY,  NOUNLOAD,  REPLACE,  STATS = 5

--NORECOVERY: La base de datos queda en un estado (Restoring...) lo que significa que aún no está lista para ser utilizada. 
--Se utiliza cuando se quiere aplicar más archivos de backup, como archivos de log de transacciones, después de restaurar el backup de la base de datos.

RESTORE LOG [gestion_Hotel] --Aplica el primer backup del log
FROM  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\gestion_Hotel_log1.trn' 
WITH  FILE = 1,  NOUNLOAD,  STATS = 10

use [gestion_Hotel];

--Verificar el resultado.
select * from Huespedes;
--Devuelve 13 registros, los 3 registros que ya estaban en la tabla + los 10 que se insertaron luego

--==================================================================================================
--Restaurar la base de datos aplicando ambos archivos de log.

--Volver a eliminar la base de datos [gestion_Hotel] y luego ejecutar el codigo

USE [master]
RESTORE DATABASE [gestion_Hotel] --Restaura el backup completo de la base de datos en modo NORECOVERY
FROM  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\gestion_Hotel.bak' 
WITH  FILE = 1,  NORECOVERY,  NOUNLOAD,  STATS = 5

--NORECOVERY: La base de datos queda en un estado (Restoring...) lo que significa que aún no está lista para ser utilizada. 
--Se utiliza cuando se quiere aplicar más archivos de backup, como archivos de log de transacciones, después de restaurar el backup de la base de datos.

RESTORE LOG [gestion_Hotel] --Aplica el primer backup del log en modo NORECOVERY porque despues se va a aplicar otro backup del log 
FROM  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\gestion_Hotel_log1.trn' 
WITH  FILE = 1,  NORECOVERY,  NOUNLOAD,  STATS = 5

RESTORE LOG [gestion_Hotel] --Aplica el segundo backup del log WITH RECOVERY por defecto porque es el ultimo 
FROM  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\gestion_Hotel_log2.trn' 
WITH  FILE = 1,  NOUNLOAD,  STATS = 5

use [gestion_Hotel];

--Verificar el resultado.
select * from Huespedes;
--Devuelve los 23 registros, los 3 que ya estaban + los 10 primeros inserts (log1) + los 10 ultimos inserts (log2)

