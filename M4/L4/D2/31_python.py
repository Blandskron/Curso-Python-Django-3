"""
Módulo de Excepciones Personalizadas
Este archivo centraliza la gestión de errores de la aplicación.
"""

class AppError(Exception):
    """
    Clase base para todas las excepciones del proyecto.
    Permite capturar cualquier error propio de la app con un solo except.
    """
    def __init__(self, message: str, status_code: int = 500):
        super().__init__(message)
        self.message = message
        self.status_code = status_code


class ValidationError(AppError):
    """Lanzada cuando los datos de entrada no son válidos."""
    def __init__(self, message: str):
        super().__init__(message, status_code=400)


class ResourceNotFoundError(AppError):
    """Lanzada cuando un recurso (usuario, archivo, etc.) no existe."""
    def __init__(self, resource_name: str, resource_id: any = None):
        if resource_id:
            msg = f"El recurso '{resource_name}' con ID {resource_id} no fue encontrado."
        else:
            msg = f"El recurso '{resource_name}' no existe."
        super().__init__(msg, status_code=404)


class UnauthorizedError(AppError):
    """Lanzada cuando el usuario no tiene permisos para una acción."""
    def __init__(self, message: str = "No tienes permisos para realizar esta acción."):
        super().__init__(message, status_code=403)


class DatabaseError(AppError):
    """Lanzada para errores internos de persistencia de datos."""
    def __init__(self, message: str = "Error interno en el servidor de datos."):
        super().__init__(message, status_code=500)