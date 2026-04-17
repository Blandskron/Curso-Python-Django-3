# 6) List comprehension: transformar + filtrar
numeros = list(range(10))

cuadrados_pares = [n**2 for n in numeros if n % 2 == 0]

numeros2 = [] 
for n in numeros:
    if n % 2 == 0:
        numeros2.append(n ** 2)

print(f"List comprehension: {cuadrados_pares}")
print(f"List append method: {numeros2}")

"""
List comprehension: [0, 4, 16, 36, 64]
List append method: [0, 4, 16, 36, 64]
"""