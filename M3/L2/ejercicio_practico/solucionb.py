b = range(3, 10) + range(20, 23)

b[9]
complex(b[0], b[1])

"""
Traceback (most recent call last):
  File "d:\SUSTANTIVA\Curso-Python-Django-3\M3\L2\ejercicio_practico\explicacion.py", line 1, in <module>
    b = range(3, 10) + range(20, 23)
        ~~~~~~~~~~~~~^~~~~~~~~~~~~~~
TypeError: unsupported operand type(s) for +: 'range' and 'range'
"""
