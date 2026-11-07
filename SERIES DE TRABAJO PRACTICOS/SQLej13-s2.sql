CREATE DATABASE EJ13
GO
USE EJ13
GO

CREATE TABLE cliente
(
  id_cliente INT NOT NULL,
  CONSTRAINT PK_cliente_id PRIMARY KEY (id_cliente)
);
GO
CREATE TABLE vendedor
(
  id_vendedor INT NOT NULL,
  CONSTRAINT PK_vendedor_id PRIMARY KEY (id_vendedor)
);
GO
CREATE TABLE producto
(
  id_producto INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  id_vendedor INT NOT NULL,
  CONSTRAINT PK_producto_id PRIMARY KEY (id_producto),
  CONSTRAINT FK_producto_id_vendedor FOREIGN KEY (id_vendedor) REFERENCES vendedor(id_vendedor)
);
GO
CREATE TABLE categoria
(
  id_categoria INT NOT NULL,
  descripcioCat VARCHAR(200) NOT NULL,
  CONSTRAINT PK_categoria_id PRIMARY KEY (id_categoria)
);
GO
CREATE TABLE consulta
(
  id_consulta Int NOT NULL,
  descripcionCons VARCHAR(500) NOT NULL,
  fechaCons DATE NOT NULL,
  id_cliente INT NOT NULL,
  id_producto INT NOT NULL,
  id_categoria INT NOT NULL,
  CONSTRAINT PK_consulta_id PRIMARY KEY (id_consulta),
  CONSTRAINT FK_consulta_id_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
  CONSTRAINT FK_consulta_id_producto FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
  CONSTRAINT FK_consulta_id_categoria FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);
GO
CREATE TABLE respuesta
(
  id_respuesta INT NOT NULL,
  descripcionResp VARCHAR(500) NOT NULL,
  fechaResp DATE NOT NULL,
  id_consulta INT NOT NULL,
  CONSTRAINT PK_respuesta_id PRIMARY KEY (id_respuesta),
  CONSTRAINT FK_respuesta_id_consulta FOREIGN KEY (id_consulta) REFERENCES consulta(id_consulta)
);