SELECT * 
FROM productos p
JOIN categorias c ON p.categorias_id = c.categorias_id;

SELECT p.nombre AS producto, c.categoria
FROM productos p
JOIN categorias c ON p.categorias_id = c.categorias_id;

SELECT * FROM productos
WHERE nombre = 'Laptop';

SELECT p.productos_id, p.nombre, c.categoria
FROM productos p
JOIN categorias c ON p.categorias_id = c.categorias_id
WHERE c.categoria = 'Electronics';
