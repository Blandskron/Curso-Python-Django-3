# Documentación del Proyecto

Este documento describe la arquitectura y los detalles técnicos del proyecto desarrollado durante el **Bootcamp: Desarrollo de Aplicaciones Full Stack Python Trainee V2.0**.

## Arquitectura del Proyecto

El proyecto está construido bajo una arquitectura **Cliente-Servidor** estándar, separando claramente el desarrollo del Frontend y el Backend:

- **Frontend:** Interfaces de usuario construidas con **HTML5, CSS3, JavaScript (ES6+)**, utilizando **Bootstrap** para el diseño responsivo y **jQuery** para la manipulación del DOM.
- **Backend:** Desarrollado utilizando **Python (3.5+)** y el framework **Django (V2)**, siguiendo el patrón arquitectónico MVT (Modelo-Vista-Template).
- **Base de Datos:** Se utilizan motores relacionales dependiendo del entorno (desarrollo/producción) tales como **PostgreSQL**, **MySQL** y **SQLite**. Todo esto integrado y consultado mediante el potente ORM (Object-Relational Mapping) nativo de Django.

## Requisitos del Entorno (Prerrequisitos)

- Python 3.5 o superior instalado.
- Pip (Gestor de paquetes de Python).
- Git instalado en tu máquina local.
- Visual Studio Code u otro IDE de preferencia.

## Configuración Local

Sigue estos pasos para levantar el entorno de desarrollo localmente:

1. **Clonar el repositorio:**
   ```bash
   git clone <URL_DEL_REPOSITORIO>
   cd Curso-Python-Django-3
   ```

2. **Crear y activar un entorno virtual:**
   ```bash
   python -m venv venv
   source venv/bin/activate  # En sistemas Linux/Mac
   venv\Scripts\activate     # En sistemas Windows
   ```

3. **Instalar dependencias:**
   *(Asegúrate de tener un archivo `requirements.txt`)*
   ```bash
   pip install -r requirements.txt
   ```

4. **Configurar la base de datos (Migraciones):**
   ```bash
   python manage.py makemigrations
   python manage.py migrate
   ```

5. **Ejecutar el servidor de desarrollo local:**
   ```bash
   python manage.py runserver
   ```
