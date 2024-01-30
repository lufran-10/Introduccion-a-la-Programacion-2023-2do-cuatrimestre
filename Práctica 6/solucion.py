import math

# Ejercicio 1.1
def imprimir_hola_mundo() -> None:
    print ("¡Hola mundo!")

# Ejercicio 1.2
def imprimir_un_verso() -> None:
    print ("Somewhere over the rainbow\nWay up high\nAnd the dreams that you dream of\nOnce in a lullaby, oh")

# Ejercicio 1.3
def raiz_de_dos() -> float:
    return round(math.sqrt(2), 4)

# Ejercicio 1.4
def factorial_de_dos() -> int:
    return math.factorial(2)
 
# Ejercicio 1.5
def perimetro() -> float:
    return 2 * math.pi

# Ejercicio 2.1
def imprimir_saludo(nombre: str) -> None:
    print("Hola " + nombre)

# Ejercicio 2.2
def raiz_cuadrada_de(numero: int) -> float:
    return math.sqrt(numero)

# Ejercicio 2.3
def farenheit_a_celsius(t: float) -> float:
    return (t - 32) * 5 / 9

# Ejercicio 2.4
def imprimir_dos_veces(estribillo: str) -> None:
    print(estribillo*2)

# Ejercicio 2.5
def es_multiplo_de(n: int, m: int) -> bool:
    return n % m == 0

# Ejercicio 2.6
def es_par(numero: int) -> bool:
    return es_multiplo_de(numero, 2)

# Ejercicio 2.7
def cantidad_de_pizzas(comensales: int, min_cant_de_porciones:int) -> int:
    return math.ceil(comensales * min_cant_de_porciones / 8)

# Ejercicio 3.1
def alguno_es_0(numero1: float, numero2: float) -> bool:
    return numero1 == 0 or numero2 == 0

# Ejercicio 3.2
def ambos_son_0(numero1: float, numero2: float) -> bool:
    return numero1 == 0 and numero2 == 0

# Ejercicio 3.3
def es_nombre_largo(nombre: str) -> bool:
    return len(nombre) >= 3 and len(nombre) <= 8

# Ejercicio 3.4
def es_bisiesto(año: int) -> bool:
    return año % 400 == 0 or (año % 4 == 0 and not año % 100 == 0)

# Ejercicio 4.1
def peso_pino(altura: float) -> float:
    if altura > 3:
        return 900 + (altura - 3) * 200
    else:
        return altura * 300

# Ejercicio 4.2
def es_peso_util(peso: float) -> bool:
    return peso >= 400 and peso <= 1000

# Ejercicio 4.3
def sirve_pino(altura: float) -> bool:
    peso: float = 0
    if altura > 3:
        peso = 900 + (altura - 3) * 200
    else:
        peso = altura * 300
    return peso >= 400 and peso <= 1000

# Ejercicio 4.4
def sirve_pino_comp(altura: float) -> bool:
    return es_peso_util(peso_pino(altura))

# Ejercicio 5.1
def devolver_el_doble_si_es_par(numero: int) -> int:
    if es_par(numero):
        return numero * 2
    else:
        return numero

# Ejercicio 5.2
def devolver_valor_si_es_par_sino_el_que_sigue(numero: int) -> int:
    if es_par(numero):
        return numero
    else:
        return numero + 1

# Ejercicio 5.3
def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(numero: int) -> int:
    if es_multiplo_de(numero, 3):
        return numero * 2
    elif es_multiplo_de(numero, 9):
        return numero * 3
    else:
        return numero

# Ejercicio 5.4
def lindo_nombre(nombre: str) -> str:
    if len(nombre) >= 5:
        return "Tu nombre tiene muchas letras!"
    else:
        return "Tu nombre tiene menos de 5 caracteres"

# Ejercicio 5.5
def el_rango(numero: int):
    if numero < 5:
        print("Menor a 5")
    elif numero >= 10 and numero <= 20:
        print("Entre 10 y 20")
    elif numero > 20:
        print("Mayor a 20")

# Ejercicio 5.6
def adonde_ir(genero: str, edad: int) -> None:
    if (genero == "F" and edad >= 60) or (genero == "M" and edad >= 65) or edad < 18:
        print("Andá de vacaciones")
    else:
        print("Te toca trabajar")

# Ejercicio 6.1
def numeros_del_1_10_while() -> None:
    i: int = 1
    while i <= 10:
        print(i)
        i = i + 1

# Ejercicio 6.2
def numeros_pares_entre_10_40_while() -> None:
    i: int = 10
    while i <= 40:
        print(i)
        i = i + 2

# Ejercicio 6.3
def imprimir_eco_while() -> None:
    i: int = 1
    while i <= 10:
        print("eco")
        i = i + 1

# Ejercicio 6.4
def despegar_while(numero: int) -> None:
    while numero >= 1:
        print(numero)
        numero -= 1
    print("Despegue")

# Ejercicio 6.5
def viaje_al_pasado_while(año_partida: int, año_llegada: int) -> None:
    while año_partida > año_llegada:
        año_partida -= 1
        print("Viajó un año al pasado, estamos en el año: " + str(año_partida))

# Ejercicio 6.6
def viaje_a_conocer_aristoteles_while(año_partida: int) -> None:
    while año_partida > 384:
        año_partida -= 20
        print("Viajó veinte años al pasado, estamos en el año: " + str(año_partida))

# Ejercicio 7.1
def numeros_del_1_10_for() -> None:
    for num in range (1, 11, 1):
        print(num)

# Ejercicio 7.2
def numeros_pares_entre_10_40_for() -> None:
    for num in range (10, 42, 2):
        print(num)

# Ejercicio 7.3
def imprimir_eco_for() -> None:
    for num in range (1, 11, 1):
        print("eco")

# Ejercicio 7.4
def despegar_for(numero: int) -> None:
    for n in range (numero, 0, -1):
        print(n)
    print("Despegue")

# Ejercicio 7.5
def viaje_al_pasado_for(año_partida: int, año_llegada: int) -> None:
    for año in range (año_partida - 1, año_llegada - 1, -1):
        print("Viajó un año al pasado, estamos en el año: " + str(año))

# Ejercicio 7.6
def viaje_a_conocer_aristoteles_for(año_partida: int) -> None:
    for año in range (año_partida - 20, 364, -20):
        print("Viajó veinte años al pasado, estamos en el año: " + str(año))
