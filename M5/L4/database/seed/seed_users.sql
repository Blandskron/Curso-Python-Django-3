INSERT INTO usuarios (id, nombre, email, password_hash, rol, estado)
VALUES
    (1, 'Admin Principal', 'admin@ecommerce.test', 'hash_admin_demo', 'admin', 'activo'),
    (2, 'Cliente Activo Uno', 'cliente1@ecommerce.test', 'hash_cliente_1', 'cliente', 'activo'),
    (3, 'Cliente Activo Dos', 'cliente2@ecommerce.test', 'hash_cliente_2', 'cliente', 'activo'),
    (4, 'Cliente Bloqueado', 'bloqueado@ecommerce.test', 'hash_bloqueado', 'cliente', 'bloqueado'),
    (5, 'Cliente Eliminado', 'eliminado@ecommerce.test', 'hash_eliminado', 'cliente', 'eliminado')
ON CONFLICT (id) DO UPDATE SET
    nombre = EXCLUDED.nombre,
    email = EXCLUDED.email,
    rol = EXCLUDED.rol,
    estado = EXCLUDED.estado;

SELECT setval('usuarios_id_seq', GREATEST((SELECT MAX(id) FROM usuarios), 1), TRUE);
