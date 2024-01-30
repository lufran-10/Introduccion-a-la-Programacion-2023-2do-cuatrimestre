-- Práctica 5
-- Ejercicio 1.1
longitud:: [t] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

-- Ejercicio 1.2
ultimo:: [t] -> t
ultimo (x:xs) | longitud (x:xs) == 1 = x
              | otherwise = ultimo xs

-- Ejercicio 1.3
principio:: [t] -> [t]
principio (x:xs) | longitud (x:xs) == 1 = []
                 | otherwise = x : principio xs

-- Ejercicio 1.4
reverso:: [t] -> [t]
reverso [] = []
reverso (x:xs) = reverso xs ++ [x]

-- Ejercicio 2.1
pertenece:: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece x (y:ys) | x == y = True
                   | otherwise = pertenece x ys

-- Ejercicio 2.2
todosIguales:: (Eq t) => [t] -> Bool
todosIguales (x:xs) | xs == [] = True
                    | x /= head xs = False
                    | otherwise = todosIguales xs

-- Ejercicio 2.3
todosDistintos:: (Eq t) => [t] -> Bool
todosDistintos (x:xs) | xs == [] = True
                      | x == head xs = False
                      | otherwise = todosDistintos xs

-- Ejercicio 2.4
hayRepetidos:: (Eq t) => [t] -> Bool
hayRepetidos [] = False
hayRepetidos (x:xs) = pertenece x xs || hayRepetidos xs

-- Ejercicio 2.5
quitar:: (Eq t) => t -> [t] -> [t]
quitar y [] = []
quitar y (x:xs) | y == x = xs
                | otherwise = x : quitar y xs

-- Ejercicio 2.6
quitarTodos:: (Eq t) => t -> [t] -> [t]
quitarTodos y [] = []
quitarTodos y (x:xs) | y == x = quitarTodos y xs
                     | otherwise = x : quitarTodos y xs

-- Ejercicio 2.7
eliminarRepetidos:: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos (x:xs) = x : eliminarRepetidos (quitarTodos x xs)

-- Ejercicio 2.8
mismosElementos:: (Eq t) => [t] -> [t] -> Bool
mismosElementos [] [] = True
mismosElementos _ [] = False
mismosElementos [] _ = False
mismosElementos (x:xs) [y] = pertenece y (x:xs)
mismosElementos [x] (y:ys) = pertenece x (y:ys)
mismosElementos (x:xs) (y:ys) | pertenece x (y:ys) = mismosElementos xs (y:ys)
                              | pertenece y (x:xs) = mismosElementos (x:xs) ys
                              | otherwise = False

-- Ejercicio 2.9
capicua:: (Eq t) => [t] -> Bool
capicua (x:xs) = (x:xs) == reverso (x:xs)

-- Ejercicio 3.1
sumatoria:: [Integer] -> Integer
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

-- Ejercicio 3.2
productoria:: [Integer] -> Integer
productoria [] = 0
productoria [x] = x
productoria (x:xs) = x * productoria xs

-- Ejercicio 3.3
maximo:: (Ord t) => [t] -> t
maximo [x] = x
maximo (x:y:xs) |x > y = maximo (x:xs)
                |otherwise = maximo (y:xs)

-- Ejercicio 3.4
sumarN:: Integer -> [Integer] -> [Integer]
sumarN n [] = []
sumarN n (x:xs) = x + n : sumarN n xs

-- Ejercicio 3.5
sumarElPrimero:: [Integer] -> [Integer]
sumarElPrimero (x:xs) = sumarN x (x:xs)

-- Ejercicio 3.6
sumarElUltimo:: [Integer] -> [Integer]
sumarElUltimo (x:xs) = reverso (sumarElPrimero (reverso (x:xs)))

-- Ejercicio 3.7
pares:: [Integer] -> [Integer]
pares [] = []
pares (x:xs) | mod x 2 == 0 = x : pares xs
             | otherwise = pares xs

-- Ejercicio 3.8
multiplosDeN:: Integer -> [Integer] -> [Integer]
multiplosDeN _ [] = []
multiplosDeN n (x:xs) | mod x n == 0 = x : multiplosDeN n xs
                      | otherwise = multiplosDeN n xs

-- Ejercicio 3.9
eliminar:: (Eq t) => t -> [t] -> [t]
eliminar _ [] = []
eliminar m (x:xs) |x == m = xs
                  |otherwise = x : eliminar m xs

ordenar:: (Ord t) => [t] -> [t]
ordenar [] = []
ordenar xs = ordenar (eliminar (maximo xs) xs) ++ [maximo xs]

-- Ejercicio 4.1
sacarBlancosRepetidos:: [Char] -> [Char]
sacarBlancosRepetidos [x] = [x]
sacarBlancosRepetidos (x:y:xs) | (x == ' ') && (y == ' ') = sacarBlancosRepetidos (y:xs)
                               | otherwise = x : sacarBlancosRepetidos (y:xs)

-- Ejercicio 4.2
contarEspacios:: [Char] -> Integer
contarEspacios [] = 0
contarEspacios (x:xs) | x == ' ' = 1 + contarEspacios xs
                      | otherwise = contarEspacios xs

espacioEnExtremo:: [Char] -> Integer
espacioEnExtremo (x:xs) | x == ' ' = -1
                        | otherwise = 0

contarPalabras:: [Char] -> Integer
contarPalabras (x:xs) = contarEspacios (sacarBlancosRepetidos (x:xs)) + espacioEnExtremo (x:xs) + espacioEnExtremo (reverso (x:xs)) + 1

-- Ejercicio 4.3
limpiarPrimerEspacio:: [Char] -> [Char]
limpiarPrimerEspacio (x:xs) | x == ' ' = xs
                            | otherwise = (x:xs)

limpiarUltimoEspacio:: [Char] -> [Char]
limpiarUltimoEspacio (x:[]) | x == ' ' = []
                            | otherwise = [x]
limpiarUltimoEspacio (x:xs) = x : limpiarUltimoEspacio xs

primeraPalabra:: [Char] -> [Char]
primeraPalabra [] = []
primeraPalabra (x:xs) | x == ' ' = []
                      | otherwise = x : primeraPalabra xs

eliminarLetras:: [Char] -> [Char]
eliminarLetras [] = []
eliminarLetras (x:xs) | x /= ' ' = eliminarLetras xs
                      | otherwise = (x:xs)

sacarPalabra:: [Char] -> [[Char]]
sacarPalabra [] = []
sacarPalabra (x:xs) | x == ' ' = sacarPalabra xs
                    | otherwise = primeraPalabra (x:xs) : [] ++ sacarPalabra (eliminarLetras (x:xs))

palabras:: [Char] -> [[Char]]
palabras [] = []
palabras xs = sacarPalabra (limpiarUltimoEspacio (limpiarPrimerEspacio (sacarBlancosRepetidos xs)))

-- Ejercicio 4.4
compararLongitud:: [[Char]] -> [Char]
compararLongitud [x] = x
compararLongitud (x:xs) | longitud x <= longitud (head xs) = compararLongitud xs
                        | otherwise = compararLongitud (xs ++ [x])

palabraMasLarga:: [Char] -> [Char]
palabraMasLarga (x:xs) = compararLongitud (palabras (x:xs))

-- Ejercicio 4.5
aplanar:: [[Char]] -> [Char]
aplanar [] = []
aplanar (x:xs) = x ++ aplanar xs

-- Ejercicio 4.6
aplanarConBlancos:: [[Char]] -> [Char]
aplanarConBlancos [[]] = []
aplanarConBlancos [x] = x
aplanarConBlancos (x:xs) = x ++ " " ++ aplanarConBlancos xs

-- Ejercicio 4.7
espaciosEnBlanco:: Integer -> [Char]
espaciosEnBlanco 1 = " "
espaciosEnBlanco n | n >= 2 = " " ++ espaciosEnBlanco (n - 1)

aplanarConNBlancos:: [[Char]] -> Integer -> [Char]
aplanarConNBlancos (x:xs) 0 = aplanar (x:xs)
aplanarConNBlancos [x] _ = x
aplanarConNBlancos (x:xs) n = x ++ (espaciosEnBlanco n) ++ aplanarConNBlancos xs n

-- Ejercicio 5.1
sumaAcumulada:: (Num t) => [t] -> [t]
sumaAcumulada [] = []
sumaAcumulada [x] = [x]
sumaAcumulada (x:y:xs) = x : sumaAcumulada ((x + y):xs)

-- Ejercicio 5.2
menorDivisorDesde:: Integer -> Integer -> Integer
menorDivisorDesde n k |mod n k == 0 = k
                      |otherwise = menorDivisorDesde n (k + 2)

menorDivisor:: Integer -> Integer
menorDivisor n |mod n 2 == 0 = 2
               |otherwise = menorDivisorDesde n 3

esPrimo:: Integer -> Bool
esPrimo n = n == menorDivisor n

factorizar:: [Integer] -> Integer -> [Integer]
factorizar (x:xs) n | x == 1 = []
                    | esPrimo n && mod x n == 0 = n : factorizar ((div x n):xs) (n + 1)
                    | otherwise = factorizar (x:xs) (n + 1)

descomponerEnPrimos:: [Integer] -> [[Integer]]
descomponerEnPrimos [] = []
descomponerEnPrimos (x:xs) = factorizar (x:xs) 2 : descomponerEnPrimos xs