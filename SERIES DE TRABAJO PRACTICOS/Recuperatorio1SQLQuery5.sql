CREATE TABLE Vehiculos
(
  id_vehiculo INT NOT NULL,
  patente VARCHAR(10) NOT NULL,
  color VARCHAR(20) NOT NULL,
  PRIMARY KEY (id_vehiculo),
  UNIQUE (patente)
);

CREATE TABLE Conductores
(
  id_conductor INT NOT NULL,
  DNI VARCHAR(10) NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  direccion VARCHAR(100) NOT NULL,
  telefono VARCHAR(15) NOT NULL,
  PRIMARY KEY (id_conductor),
  UNIQUE (telefono)
);

CREATE TABLE Vehiculos_Conductores
(
  id_vehiculo INT NOT NULL,
  id_conductor INT NOT NULL,
  FOREIGN KEY (id_vehiculo) REFERENCES Vehiculos(id_vehiculo),
  FOREIGN KEY (id_conductor) REFERENCES Conductores(id_conductor)
);

CREATE TABLE Niveles
(
  id_nivel INT NOT NULL,
  descripcion VARCHAR(50) NOT NULL,
  PRIMARY KEY (id_nivel)
);

CREATE TABLE Tipo_Vehiculo
(
  id_tipo_vehiculo INT NOT NULL,
  descripcion VARCHAR(50) NOT NULL,
  PRIMARY KEY (id_tipo_vehiculo)
);

CREATE TABLE Estacionamientos
(
  id_estacionamiento INT NOT NULL,
  numero_lugar INT NOT NULL,
  id_nivel INT NOT NULL,
  id_tipo_vehiculo INT NOT NULL,
  PRIMARY KEY (id_estacionamiento),
  FOREIGN KEY (id_nivel) REFERENCES Niveles(id_nivel),
  FOREIGN KEY (id_tipo_vehiculo) REFERENCES Tipo_Vehiculo(id_tipo_vehiculo),
  UNIQUE (numero_lugar)
);

CREATE TABLE Ingresos_Salidas
(
  id_ingreso_salida INT NOT NULL,
  fecha_ingreso DATE,
  fecha_salida DATE,
  tiempo_estimado VARCHAR(10) NOT NULL,
  id_vehiculo INT NOT NULL,
  id_conductor INT NOT NULL,
  id_estacionamiento INT NOT NULL,
  PRIMARY KEY (id_ingreso_salida),
  FOREIGN KEY (id_vehiculo) REFERENCES Vehiculos(id_vehiculo),
  FOREIGN KEY (id_conductor) REFERENCES Conductores(id_conductor),
  FOREIGN KEY (id_estacionamiento) REFERENCES Estacionamientos(id_estacionamiento)
);