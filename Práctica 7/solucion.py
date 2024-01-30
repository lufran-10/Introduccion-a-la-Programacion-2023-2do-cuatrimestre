import random

# Ejercicio 1.1
def pertenece_in(s: [int], e: int) -> bool:
    return e in s

def pertenece_while(s: [int], e: int) -> bool:
    i: int = 0
    while i < len(s):
        if e == s[i]:
            return True
        i += 1
    return False

def pertenece_for(s: [int], e: int) -> bool:
    for num in s:
        if e == num:
            return True
    return False

# Ejercicio 1.2
def divide_a_todos(s: [int], e: int) -> bool:
    for num in s:
        if num % e != 0:
            return False
    return True

# Ejercicio 1.3
def suma_total_while(s: [int]) -> int:
    res: int = 0
    i: int = 0
    while i < len(s):
        res += s[i]
        i += 1
    return res

def suma_total_for(s: [int]) -> int:
    res: int = 0
    for num in s:
        res += num
    return res

# Ejercicio 1.4
def ordenados(s: [int]) -> bool:
    for i in range(0, len(s) - 1, 1):
        if s[i] >= s[i + 1]:
            return False
    return True

# Ejercicio 1.5
def palabra_larga(s: [str]) -> bool:
    for palabra in s:
        if len(palabra) > 7:
            return True
    return False

# Ejercicio 1.6
def palindromo(palabra: str) -> bool:
    i: int = 0
    f: int = len(palabra) - 1
    while i < f:
        if palabra[i] != palabra[f]:
            return False
        i += 1
        f -= 1
    return True

# Ejercicio 1.7
def es_un_numero(caracter: str) -> bool:
    return caracter <= "9" and caracter >= "0"

def es_mayuscula(caracter: str) -> bool:
    return caracter <= "Z" and caracter >= "A"

def es_minuscula(caracter: str) -> bool:
    return caracter <= "z" and caracter >= "a"

def fortaleza_contraseña(c: str) -> str:
    if len(c) < 5:
        return "ROJA"
    if len(c) < 9:
        return "AMARILLA"
    mayuscula: bool = False
    numero: bool = False
    minuscula: bool = False
    for i in range(0, len(c), 1):
        if es_un_numero(c[i]):
            numero = True
        if es_mayuscula(c[i]):
            mayuscula = True
        if es_minuscula(c[i]):
            minuscula = True
    if numero and mayuscula and minuscula:
        return "VERDE"
    return "AMARILLA"

# Ejercicio 1.8
def saldo(s: [(str, int)]) -> int:
    cuenta: int = 0
    for movimiento in s:
        if movimiento[0] == "R":
            cuenta -= movimiento[1]
        elif movimiento[0] == "I":
            cuenta += movimiento[1]
    return cuenta

# Ejercicio 1.9
def pertenece_a_palabra(palabar: str, letra: chr) -> bool:
    return letra in palabar

def vocales_distintas(palabra: str) -> bool:
    cant_vocales_dist: int = 0
    palabra_aux: str = palabra.lower()
    if pertenece_a_palabra(palabra_aux, "a"):
        cant_vocales_dist += 1
    if pertenece_a_palabra(palabra_aux, "e"):
        cant_vocales_dist += 1
    if pertenece_a_palabra(palabra_aux, "i"):
        cant_vocales_dist += 1
    if pertenece_a_palabra(palabra_aux, "o"):
        cant_vocales_dist += 1
    if pertenece_a_palabra(palabra_aux, "u"):
        cant_vocales_dist += 1
    if cant_vocales_dist >= 3:
        return True
    return False

# Ejercicio 2.1
def modificar_lista(s: [int]) -> [int]:
    for i in range(1, len(s), 2):
        s[i] = 0

# Ejercicio 2.2
def nueva_lista(s: [int]) -> [int]:
    res: [int] = [] + s
    for i in range(1, len(res), 2):
        res[i] = 0
    return res

# Ejercicio 2.3
def es_vocal(letra: str) -> bool:
    return letra == "a" or letra == "e" or letra == "i" or letra == "o" or letra == "u"

def palabra_sin_vocales(palabra: str) -> str:
    res: str = ""
    for i in range(0, len(palabra), 1):
        if not es_vocal(palabra[i].lower()):
            res += palabra[i]
    return res

# Ejercicio 2.4
def pertenece(s: list, e) -> bool:
    return e in s

def reemplaza_vocales(s: [chr]) -> [chr]:
    res: [chr] = []
    for letra in s:
        if pertenece(["a", "e", "i", "o", "u"], letra):
            res.append("_")
        else:
            res.append(letra)
    return res

# Ejercicio 2.5
def da_vuelta_str(s: [chr]) -> [chr]:
    res: [chr] = []
    for i in range(len(s) - 1, -1, -1):
        res.append(s[i])
    return res

# Ejercicio 2.6
def eliminar_repetidos(s: [chr]) -> [chr]:
    res: [chr] = []
    for i in range(0, len(s), 1):
        if not pertenece(s[i + 1:], s[i]):
            res.append(s[i])
    return res

# Ejercicio 3
def aprobado(notas: [int]) -> int:
    total: int = 0
    res: int = 1
    for nota in notas:
        if nota < 4:
            res = 3
            return res
        total += nota
    if total / len(notas) < 7:
        res = 2
    return res

# Ejercicio 4.1
def crear_lista_nombres() -> [str]:
    nombre: str = ""
    res: [str] = []
    while nombre.lower() != "listo":
        nombre = input("Escribir nombre de estudiante o listo: ")
        res.append(nombre)
    res.pop()
    return res

# Ejercicio 4.2
def cargar() -> tuple:
    return ("C", input("Monto a cargar: "))

def descargar() -> tuple:
    return ("D", input("Monto a descontar: "))

def historial_monedero() -> list:
    movimiento: str = ""
    res: list = []
    while movimiento != "X":
        movimiento = input("¿Qué desea hacer? ")
        if movimiento == "C":
            res.append(cargar())
        elif movimiento == "D":
            res.append(descargar())
    return res

# Ejercicio 4.3
def sacar_carta() -> int:
    posibilidades1: list = [1, 2, 3, 4, 5, 6, 7, 10, 11, 12]
    carta: int = 0
    while not carta in posibilidades1:
        carta = random.randint(1,12)
    return carta

def suma_de_cartas(carta, total) -> float:
    posibilidades2: list = [10, 11, 12]
    if carta in posibilidades2:
        total += 0.5
    else:
        total += carta
    return total

def siete_y_medio() -> list:
    jugada: str = ""
    historial: list = []
    total: int = 0
    carta: int = 0
    while jugada != "listo":
        jugada = input('Escriba "sacar" para obtener una carta o "listo" para plantarse: ')
        if jugada == "sacar":
            carta = sacar_carta()
            historial.append(carta)
            total = suma_de_cartas(carta, total)
        if total > 7.5:
            print("¡Perdiste!")
            return historial
    print("¡Ganaste!")
    return historial

# Ejercicio 5.1
def pertenece_a_cada_uno(s: [[int]], e: int) -> [bool]:
    res: [bool] = []
    for lista in s:
        res.append(pertenece(lista, e))
    return res

# Ejercicio 5.2
def es_matriz(s: [[int]]) -> bool:
    for i in range(0, len(s) - 1, 1):
        if len(s[i]) != len(s[i + 1]):
            return False
    return True

# Ejercicio 5.3
def filas_ordenadas(m: [[int]]) -> [bool]:
    res: [bool] = []
    for lista in m:
        res.append(ordenados(lista))
    return res

# Ejercicio 5.4
import numpy as np
def elevar_matriz(d: int, p: int) -> [[int]]:
    matriz = np.random.randint(0, 10, (d, d))
    return np.linalg.matrix_power(matriz, p)