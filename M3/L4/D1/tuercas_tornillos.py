def resolver_acertijo_corregido():
    # Simulación: El bromista cambió todo.
    # Esta es una de las dos configuraciones posibles donde NINGUNA etiqueta coincide.
    cajas_reales = {
        'mezcla': 'tornillos',   # Etiqueta Mezcla -> Tiene Tornillos
        'tornillos': 'tuercas',  # Etiqueta Tornillos -> Tiene Tuercas
        'tuercas': 'mezcla'      # Etiqueta Tuercas -> Tiene Mezcla
    }

    print("--- Deducción Lógica ---")
    
    # PASO 1: Abrimos la caja que dice 'mezcla'
    abierta = 'mezcla'
    contenido_detectado = cajas_reales[abierta]
    print(f"1. Abrimos la caja '{abierta}' y encontramos: {contenido_detectado.upper()}")

    solucion = {}
    solucion['mezcla'] = contenido_detectado

    # PASO 2: Deducir las otras dos
    if contenido_detectado == 'tornillos':
        # La etiqueta 'tuercas' NO puede tener tuercas.
        # Solo quedan como contenidos posibles: 'mezcla' y 'tuercas'.
        # Si la etiqueta 'tuercas' tuviera 'tuercas', rompería la regla.
        # Si la etiqueta 'tornillos' tuviera 'tuercas', la etiqueta 'tuercas' tendría 'mezcla'.
        
        solucion['tornillos'] = 'tuercas'
        solucion['tuercas'] = 'mezcla'
        
    else: # Encontramos tuercas en la caja 'mezcla'
        solucion['tuercas'] = 'tornillos'
        solucion['tornillos'] = 'mezcla'

    print("\n--- Resultado Final (Ninguna etiqueta coincide) ---")
    for etiqueta, contenido in solucion.items():
        print(f"Etiqueta: {etiqueta:10} | Contenido Real: {contenido.upper()}")

if __name__ == "__main__":
    resolver_acertijo_corregido()