CREATE TABLE usuarios (
  usuarios_id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  rol VARCHAR(50) NOT NULL,
  CONSTRAINT rol_check CHECK (rol IN ('ADMIN','USER'))
);

CREATE TABLE categorias (
  categorias_id SERIAL PRIMARY KEY,
  categoria VARCHAR(50) NOT NULL
);

CREATE TABLE productos (
  productos_id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  descripcion TEXT,
  precio DECIMAL(10,2) NOT NULL,
  categorias_id INT,
  FOREIGN KEY (categorias_id) REFERENCES categorias(categorias_id)
);

CREATE TABLE detalle_pedidos (
  detalle_pedidos_id SERIAL PRIMARY KEY,
  productos_id INT,
  cantidad INT NOT NULL,
  total DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (productos_id) REFERENCES productos(productos_id)
);

CREATE TABLE pedidos (
  pedidos_id SERIAL PRIMARY KEY,
  usuario_id INT,
  detalle_pedidos_id INT,
  FOREIGN KEY (usuario_id) REFERENCES usuarios(usuarios_id),
  FOREIGN KEY (detalle_pedidos_id) REFERENCES detalle_pedidos(detalle_pedidos_id)
);

CREATE TABLE stock (
  stock_id SERIAL PRIMARY KEY,
  productos_id INT,
  cantidad INT NOT NULL,
  FOREIGN KEY (productos_id) REFERENCES productos(productos_id)
);
