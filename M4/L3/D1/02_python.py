# Ejemplo 2: Visibilidad UML (+ público, # protegido, - privado) en Python
class CuentaBancaria:
    def __init__(self, numero: str, saldo_inicial: float):
        self.numero = numero          # +
        self._saldo = saldo_inicial   # #
        self.__pin = "1234"           # -

    def depositar(self, monto: float) -> None:
        self._saldo += monto

    def _aplicar_cargo(self, monto: float) -> None:
        self._saldo -= monto

    def __validar_pin(self, pin: str) -> bool:
        return pin == self.__pin

"""
CuentaBancaria
_______________
+ numero: str
# _saldo: float
- __pin: str
_______________
+ depositar(monto: float) -> None
+ _aplicar_cargo(monto: float) -> None
+ __validar_pin(pin: str) -> bool
"""