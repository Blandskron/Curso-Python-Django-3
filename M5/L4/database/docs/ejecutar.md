# Ejecutar Ecommerce MVP Database en Windows

Esta documentación explica cómo ejecutar automáticamente toda la base de datos del proyecto ecommerce MVP usando PostgreSQL y `psql` en Windows. Basado en el flujo que ya ejecutaste correctamente. 

---

# 1. Abrir PostgreSQL SQL Shell

Abrir:

```text
SQL Shell (psql)
```

---

# 2. Conectarse a PostgreSQL

Ingresar:

```text
Server [localhost]: localhost
Database [postgres]: ecommerce_db
Port [5432]: 5432
Username [postgres]: postgres
Password: TU_PASSWORD
```

---

# 3. Cambiarse a la carpeta del proyecto

IMPORTANTE:

En `psql` los comandos usan:

```text
\
```

y no:

```text
/
```

Ejecutar:

```sql
\cd 'C:/Users/BlandskronNotebook/Documents/blandskron/ecommerce/database'
```

---

# 4. Verificar archivos del proyecto

Ejecutar:

```sql
\! dir
```

Debe mostrar algo similar:

```text
schema
functions
triggers
constraints
seed
tests
run_all.sql
README.md
```

---

# 5. Ejecutar toda la base automáticamente

Ejecutar:

```sql
\i run_all.sql
```

Esto ejecutará automáticamente:

```text
✓ tablas
✓ funciones
✓ triggers
✓ constraints
✓ datos seed
```

---

# 6. Resultado esperado

Si todo funciona correctamente aparecerán mensajes como:

```text
CREATE TABLE
CREATE FUNCTION
CREATE TRIGGER
INSERT 0 5
UPDATE 1
```

---

# 7. Sobre los NOTICE

Mensajes como:

```text
NOTICE: trigger no existe, omitiendo
```

NO son errores.

Significa que el script está preparado para:

```text
DROP TRIGGER IF EXISTS
```

y eso es correcto.

---

# 8. Validar que la base quedó creada

Puedes comprobar tablas ejecutando:

```sql
\dt
```

Debe mostrar:

```text
usuarios
categorias
productos
stock_productos
pedidos
detalle_pedidos
```

---

# 9. Ejecutar pruebas manuales

Para ejecutar tests:

```sql
BEGIN;

\i tests/test_valid_sale.sql

ROLLBACK;
```

Esto permite probar:

```text
✓ ventas
✓ stock
✓ triggers
✓ validaciones
```

sin alterar permanentemente la base.

---

# 10. Flujo recomendado diario

## Primera vez

```sql
\cd 'RUTA_DEL_PROYECTO/database'
\i run_all.sql
```

---

## Ver tablas

```sql
\dt
```

---

## Ejecutar pruebas

```sql
BEGIN;
\i tests/test_valid_sale.sql
ROLLBACK;
```

---

# 11. Recomendación importante

Agregar al inicio de `run_all.sql`:

```sql
\set ON_ERROR_STOP on
```

Esto hace que:

```text
si ocurre un error
todo se detenga automáticamente
```

evitando bases inconsistentes.

---

# 12. Estado actual del proyecto

Tu ejecución ya creó correctamente:

```text
✓ tablas
✓ funciones
✓ triggers
✓ constraints
✓ datos seed
✓ automatizaciones
```

La base ecommerce MVP ya quedó funcional y lista para comenzar integración con backend o pruebas SQL avanzadas.
