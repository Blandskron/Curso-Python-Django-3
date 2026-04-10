# 25_python.py
# listas: creación, modificación y slicing
"""
Lista completa: [100, 2, 3, 4, 5, 6]
Primeros 3: [100, 2, 3]
Últimos 2: [5, 6]
Sin el 4: [100, 2, 3, 5, 6]
"""
#index     0  1  2
numeros = [1, 2, 3]
numeros.append(4) # [1, 2, 3, 4]
numeros.extend([5, 6]) # [1, 2, 3, 4, 5, 6]
numeros[0] = 100 # [100, 2, 3, 4, 5, 6]

print("Lista completa:", numeros) # [100, 2, 3, 4, 5, 6]
print("Primeros 3:", numeros[:3]) # [100, 2, 3]
print("Últimos 2:", numeros[-2:]) # [5, 6]

if 4 in numeros:
    numeros.remove(4)
    """
    numeros.pop(numeros.index(4)) # otra forma de eliminar el 4
    del numeros[numeros.index(4)] # otra forma de eliminar el 4
    del numeros[3] # otra forma de eliminar el 4
    """
print("Sin el 4:", numeros) # [100, 2, 3, 5, 6]
