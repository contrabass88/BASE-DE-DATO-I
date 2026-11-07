CREATE TABLE Vehiculos (
    id_vehiculo INT PRIMARY KEY AUTO_INCREMENT,
    patente VARCHAR(10) NOT NULL UNIQUE,
    color VARCHAR(20),
    tipo_vehiculo ENUM('Automovil', 'Motocicleta', 'Bicicleta', 'Otro') NOT NULL
);

CREATE TABLE Conductores (
    id_conductor INT PRIMARY KEY AUTO_INCREMENT,
    dni VARCHAR(10) NOT NULL UNIQUE,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE,
    direccion VARCHAR(100),
    telefono VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE Vehiculos_Conductores (
    id_vehiculo INT,
    id_conductor INT,
    PRIMARY KEY (id_vehiculo, id_conductor),
    FOREIGN KEY (id_vehiculo) REFERENCES Vehiculos(id_vehiculo),
    FOREIGN KEY (id_conductor) REFERENCES Conductores(id_conductor)
);

CREATE TABLE Niveles (
    id_nivel INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(50)
);

CREATE TABLE Estacionamientos (
    id_estacionamiento INT PRIMARY KEY AUTO_INCREMENT,
    id_nivel INT,
    numero_lugar INT NOT NULL,
    tipo_vehiculo ENUM('Automovil', 'Motocicleta', 'Bicicleta', 'Otro') NOT NULL,
    UNIQUE (id_nivel, numero_lugar),
    FOREIGN KEY (id_nivel) REFERENCES Niveles(id_nivel)
);


CREATE TABLE Ingresos_Salidas (
    id_ingreso_salida INT PRIMARY KEY AUTO_INCREMENT,
    id_vehiculo INT,
    id_conductor INT,
    id_estacionamiento INT,
    fecha_ingreso DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_salida DATETIME,
    tiempo_estimado VARCHAR(10) CHECK (tiempo_estimado IN ('Hora', 'Día', 'Semana', 'Mes')),
    FOREIGN KEY (id_vehiculo) REFERENCES Vehiculos(id_vehiculo),
    FOREIGN KEY (id_conductor) REFERENCES Conductores(id_conductor),
    FOREIGN KEY (id_estacionamiento) REFERENCES Estacionamientos(id_estacionamiento),
    CHECK (fecha_salida IS NULL OR fecha_salida >= fecha_ingreso)
);

