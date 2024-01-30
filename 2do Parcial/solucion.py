# Ejercicio 1
def intercalar(s1: list, s2: list) -> list:
    res: list = []
    for i in range(0, len(s1), 1):
        res.append(s1[i])
        res.append(s2[i])
    return res

# Ejercicio 2
def pos_nesima_aparicion(s: list, n: int, elem: int) -> int:
   res: int = 0
   contador: int = 0
   l: list = [] + s
   while contador < n:
       if not elem in l:
           res = -1
           return res
       else:
            indice: int = l.index(elem)
            contador += 1
            if n == 1:
                res = indice
            elif contador == n:
                res += indice
            else:
                res += indice + 1
       l = l[indice + 1:]
   return res

# Ejercicio 3
def matriz_espejada(m: list) -> bool:
    for fila in m:
        mitad: int = len(fila) // 2
        for i in range(0, mitad, 1):
            if fila[i] != fila[len(fila) - 1 - i]:
                return False
    return True

# Ejercicio 4
def cuenta_posiciones_por_caballo(caballos: list, carreras: dict) -> dict:
    res: dict = {}
    lista_carerra: list = carreras.keys()
    for caballo in caballos:
        res[caballo] = [0] * len(caballos)
        for carerra in lista_carerra:
            indice: int = carreras[carerra].index(caballo)
            res[caballo][indice] += 1
    return res