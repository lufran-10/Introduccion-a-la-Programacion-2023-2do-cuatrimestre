# Práctica 8 

from queue import LifoQueue as Pila
from queue import Queue as Cola
import random

# Ejercicio 1.1
def contar_lineas(nombre_archivo: str) -> int:
    archivo = open(nombre_archivo, "r")
    lineas: list = archivo.readlines()
    archivo.close()
    return len(lineas)

# Ejercicio 1.2
def existe_palabra(palabra: str, nombre_archivo: str) -> bool:
    archivo = open(nombre_archivo, "r")
    lineas: list = archivo.readlines()
    archivo.close()
    for linea in lineas:
        if palabra.lower() in linea.lower():
            return True
    return False

# Ejercicio 1.3
def cantidad_apariciones(nombre_archivo: str, palabra: str) -> int:
    res: int = 0
    archivo = open(nombre_archivo, "r")
    lineas: list = archivo.readlines()
    for linea in lineas:
        res += linea.lower().count(palabra.lower())
    archivo.close()
    return res
    
# Ejercicio 2
def clonar_sin_comentarios(nombre_archivo: str) -> None:
    archivo = open(nombre_archivo, "r")
    archivo_sin_comentarios = open("clonadoSinComentarios.txt", "w")
    lineas: list = archivo.readlines()
    for linea in lineas:
        if len(linea.strip()) == 0 or not linea.strip()[0] == "#":
            archivo_sin_comentarios.write(linea)
    archivo.close()
    archivo_sin_comentarios.close()

# Ejercicio 3
def revertir_lineas(nombre_archivo: str) -> None:
    archivo = open(nombre_archivo, "r")
    archivo_nuevo = open("reverso.txt", "w")
    lineas: list = archivo.readlines()
    for i in range(len(lineas) - 1, -1, -1):
        archivo_nuevo.write(lineas[i])
    archivo.close()
    archivo_nuevo.close()

# Ejercicio 4
def agregar_frase_final(nombre_archivo: str, frase: str) -> None:
    archivo = open(nombre_archivo, "a", encoding="UTF-8")
    archivo.write(" " + frase)
    archivo.close()

# Ejercicio 5
def agregar_frase_principio(nombre_archivo: str, frase: str) -> None:
    archivo = open(nombre_archivo, "r+", encoding="UTF-8")
    contenido: str = archivo.read()
    archivo.seek(0, 0)
    archivo.write(frase + " " + contenido)
    archivo.close()

# Ejercicio 6
def leer_archivo_binario(nombre_archivo: str):
    archivo = open(nombre_archivo, "rb")
    bytes = archivo.read()
    palabra: str = ""
    res: list = []
    for byte in bytes:
        caracter: str = chr(byte)
        if (caracter >= "A" and caracter <= "Z") or (caracter >= "a" and caracter <= "z") or (caracter >= "0" and caracter <= "9") or caracter == " " or caracter == "_":
            palabra += caracter
        else:
            if len(palabra) >= 5:
                res.append(palabra)
            palabra = ""
    archivo.close()
    return res

# Ejercicio 7
def promedio_estudiante(lu: str) -> float:
    archivo = open("notas.csv", "r", encoding="UTF-8")
    lineas: list = archivo.readlines()
    notas: float = 0
    cont: int = 0
    for linea in lineas:
        if lu in linea:
            info: list = linea.split(", ")
            notas += float(info[-1])
            cont += 1
    archivo.close()
    return notas / cont

# Ejercicio 8
def generar_nros_al_azar_pila(n: int, desde: int, hasta: int) -> Pila:
    res: Pila = Pila()
    for i in range(0, n, 1):
        res.put(random.randint(desde, hasta))
    return res
    
# Ejercicio 9
def cantidad_elementos_pila(p: Pila) -> int:
    p_aux: Pila = Pila()
    res: int = 0
    while not p.empty():
        elemento = p.get()
        res += 1
        p_aux.put(elemento)
    while not p_aux.empty():
        elemento = p_aux.get()
        p.put(elemento)
    return res

# Ejercicio 10
def buscar_el_maximo_pila(p: Pila) -> int:
    p_aux: Pila = Pila()
    res: int = p.get()
    p_aux.put(res)
    while not p.empty():
        element: int = p.get()
        p_aux.put(element)
        if res < element:
            res = element
    while not p_aux.empty():
        p.put(p_aux.get())
    return res

# Ejercicio 11
def esta_bien_balanceada(s: str) -> bool:
    p: Pila = Pila()
    caracter: chr = ""
    parentesis_abiertos: int = 0
    for i in range(len(s) - 1, -1, -1):
        if s[i] != " ":
            p.put(s[i])
    while not p.empty():
        caracter = p.get()
        if caracter == "(":
            parentesis_abiertos += 1
        if caracter == ")":
            parentesis_abiertos -= 1
        if parentesis_abiertos < 0:
            return False
    if parentesis_abiertos > 0:
        return False
    else:
        return True

# Ejercicio 12
def es_un_numero(x: str) -> bool:
    return x == "+" or x == "-" or x == "*" or x == "/"

def evaluar_expresion(expresion: str) -> float:
    l: [str] = expresion.split(" ")
    p: Pila = Pila()
    for i in range(0, len(l), 1):
        if not es_un_numero(l[i]):
            p.put(l[i])
        elif l[i] == "+":
            operando_2: int = int(p.get())
            operando_1: int = int(p.get())
            p.put(operando_1 + operando_2)
        elif l[i] == "-":
            operando_2: int = int(p.get())
            operando_1: int = int(p.get())
            p.put(operando_1 - operando_2)
        elif l[i] == "*":
            operando_2: int = int(p.get())
            operando_1: int = int(p.get())
            p.put(operando_1 * operando_2)
        elif l[i] == "/":
            operando_2: int = int(p.get())
            operando_1: int = int(p.get())
            p.put(operando_1 / operando_2)
    return p.get()

# Ejercicio 13
def generar_nros_al_azar_cola(n: int, desde: int, hasta: int) -> Cola:
    res: Cola = Cola()
    p: Pila = generar_nros_al_azar_pila(n, desde, hasta)
    while not p.empty():
        res.put(p.get())
    return res

# Ejercicio 14
def cantidad_elementos_cola(c: Cola) -> int:
    res: int = 0
    c_aux: Cola = Cola()
    while not c.empty():
        c_aux.put(c.get())
        res += 1
    c = c_aux
    return res

# Ejercicio 15
def buscar_el_maximo_cola(c: Cola) -> int:
    c_aux: Cola = Cola()
    res: int = c.get()
    c_aux.put(res)
    while not c.empty():
        numero: int = c.get()
        c_aux.put(numero)
        if numero > res:
            res = numero
    c = c_aux
    return res

# Ejercicio 16.1
def armar_secuencia_de_bingo() -> Cola:
    c: Cola = Cola(maxsize=100)
    l: [int] = []
    while not c.full():
        number: int = random.randint(0, 99)
        if not number in l:
            l.append(number)
            c.put(number)
    return c

# Ejercicio 16.2
def jugar_carton_de_bingo(carton: [int], bolillero: Cola) -> int:
    aciertos: int = 0
    jugadas: int = 0
    c_aux: Cola = Cola()
    while aciertos < 12:
        numero: int = bolillero.get()
        if numero in carton:
            aciertos += 1
        jugadas += 1
        c_aux.put(numero)
    while not bolillero.empty():
        c_aux.put(bolillero.get())
    bolillero = c_aux
    return jugadas

# Ejercicio 17
def n_pacientes_urgentes(c: Cola) -> int:
    c_aux: Cola = Cola()
    res: int = 0
    while not c.empty():
        paciente: tuple = c.get()
        if paciente[0] >=1 and paciente[0] <= 3:
            res += 1
        c_aux.put(paciente)
    c = c_aux
    return res

# Ejercicio 18.2
def _a_clientes(c: Cola[(str, int, bool, bool)]) -> Cola[(str, int, bool, bool)]:
    prioridad: list = []
    preferencial: list = []
    resto: list = []
    c_aux: Cola = Cola()
    res: Cola = Cola()
    while not c.empty():
        cliente: tuple = c.get()
        if cliente[3] == True:
            prioridad.append(cliente)
        elif cliente[2] == True:
            preferencial.append(cliente)
        else:
            resto.append(cliente)
        c_aux.put(cliente)
    for i in range(0, len(prioridad), 1):
        res.put(prioridad[i])
    for j in range(0, len(preferencial), 1):
        res.put(preferencial[j])
    for k in range(0, len(resto), 1):
        res.put(resto[k])
    c = c_aux
    return res

# Ejercicio 19
def agrupar_por_longitud(nombre_archivo: str) -> dict:
    archivo = open(nombre_archivo, "r")
    d: dict = {}
    for linea in archivo.readlines():
        palabras = linea.split()
        for palabra in palabras:
            clave = len(palabra)
            if clave in d:
                d[clave] = d[clave] + 1
            else:
                d[clave] = 1
    archivo.close()
    return d

# Ejercicio 20
def promedio_alumnos(nombre_archivo: str) -> dict:
    archivo = open(nombre_archivo, "r", encoding="UTF-8")
    promedios: dict = {}
    lineas: list = archivo.readlines()
    for linea in lineas:
        lista = linea.split(", ")
        libreta_universitaria: str = lista[0]
        if not libreta_universitaria in promedios:
            promedios[libreta_universitaria] = promedio_estudiante(libreta_universitaria)
    archivo.close()
    return promedios

# Ejercicio 21
def frecuencias(nombre_archivo: str) -> dict:
    archivo = open(nombre_archivo, "r", encoding='utf8')
    d: dict = {}
    for linea in archivo.readlines():
        palabras = linea.split()
        for clave in palabras:
            if clave in d:
                d[clave] = d[clave] + 1
            else:
                d[clave] = 1
    archivo.close()
    return d

def palabra_mas_frecuente(nombre_archivo: str) -> str:
    d = frecuencias(nombre_archivo)
    res: str
    frecuencia_max: int = 0
    for palabra in d.keys():
        if d[palabra] > frecuencia_max:
            frecuencia_max = d[palabra]
            res = palabra
    return res

# Ejercicio 22.1
historiales: dict = {}
sitios_sacados: dict = {}

# Ejercicio 22.2
def visitar_sitio(historiales: dict, usuario: str, sitio: str):
    if not usuario in historiales:
        historial: Pila = Pila()
    else:
        historial = historiales[usuario]
    historial.put(sitio)
    historiales[usuario] = historial

# Ejercicio 22.3
def navegar_atras(historiales: dict, usuario: str):
    if usuario in historiales:
        historial = historiales[usuario]
        if not historial.empty():
            ultimo_sitio = historial.get()
            if not usuario in sitios_sacados:
                ultimos_sitios: Pila = Pila()
            else:
                ultimos_sitios = sitios_sacados[usuario]
            ultimos_sitios.put(ultimo_sitio)
            sitios_sacados[usuario] = ultimos_sitios

# Ejercicio 22.4
def navegar_adelante(historiales: dict, usuario: str):
    if usuario in historiales:
        historial = historiales[usuario]
        if usuario in sitios_sacados:
            ultimos_sitios = sitios_sacados[usuario]
            if not ultimos_sitios.empty():
                ultimo_sitio = ultimos_sitios.get()
                historial.put(ultimo_sitio)
                sitios_sacados[usuario] = ultimos_sitios

