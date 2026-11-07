Explicación de la Sintaxis y Comandos:

USE master;: Cambia el contexto a la base de datos master, que se utiliza para administrar otras bases de datos en SQL Server.

SELECT name, recovery_model_desc FROM sys.databases WHERE name = 'gestion_Hotel';: Consulta el modo de recuperación de la base de datos gestion_Hotel para verificar si es FULL, necesario para respaldos de logs de transacciones.

ALTER DATABASE gestion_Hotel SET RECOVERY FULL;: Cambia el modo de recuperación de la base de datos a FULL, permitiendo backups completos y de logs de transacciones.

BACKUP DATABASE [gestion_Hotel] TO DISK = '...': Realiza un backup completo de la base de datos y lo guarda en la ruta especificada.

INSERT INTO Huespedes ... VALUES (...);: Inserta nuevos registros en la tabla Huespedes.

BACKUP LOG [gestion_Hotel] TO DISK = '...': Crea un backup del log de transacciones, lo que permite restaurar la base de datos a un estado específico en el tiempo.

DECLARE @HoraBackup DATETIME; SET @HoraBackup = GETDATE(); PRINT ...: Declara una variable para capturar la fecha y hora actual y la imprime en un formato de fecha legible.

RESTORE DATABASE [gestion_Hotel] FROM DISK = '...' WITH NORECOVERY, REPLACE: Restaura un backup completo en modo NORECOVERY para permitir la aplicación de logs de transacciones posteriores. REPLACE permite sobrescribir la base de datos existente.

RESTORE LOG [gestion_Hotel] FROM DISK = '...' WITH NORECOVERY: Aplica un backup del log de transacciones en modo NORECOVERY, manteniendo la base de datos en un estado de restauración.

RESTORE LOG [gestion_Hotel] FROM DISK = '...': Aplica el último log de transacciones con RECOVERY (por defecto), dejando la base de datos lista para su uso


El modo NORECOVERY se utiliza cuando se quiere hacer una restauracion de backup en multiples etapas o secuencialmente aplicando backups de logs de transacciones despues de hacer el backup completo para llevar a la base de datos a un punto en el tiempo especifico. Esto hace que la base de datos quede en un estado restoring lo que significa que aún no está lista para ser utilizada hasta que se aplique el ultimo archivo log en RECOVERY y de esta forma queda lista para usar.

REPLACE se utiliza cuando la restauración de la base de datos es parte de un proceso de recuperación de desastres o se necesita reemplazar la base de datos por completo ya que sobreescribe la base de datos existente.

Cuando se usa el comando BACKUP tambien se utilizan otras opciones en la clausula WITH como:

NOFORMAT: Indica que el medio de backup existente no se formateará. Si ya hay datos en el archivo o dispositivo, estos no se eliminarán. Esto asegura que el medio se reutilice sin sobrescribir su contenido.

NOINIT: Permite agregar el backup al final del archivo de backup existente en lugar de sobrescribirlo. Si ya existen backups en el archivo especificado, este backup se agrega como una nueva entrada.

NAME = N'gestion_Hotel-Full Database Backup': Establece un nombre descriptivo para identificar el backup en el archivo. Es útil para que los administradores sepan qué contiene un archivo de backup sin tener que restaurarlo.

SKIP: Omite la verificación de nombre de la media de backup y permite que el backup se realice en un archivo incluso si el nombre de la media no coincide con lo esperado.

NOREWIND: Mantiene la posición de la cinta (si se usa un dispositivo de cinta) al final del backup, lo que permite escribir más datos sin retroceder. No es relevante para backups en disco.

NOUNLOAD: Indica que el dispositivo de backup (como una cinta) no se descargue automáticamente al final del proceso. Similarmente, en el caso de un disco, significa que el archivo no se cierra completamente.

STATS = 10: Muestra el progreso del backup en incrementos del 10%. Es una opción para monitorear cuánto se ha completado el proceso de backup, proporcionando actualizaciones en la consola. 