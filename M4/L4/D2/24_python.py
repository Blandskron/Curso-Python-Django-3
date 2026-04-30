# Ejemplo 24: Mixins para auditar operaciones

class AuditMixin:
    def auditar(self, mensaje: str) -> None:
        print(f"[AUDIT] {mensaje}")


class ServicioTransferencia(AuditMixin):
    def transferir(self, monto: float) -> None:
        self.auditar(f"Transferencia de {monto}")
        # lógica de transferencia

    def recibir(self, monto: float) -> None:
        self.auditar(f"Monto recibido de {monto}")

"""
Servicio Transferencia
______________________
1 - [AUDIT] Transferencia de 450.00
2 - [AUDIT] Monto recibido de 500.0
"""
transferencia = ServicioTransferencia()
transferencia.transferir(450.00)
recibir = ServicioTransferencia()
recibir.recibir(500.00)
