# Gestión de Hoteles

**Universidad**: Universidad Nacional del Nordeste.

**Facultad**: Facultad de Ciencias Exactas y Naturales y Agrimensura.

**Carrera**: Licenciatura en Sistemas de Información.

**Asignatura**: Bases de Datos I.

**Docente**: Villegas Darío.

**Integrantes**:
1.	Ortellado Agostina Anyelen.                        44224567.
2.	Portillo Juan Marcelo.                             36460188.
3.	Rodríguez Gastón Osvaldo.                          32732916.
4.	Romero Dayana Karin.                               35497094.

**Año**: 2024

## CAPÍTULO I: INTRODUCCIÓN

### Caso de estudio

El tema de este trabajo práctico es el diseño y desarrollo de una base de datos relacional para una cadena de hoteles a nivel nacional. La finalidad de la misma es gestionar de manera centralizada aspectos clave de la operación hotelera, como las reservas de habitaciones, el registro de huéspedes, la administración del personal, y el control de servicios adicionales. El sistema propuesto busca mejorar la eficiencia en la gestión operativa de la cadena, facilitando el acceso a la información y optimizando procesos esenciales.

### Definición o planteamiento del problema

El problema principal que abordaremos en este trabajo es cómo diseñar una base de datos eficiente para gestionar la operación de múltiples hoteles en diferentes ubicaciones. La gestión tradicional presenta desafíos como la administración manual de reservas, el seguimiento de los servicios consumidos por los huéspedes, y la correcta asignación de recursos humanos.

Entre los principales problemas que se busca resolver están:

-La necesidad de una estructura centralizada y organizada que permita el manejo de múltiples hoteles de manera eficiente.

-Cómo interrelacionar de manera efectiva entidades como empleados, huéspedes, habitaciones y servicios adicionales para brindar una visión integral de las operaciones del hotel.

-Cómo manejar la información de manera que se mantenga la integridad y consistencia de los datos a lo largo de las distintas operaciones diarias.

Las preguntas clave a responder en el desarrollo del sistema son:

-¿Cómo organizar la información de manera que sea fácilmente accesible y manejable para cada uno de los hoteles?

-¿Qué estructuras y relaciones son necesarias para reflejar fielmente las interacciones dentro de la operación de una cadena hotelera?

### Objetivo del Trabajo Práctico

El objetivo principal de este trabajo práctico es diseñar una base de datos relacional que permita a la cadena de hoteles gestionar sus operaciones diarias de manera eficaz, mejorando la administración y control de sus recursos. El sistema debe ser capaz de manejar de manera integral la información relevante para la operación hotelera, permitiendo un acceso rápido y seguro a los datos por parte de los usuarios autorizados.

i. Objetivo General

Desarrollar un modelo de base de datos relacional que permita la gestión completa de las operaciones de una cadena de hoteles, optimizando el manejo de información de reservas, habitaciones, empleados, huéspedes, y servicios adicionales.

ii. Objetivos Específicos

1- Definir y estructurar las entidades clave involucradas en la operación de los hoteles: huéspedes, empleados, habitaciones, reservas y servicios adicionales.

2- Establecer relaciones entre las entidades de manera que la base de datos refleje las interacciones reales entre los distintos actores del sistema.

3- Garantizar que el diseño de la base de datos respete la integridad y consistencia de la información, evitando redundancias y facilitando su consulta.

4- Proveer una estructura de base de datos que facilite la escalabilidad para futuros requerimientos, como la inclusión de más hoteles o nuevas funcionalidades.

5- Entender el manejo de permisos y roles en bases de datos.

6- Aplicar permisos de lectura, escritura y ejecución para diferentes roles y usuarios.

7- Proveer una estructura que permita reutilizar código, reduciendo las duplicaciones y facilitando el mantenimiento.

8- Definir procedimientos y funciones almacenadas que permitan ejecutar consultas rápidamente.

9- Facilitar la búsqueda de registros específicos en una tabla grande con la implementación de índices.

10- Garantizar la protección de los datos contra fallos del sistema, realizando periódicamente copias de seguridad. 

11- Conocer las técnicas de backup y restore, incluyendo backup en línea.

12- Implementar estrategias de respaldo para asegurar la integridad y recuperación de datos.

### Alcance del Trabajo Práctico

Este trabajo abarca el diseño e implementación de un sistema de base de datos relacional orientado a gestionar de manera eficiente la operación de una cadena de hoteles. Se cubren las siguientes áreas:

-Gestión de reservas: Control de las reservas realizadas por los huéspedes, incluyendo el seguimiento del estado de cada una (reservada, en curso, finalizada).

-Registro de huéspedes: Administración de la información personal de los huéspedes y su historial de visitas.

-Administración de habitaciones: Asignación de habitaciones a las reservas, gestión de tipos de habitación, estado y disponibilidad.

-Control de servicios adicionales: Registro de los servicios consumidos por los huéspedes durante su estancia (por ejemplo, spa, restaurante, etc.).

-Gestión de empleados: Administración de los datos de los empleados del hotel, incluyendo su cargo, turno y asignación a un hotel específico.

### Limitaciones del Trabajo Práctico

En este trabajo nos enfocaremos exclusivamente en la operación interna de los hoteles, limitando su alcance en los siguientes aspectos:

-No se aborda la facturación o sistema de pagos: Aunque se registran los servicios consumidos por los huéspedes, el sistema no incluye funciones para la facturación, procesamiento de pagos, o manejo de cuentas por cobrar.

-No se considera la integración con sistemas externos: La base de datos está diseñada para ser un sistema independiente, por lo que no incluye mecanismos de integración con otros sistemas externos, como plataformas de reservas online o sistemas de gestión de contabilidad.

-No se incluye un sistema de reportes avanzados: Aunque el sistema permite consultas básicas de la información, no se desarrollarán módulos avanzados de generación de reportes o análisis de datos.

## CAPITULO II: MARCO CONCEPTUAL O REFERENCIAL

### TEMA 1: Manejo de permisos a nivel de usuarios de base de datos

El manejo de permisos en bases de datos tiene un papel muy importante en cuanto se habla a proteger la integridad y confidencialidad de los datos. Con la administración de los permisos a nivel de usuarios y roles, se logra una flexibilidad y un control efectivo sobre las acciones que cada usuario puede realizar, reduciendo   los riesgos de acceso no autorizado. Esto incluye desde la asignación de permisos de ejecución específicos hasta la creación de roles que simplifican la gestión de accesos y responsabilidades.

Flexibilidad en la Gestión de Permisos:
La gestión de permisos a nivel de usuarios y roles permite una administración flexible y segura de los accesos a la base de datos. Se puede asignar de forma precisa qué acciones puede realizar cada usuario, minimizando riesgos de seguridad.

Permisos de Ejecución Específicos:
Dar permisos de ejecución sobre procedimientos almacenados a usuarios con permisos limitados permite que realicen ciertas operaciones sin necesidad de tener acceso directo a las tablas. Esto añade una capa adicional de seguridad.

Restricciones y Seguridad:
Las restricciones de permisos, como limitar a read_user a solo lectura y ejecución de procedimientos específicos, garantizan que usuarios no autorizados no puedan alterar datos críticos en la base directamente.

Roles en la Base de Datos:
La creación de los roles que agrupan permisos específicos es una práctica efectiva para gestionar accesos. Al asignar estos roles a los usuarios adecuados, se puede controlar de manera eficiente quién puede hacer qué dentro de la base de datos.

### TEMA 2: Procedimientos y Funciones almacenadas

Un procedimiento almacenado es un grupo de una o varias instrucciones, en nuestro caso Transact-SQL para SQL server, que se ejecutan secuencialmente algunas de sus caracteristicas son:
-Aceptan parámetros de entrada y pueden devolver varios valores en forma de parámetros de salida al programa que realiza la llamada.
-Contener instrucciones de programación que realicen operaciones en la base de datos, como también pueden contener llamadas a otros procedimientos.
-Devolver un valor de estado a un programa que realiza una llamada para indicar si la operación se ha realizado correctamente o se han producido errores, y el motivo de estos.

Ventajas de usar procedimientos almacenados

-Tráfico de red reducido entre el cliente y el servidor: los comandos de un procedimiento se ejecutan en un único lote de código. Esto puede reducir significativamente el tráfico de red entre el servidor y el cliente porque únicamente se envía a través de la red la llamada que va a ejecutar el procedimiento.
-Mayor seguridad: varios usuarios y programas cliente pueden realizar operaciones en los objetos de base de datos subyacentes a través de un procedimiento, aunque los usuarios y los programas no tengan permisos directos sobre esos objetos subyacentes. El procedimiento controla qué procesos y actividades se llevan a cabo y protege los objetos de base de datos subyacentes. Esto elimina la necesidad de conceder permisos en cada nivel de objetos y simplifica los niveles de seguridad.
-Reutilización del código: el código de cualquier operación de base de datos redundante resulta un candidato perfecto para la encapsulación de procedimientos. De este modo, se elimina la necesidad de escribir de nuevo el mismo código, se reducen las inconsistencias de código y se permite que cualquier usuario o aplicación que cuente con los permisos necesarios pueda acceder al código y ejecutarlo.
-Mantenimiento más sencillo: cuando las aplicaciones cliente llaman a procedimientos y mantienen las operaciones de base de datos en la capa de datos, solo deben actualizarse los cambios de los procesos en la base de datos subyacente.
-Rendimiento mejorado: de forma predeterminada, un procedimiento se compila la primera vez que se ejecuta y crea un plan de ejecución que vuelve a usarse en posteriores ejecuciones. Como el procesador de consultas no tiene que crear un nuevo plan, normalmente necesita menos tiempo para procesar el procedimiento.
-Funciones Al igual que las funciones de los lenguajes de programación, las funciones definidas por el usuario de SQL Server son rutinas que aceptan parámetros, realizan una acción y devuelven el resultado de esa acción como un valor. El valor devuelto puede ser un valor escalar único o un conjunto de resultados.
Ventajas de las funciones definidas por el usuario
-Programación modular: puede crear la función una vez, almacenarla en la base de datos y llamarla desde el programa tantas veces como desee.
-Ejecución más rápida: com pasa con los procedimientos almacenados, las funciones definidas por el usuario de Transact-SQL reducen el costo de compilación del código de Transact-SQL almacenando los planes en la caché y reutilizándolos para ejecuciones repetidas.
-Reducción del tráfico de red: una operación que filtra datos basándose en restricciones complejas que no se puede expresar en una sola expresión escalar se puede expresar como una función.

Tipos de funciones

-Funciones escalares : las funciones escalares definidas por el usuario devuelven un único valor de datos del tipo definido en la cláusula RETURNS. El tipo devuelto puede ser de cualquier tipo de datos excepto text, ntext, image, cursory timestamp.
-Funciones con valores de tabla: las funciones con valores de tabla definidas por el usuario devuelven un tipo de datos table. La tabla es el conjunto de resultados de una sola instrucción SELECT.
-Funciones del sistema : SQL Server proporciona numerosas funciones del sistema que se pueden usar para realizar diversas operaciones, estas no se pueden modificar.
-Funciones deterministas y no deterministas: las funciones deterministas siempre devuelven el mismo resultado cada vez que se llama con un conjunto específico de valores de entrada y tienen el mismo estado de la base de datos. Las funciones no deterministas pueden devolver resultados diferentes cada vez que se les llama con un conjunto específico de valores de entrada, incluso si el estado de la base de datos al que acceden sigue siendo el mismo.

Diferencias entre procedimientos y funciones

Tipo de retorno: una función siempre devuelve un valor, mientras que un procedimiento almacenado no es obligatorio que lo haga.
Parámetros: un procedimiento almacenado puede tener parámetros de entrada y salida, mientras que una función no puede tener parámetros de salida.
Llamadas: una función se puede llamar desde un procedimiento almacenado, pero no al revés.
Instrucciones :una función solo permite una instrucción SELECT, mientras que un procedimiento almacenado permite SELECT, INSERT, UPDATE y DELETE.
Transacciones: un procedimiento almacenado puede administrar transacciones, pero una función no.
Uso en declaraciones SELECT: una función se puede incrustar en una declaración SELECT, pero un procedimiento almacenado no.

### TEMA 3: Optimización de consultas a través de índices

Un índice es una estructura en disco asociada con una tabla o vista que acelera la recuperación de filas de la tabla o vista. Un índice contiene claves construidas a partir de una o más columnas en la tabla o vista. Estas claves se almacenan en una estructura (B-árbol) que permite a SQL Server encontrar la fila o filas asociadas con los valores de clave de forma rápida y eficiente. Cuando se ejecuta esta consulta, el optimizador de consultas evalúa cada método disponible para recuperar los datos y selecciona el método más eficiente. El método puede ser un escaneo de tabla, o puede estar escaneando uno o más índices si existen.
Existen dos tipos de índices, los agrupados y los no agrupados. Los primeros ordenan y almacenan las filas de datos en la tabla o vista en función de sus valores clave. Estos valores clave son las columnas incluidas en la definición de índice. Solo puede haber un índice agrupado por tabla, porque las filas de datos en sí mismas se pueden almacenar en un solo orden. La única vez que las filas de datos en una tabla se almacenan en orden ordenado es cuando la tabla contiene un índice agrupado. Cuando una tabla tiene un índice agrupado, la tabla se denomina tabla agrupada. Este tipo de índice se asemeja a las conocidas guías telefónicas.
En el caso de los segundo, los índices no agrupados, tienen una estructura separada de las filas de datos. Un índice no agrupado contiene los valores de clave de índice no agrupados y cada entrada de valor de clave tiene un puntero a la fila de datos que contiene el valor de clave. El puntero de una fila de índice en un índice no agrupado a una fila de datos se denomina localizador de filas. La estructura del localizador de filas depende de si las páginas de datos se almacenan en un montón o en una tabla agrupada. Para un montón, un localizador de filas es un puntero a la fila. Para una tabla agrupada, el localizador de filas es la clave de índice agrupada. Este tipo de índice se asemeja al de un libro, por contener en sus hojas los punteros a las posiciones de memoria donde se almacena la información.
Ambos tipos de índices tienen sus ventajas y sus desventajas, se pueden crear múltiples índices no agrupados sobre una tabla, lo que puede acelerar consultas que no se benefician del índice agrupado. Sin embargo  cada vez que se inserta, actualiza o elimina una fila, los índices no agrupados también deben actualizarse, lo que puede afectar el rendimiento de las operaciones de escritura.

### TEMA 4: Backup y restore. Backup en línea

Un backup es una copia de seguridad de una base de datos o archivos que se realiza para proteger los datos frente a posibles pérdidas, fallos del sistema o corrupción. El objetivo de un backup es permitir la recuperación de la información en caso de un evento adverso.
La restauración (o restore) es el proceso de utilizar un backup previamente realizado para recuperar una base de datos o sistema a un estado anterior. Se emplea cuando ocurre una pérdida de datos o un fallo que requiere volver a una versión segura y funcional de la base de datos.
El backup en línea es un tipo de backup que se realiza mientras la base de datos está en funcionamiento y accesible para los usuarios. En el modo de recuperación FULL o BULK_LOGGED, permite realizar copias de seguridad sin interrumpir las operaciones de la base de datos, proporcionando continuidad operativa.
El log de transacciones es un registro detallado de todas las transacciones y cambios realizados en la base de datos. Permite la recuperación a un punto específico en el tiempo (restauración de un punto de recuperación) y es esencial para el proceso de restauración de datos incrementales. Este archivo de log captura cada operación y es clave para aplicar restauraciones de forma progresiva, asegurando que todos los cambios se implementen hasta un momento específico.

Efectividad de los backups (completos y de logs):

Backup completo: Es una copia completa de la base de datos, esencial para restaurar el estado inicial antes de aplicar otros backups incrementales o de logs. El script demuestra la capacidad de realizar un backup completo de la base de datos gestion_Hotel, asegurando la integridad de los datos hasta ese punto.
Backup de logs de transacciones: Permite capturar los cambios que ocurren después de un backup completo. La efectividad de este tipo de backup radica en su capacidad para registrar los cambios de la base de datos y permitir la recuperación granular en un punto específico. En este ejercicio, los backups de logs (gestion_Hotel_log1.trn y gestion_Hotel_log2.trn) se implementaron de manera efectiva para capturar los cambios antes y después de las inserciones.

Recuperación de la base de datos a puntos específicos en el tiempo:

La restauración de la base de datos se realizó primero en el estado del backup completo seguido de la aplicación del primer archivo de log (gestion_Hotel_log1.trn), lo que permitió recuperar la base de datos al estado después de los primeros 10 registros insertados.
Para restaurar hasta después de todos los cambios, se aplicaron ambos backups de logs (gestion_Hotel_log1.trn y gestion_Hotel_log2.trn), recuperando así los 23 registros.
El uso de la opción WITH NORECOVERY en las restauraciones de logs permitió mantener la base de datos en estado de restauración hasta que se aplicó el último log con WITH RECOVERY, asegurando la consistencia de la recuperación de datos.

Verificación de los registros en los momentos restaurados:

Después del primer log: La base de datos mostró 13 registros, lo que confirma que los 10 primeros inserts se aplicaron correctamente tras restaurar el primer archivo de log.
Después del segundo log: La base de datos restaurada con ambos logs mostró los 23 registros, corroborando que los cambios de ambos backups de logs se aplicaron correctamente y que los datos restaurados coincidían con las operaciones de inserción documentadas.

Observación clave:
Modelo de recuperación: Configurar la base de datos en modo de recuperación FULL es esencial para permitir la captura de logs de transacciones y asegurar la capacidad de restaurar a puntos específicos.

## CAPÍTULO III: METODOLOGÍA SEGUIDA

El proyecto lo llevamos a cabo mediante la búsqueda individual de información respecto al tema asignado a cada miembro del grupo. Realizamos el diagrama de relación-entidad y nos dividimos en partes equitativa la investigación acerca de las diferentes técnicas de trabajo (Manejo de Permisos a Nivel de Usuarios, Procedimientos y funciones almacenadas, BackUp y Restore, optimización de consultas) y el desarrollo de las mismas. Fuimos proponiendo distintas fechas de reuniones para ir compartiendo lo desarrollado y acoplando las distintas partes del proyecto, eso lo hicimos de manera virtual para tener una mejor visión del código y la búsqueda de información. El informe lo realizamos entre todos ya que fuimos aportando ideas y uniendo lo investigado, así como la carga de datos ya que contiene muchas claves foráneas y se hacía imposible ir viendo los errores ya que algunas tablas dependen de otras.

Herramientas Utilizadas

SQL Server.
SQL Server Management Studio (SSMS): Ofrece interfaces gráficas para la gestión de permisos y roles en bases de datos
WhatsApp: Fue unos de los medios más utilizado para ir coordinando las reuniones, respondiendo consultas, y pasar información no solo del proyecto si no de la materia en sí.
Meet: Fue el medio que utilizamos para llevar a cabo algunas reuniones virtuales e ir compartiendo el proceso en la creación del proyecto ya que es una plataforma gratuita y que no requiere una conexión a internet muy buena.
GitHub: fue la herramienta clave ya que permite tener un registro del trabajo y que todos tengamos acceso al mismo codigo para compartirnos tambien dimos permisos de colaborador a los profesores que desarrollan la materia.
Los datos se obtuvieron de internet.

## CAPÍTULO IV: DESARROLLO DEL TEMA / PRESENTACIÓN DE RESULTADOS 

### Tema 1: Manejo de permisos a nivel de usuarios de base de datos

En SQL Server, la administración de permisos es fundamental para garantizar la seguridad de los datos y la correcta gestión de accesos. Existen diferentes niveles de permisos y métodos de autenticación que permiten definir quién puede acceder y realizar operaciones en la base de datos, ya sea a nivel de servidor, base de datos o tablas específicas.
La configuración de modos de autenticación es el primer paso para definir cómo los usuarios se autenticarán en SQL Server. Para lograr un equilibrio entre flexibilidad y seguridad, se puede optar por el modo de autenticación mixta, que admite tanto la autenticación integrada de Windows como la autenticación con usuario y contraseña de SQL Server.
Una vez configurado el modo de autenticación, el siguiente paso es crear y gestionar logins y usuarios. Los logins son cuentas a nivel de servidor, mientras que los usuarios se crean en el contexto de una base de datos y están asociados a estos logins. Para asegurar que los usuarios tengan acceso únicamente a las operaciones necesarias, SQL Server permite asignarles roles y permisos específicos, como los de lectura, escritura y administración, tanto a nivel de tablas como a nivel de procedimientos almacenados.

A continuacion se mostraran los pasos necesarios.

Primero se debe configurar el motor en modo mixto que permita ingresar por autenticación integrada con Windows  y por usuario y contraseña de base de datos.

## Autenticación:
![Autenticacion](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/Permisos_Rol/Autenticacion.png)

## Login:
![Login](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/Permisos_Rol/UsuarioContraseña.png)

 Si el usuario no tiene un login (cuenta de autenticación a nivel de servidor), debes crear uno primero:

 ## Creación de login :
![Creación](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/Permisos_Rol/CreacionLogin.png)

Creamos los usuarios de la base de datos asociados al login 

 ## Creación de usuarios de base de datos :
![CreaciónUsuario](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/Permisos_Rol/CreacionUsuario.png)


Asignamos los permisos de admnistrador a Portillo Marcelo y el de solo lectura a Rodriguez Gaston

## Asignamos los permisos
![Asignacion](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/Permisos_Rol/AsignacionPermisos.png)

Prueba de inserción a través de procedimiento con el usuario de solo lectura.

## Prueba 1
![Prueba](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/Permisos_Rol/InserccionProcedimientoDenegado.png)

Lo mismo ocurre si queremos realizar un INSERT.

## Prueba 2
![Prueba](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/Permisos_Rol/InsertDenegado.png)

Pero, si asignamos el permiso de insertar datos a través de un procedimiento, vemos que ocurre lo siguiente:

## Prueba 3
![Prueba](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/Permisos_Rol/AsignacionInserccionProcedimiento.png)

En cuanto al usuario administrador que tiene permiso a todo no tiene ningún problema en hacer inserciones a través de procedimientos almacenados o con la clausula INSERT.

Permisos a nivel de roles del DBMS:

Se crean los usuarios:

## Creación de usuarios
![CreaciónUsuarios](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/Permisos_Rol/CreacionLoginUsuario.png)

Se crea  un rol que permita solo lectura a algunas de las tablas creadas

## Creación de Rol
![Roles](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/Permisos_Rol/CrearRol.png)


Damos permiso de solo lectura sobre la tabla Empleados a este rol.

## Asignación de permiso de solo lectura sobre la tabla Empleados a este Rol
![Roles](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/Permisos_Rol/DarPermisoRolTabla.png)


Asignamos el rol creado, llamado "solo lectura", al usuario Romero Karin.

## Asignación de Rol al usuario
![AsignacionRol](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/Permisos_Rol/AsignacionRolLecturaRomero.png)

El rol se ejecuta correctamente.

## Prueba 4
![Prueba](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/Permisos_Rol/LecturaExitosa.png)

Mientras que el otro usuario creado, al no tener permisos asignados, solo podrá conectarse a la base de datos, pero no podrá realizar ninguna operación útil.

### Tema 2: Procedimientos y funciones almacenadas

Para el desarrollo de este tema se realizaron en primer lugar 3 procedimientos, uno que realiza un insert sobre la tabla empelados de nuestra base de dados del proyecto, otro que realiza un update sobre la tabla empleados y por último uno que realiza un delete sobre la tabla emepleados. Luego se pasa a las funciones que se realizaron 3 funciones que devuelven una tabla, en la que cada una realiza una operacion sobre la tabla empleados para una determinada antiguedad, variando si se busca en un determinado año, si se busca entre un rango de fechas o si se busca discriminar por tipo de empleado. Para finalizar se realizó un procedimiento y una funcion en la que ambos reciben un mismo tipo de parámetro, un id que refiere a un empleado, y la idea a probar es que ambas devuelvan los mismos resultados y comparando la eficiencia entre ellas.

En el siguiente enlace se encuentra el script sql referido a este tema

## Estructura del procedimiento Insert Empleados:
![Estructura Insert](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/Estructura_Insert_Empleado.png)

## Estructura de la función FuncionCalcularAntiguedad:
![Estructura Insert](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/Funcion_CalculaAntiguedad.png)

## Ubicación de los procedimientos y funciones dentro de la base de datos
![Estructura Insert](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/Ubicacion_Proce_Funciones.png)

## Comparación de los planes de ejecución de una funcion y de un procedimiento que devuelven el mismo resultado

### Plan de ejecución de la función FuncionCalcularAntiguedad:
![Estructura Insert](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/Ejecucion_FuncionCalcularAntiguedad.png)

## Plan de ejecución del procedimiento CalcularAntiguedadDelConBucle:
![Estructura Insert](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/CalcularEdadConBucle.png)

### Resultado de ambas querys

Querys
-Procedimiento

EXEC VerificarAntiguedadEmpleados @Anos = 2;

-Funcion

select e.ID_Empleado, e.nombre, e.apellido, dbo.EmpleadoConAntiguedad(e.ID_Empleado,2)
from Empleados e

![Estructura Insert](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/ComparacionQuery.png)


### Tema 3: Optimización de consultas a través de índices

Con el objetivo de analizar la eficiencia de los distintos índices en cuanto al tiempo de respuesta al realizar determinada consulta, seleccionamos una tabla de la base de datos realizamos un script para realizar una carga masiva de datos. Luego eliminamos la clave primaria y procedemos a crear y ejecutar cada tipo de índice, registrando el tiempo de ejecucion de cada uno de ellos. A continuación se muestra en detalle los pasos seguidos para dicha prueba.

![Estructura Insert](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/crearIndiceAgrupado.png)
![Estructura Insert](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/ejecucionIndiceAgrupado.png)
![Estructura Insert](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/BorrarIndiceAgrupado.png)
![Estructura Insert](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/IndiceNoAgrupado.png)

### Tema 4: Backup y restore. Backup en línea

Con el objetivo de conocer las técnicas de backup y restore, incluyendo backup en línea, y de implementar estrategias de respaldo para asegurar la integridad y recuperación de datos, se describe a continuación los resultados logrados con la implementación:

Verificación y Configuración del Modo de Recuperación:

Se verifica que la base de datos esté en modo de recuperación FULL y se cambia si es necesario.

En este caso estaba en modo SIMPLE
![Modo_simple](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/backup/1_verificaModo1SIMPLE.png)

Se cambia a FULL
![Modo_full](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/backup/2_verificaModoFULL.png)

Realización del Backup Completo:

Primero se debe hacer click derecho en la base de datos e ir a task - backup
![Task_backup](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/backup/3_taskBackUp.png)

Luego seleccionar la ruta y el nombre del archivo .bak y hacer click en Script
![Elegir_archivo](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/backup/4_backupFull.png)

Se realiza un backup completo de la base de datos gestion_Hotel.
![Hacer_backupFull](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/backup/5_hacerBackUp.png)

Inserción de Datos:

Se insertan 10 registros en la tabla Huespedes.
![Insercion1](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/backup/6_genero10inserts.png)

Backup del Log de Transacciones:

Se realiza un primer backup del log de transacciones, que captura los cambios después del backup completo.
![Elegir_archivo_log](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/backup/7_backupLog.png)
![Backup_log1](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/backup/8_hacerbackupLogYregistraHora.png)

Inserción Adicional de Datos:

Se insertan otros 10 registros en la tabla Huespedes.
![Insercion2](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/backup/9_genera10insertsmas.png)

Backup del Segundo Log de Transacciones:

Se realiza un segundo backup del log, registrando más cambios recientes.
![Backup_log2](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/backup/10_hacerbackupLog2.png)

Restauración de la Base de Datos:

Primero se debe eliminar la base de datos [gestion_Hotel] y luego hacer click derecho en Database - Restore database
![Restore_database](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/backup/11_restoreDatabase.png)

Luego seleccionar el archivo .bak a restaurar 
![Seleccionar_archivo_restaurar](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/backup/12_elegirDatabaseFull.png)

En Options marcar WITH REPLACE y poner en NORECOVERY y seleccionar Script
![REPLACE_NORECOVERY](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/backup/13_ponerREPLACEyNORECOVERY.png)

La base de datos queda en un estado (Restoring...) lo que significa que aún no está lista para ser utilizada 
![Database_restoring](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/backup/14_restoreFULLNORECOVERY.png)

La base de datos se restaura al estado después del primer backup del log, mostrando los primeros 13 registros.
![Seleccionar_archivo_restaurar](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/backup/15_restoreLOG1.png)
![Database_restore](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/backup/16_restoreLOG1bien.png)
![Verifico_restoreLOG1](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/backup/17_verificoRestoreLOG1.png)

Restauración Completa:

Se aplica el segundo log de transacciones, restaurando la base de datos al estado final con los 23 registros.
![Restore](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/backup/18_restauroTodo.png)
![Verifico_restore_completo](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/backup/19_ResultadoFinal.png)


### Diagrama relacional
![diagrama_relacional](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/diagramaRelacional.png)


### Diccionario de datos

Acceso al documento [PDF](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/DiccionarioDatos_GestionHotel.pdf) del diccionario de datos.

## CAPÍTULO V: CONCLUSIONES

En conclusión, la gestión de permisos y roles a nivel de usuarios es un componente crítico en el diseño de una base de datos relacional para garantizar la seguridad y el control del acceso a los datos. Esto permite a los administradores definir las acciones específicas que puede realizar cada usuario, lo cual es clave para proteger la integridad de la información y prevenir accesos y modificaciones no autorizados. La implementación adecuada de estas medidas asegura que solo los usuarios autorizados puedan interactuar con los datos según sus roles, apoyando los objetivos de control y eficiencia operativa.

Además, el uso de procedimientos y funciones contribuye a optimizar el rendimiento del sistema, reduciendo el tráfico de red y fomentando la reutilización del código. Esto no solo disminuye los costos de procesamiento, sino que también simplifica el mantenimiento y la evolución del sistema. Es fundamental evaluar cuándo utilizar procedimientos o funciones, ya que las funciones pueden ser más eficientes y menos complejas en determinadas circunstancias, mientras que los procedimientos permiten una mayor flexibilidad a costa de un mayor costo de ejecución.

La optimización de consultas a través del uso de índices es otra estrategia esencial. Los índices agrupados son ideales para consultas que requieren rangos de valores o uniones frecuentes, mientras que los índices no agrupados son más adecuados cuando se necesita optimizar diferentes tipos de consultas en múltiples columnas, especialmente en situaciones donde las operaciones de escritura son frecuentes. Esto permite un balance entre la flexibilidad de las consultas y la eficiencia del sistema.

Por último, la implementación de estrategias de backup y restore es indispensable para la protección de los datos y la recuperación ante fallos. Contar con procedimientos de respaldo sólidos permite asegurar la integridad de la información y la recuperación a puntos específicos en el tiempo, lo cual es crucial para auditorías y la continuidad de las operaciones.

En resumen, el diseño de una base de datos que contemple estos aspectos no solo mejora la eficiencia operativa, sino que también garantiza la seguridad, escalabilidad y robustez del sistema, cumpliendo con los objetivos de administrar eficazmente la información de una cadena hotelera y apoyar su crecimiento y adaptación a futuros requerimientos.

## VI. BIBLIOGRAFÍA

Microsoft. (2024). SQL Server Documentation. https://learn.microsoft.com/es-es/sql/relational-databases/backup-restore/quickstart-backup-restore-database?view=sql-server-ver16&tabs=ssms

Microsoft. (n.d.). Stored procedures (Database Engine). Microsoft Learn. https://learn.microsoft.com/es-es/sql/relational-databases/stored-procedures/stored-procedures-database-engine?view=sql-server-ver16

Axial SQL. https://axial-sql.com/es/comprendiendo-los-indices-agrupados-y-no-agrupados-en-sql-server/
