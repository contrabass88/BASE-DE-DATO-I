TEMA 1 Procedimientos y Funciones

Procedimientos Un procedimiento almacenado es un grupo de una o varias instrucciones, en nuestro caso Transact-SQL para SQL server, que se ejecutan secuencialmente algunas de sus caracteristicas son:
Aceptan parámetros de entrada y pueden devolver varios valores en forma de parámetros de salida al programa que realiza la llamada.

Contener instrucciones de programación que realicen operaciones en la base de datos, como también pueden contener llamadas a otros procedimientos.

Devolver un valor de estado a un programa que realiza una llamada para indicar si la operación se ha realizado correctamente o se han producido errores, y el motivo de estos.

Ventajas de usar procedimientos almacenados

Tráfico de red reducido entre el cliente y el servidor: los comandos de un procedimiento se ejecutan en un único lote de código. Esto puede reducir significativamente el tráfico de red entre el servidor y el cliente porque únicamente se envía a través de la red la llamada que va a ejecutar el procedimiento.

Mayor seguridad: varios usuarios y programas cliente pueden realizar operaciones en los objetos de base de datos subyacentes a través de un procedimiento, aunque los usuarios y los programas no tengan permisos directos sobre esos objetos subyacentes. El procedimiento controla qué procesos y actividades se llevan a cabo y protege los objetos de base de datos subyacentes. Esto elimina la necesidad de conceder permisos en cada nivel de objetos y simplifica los niveles de seguridad.

Reutilización del código: el código de cualquier operación de base de datos redundante resulta un candidato perfecto para la encapsulación de procedimientos. De este modo, se elimina la necesidad de escribir de nuevo el mismo código, se reducen las inconsistencias de código y se permite que cualquier usuario o aplicación que cuente con los permisos necesarios pueda acceder al código y ejecutarlo.

Mantenimiento más sencillo: cuando las aplicaciones cliente llaman a procedimientos y mantienen las operaciones de base de datos en la capa de datos, solo deben actualizarse los cambios de los procesos en la base de datos subyacente.

Rendimiento mejorado: de forma predeterminada, un procedimiento se compila la primera vez que se ejecuta y crea un plan de ejecución que vuelve a usarse en posteriores ejecuciones. Como el procesador de consultas no tiene que crear un nuevo plan, normalmente necesita menos tiempo para procesar el procedimiento.

Funciones Al igual que las funciones de los lenguajes de programación, las funciones definidas por el usuario de SQL Server son rutinas que aceptan parámetros, realizan una acción y devuelven el resultado de esa acción como un valor. El valor devuelto puede ser un valor escalar único o un conjunto de resultados.
Ventajas de las funciones definidas por el usuario

Programación modular: puede crear la función una vez, almacenarla en la base de datos y llamarla desde el programa tantas veces como desee.

Ejecución más rápida: com pasa con los procedimientos almacenados, las funciones definidas por el usuario de Transact-SQL reducen el costo de compilación del código de Transact-SQL almacenando los planes en la caché y reutilizándolos para ejecuciones repetidas.

Reducción del tráfico de red: una operación que filtra datos basándose en restricciones complejas que no se puede expresar en una sola expresión escalar se puede expresar como una función.

Tipos de funciones

Funciones escalares : las funciones escalares definidas por el usuario devuelven un único valor de datos del tipo definido en la cláusula RETURNS. El tipo devuelto puede ser de cualquier tipo de datos excepto text, ntext, image, cursory timestamp.

Funciones con valores de tabla: las funciones con valores de tabla definidas por el usuario devuelven un tipo de datos table. La tabla es el conjunto de resultados de una sola instrucción SELECT.

Funciones del sistema : SQL Server proporciona numerosas funciones del sistema que se pueden usar para realizar diversas operaciones, estas no se pueden modificar.

Funciones deterministas y no deterministas: las funciones deterministas siempre devuelven el mismo resultado cada vez que se llama con un conjunto específico de valores de entrada y tienen el mismo estado de la base de datos. Las funciones no deterministas pueden devolver resultados diferentes cada vez que se les llama con un conjunto específico de valores de entrada, incluso si el estado de la base de datos al que acceden sigue siendo el mismo.

Diferencias entre procedimientos y funciones

Tipo de retorno: una función siempre devuelve un valor, mientras que un procedimiento almacenado no es obligatorio que lo haga.

Parámetros: un procedimiento almacenado puede tener parámetros de entrada y salida, mientras que una función no puede tener parámetros de salida.

Llamadas: una función se puede llamar desde un procedimiento almacenado, pero no al revés.

Instrucciones :una función solo permite una instrucción SELECT, mientras que un procedimiento almacenado permite SELECT, INSERT, UPDATE y DELETE.

Transacciones: un procedimiento almacenado puede administrar transacciones, pero una función no.

Uso en declaraciones SELECT: una función se puede incrustar en una declaración SELECT, pero un procedimiento almacenado no.
