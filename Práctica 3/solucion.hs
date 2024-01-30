-- Práctica 3
-- Ejercicio 1 a
f1:: Int -> Int
f1 1 = 8
f1 4 = 131
f1 16 = 16

-- Ejercicio 1 b
g1:: Int -> Int
g1 8 = 16
g1 16 = 4
g1 131 = 1

-- Ejercicio 1 c
h:: Int -> Int
h 8 = f1 (g1 8)
h 16 = f1 (g1 16)
h 131 = f1 (g1 131)

k:: Int -> Int
k 1 = g1 (f1 1)
k 4 = g1 (f1 4)
k 16 = g1 (f1 16)

-- Ejercicio 2 a
absoluto:: Int -> Int
absoluto x | x >= 0 = x
           | otherwise = -x

-- Ejercicio 2 b
maximoabsoluto:: Int -> Int -> Int
maximoabsoluto x y | absoluto x >= absoluto y = absoluto x
                   | otherwise = absoluto y

-- Ejercicio 2 c
maximo3:: Int -> Int -> Int -> Int
maximo3 a b c | a >= b && a >= c = a
              | b >= a && b >= c = b
              | otherwise = c

-- Ejercicio 2 d
algunoEs0:: Float -> Float -> Bool
algunoEs0 x y | x == 0 || y == 0 = True
              | otherwise = False

-- Usando pattern matching
algunoEs0pm:: Float -> Float -> Bool
algunoEs0pm 0 _ = True
algunoEs0pm _ 0 = True
algunoEs0pm x y = False

-- Ejercicio 2 e
ambosSon0:: Float -> Float -> Bool
ambosSon0 x y | x == 0 && y == 0 = True
              | otherwise = False

-- Usando pattern matching
ambosSon0pm:: Float -> Float -> Bool
ambosSon0pm 0 0 = True
ambosSon0pm x y = False

-- Ejercicio 2 f
mismoIntervalo:: Float -> Float -> Bool
mismoIntervalo x y | x <= 3 && y <= 3 = True
                   | x > 7 && y > 7 = True
                   | x > 3 && x <= 7 && y > 3 && y <= 7 = True
                   | otherwise = False

-- Ejercicio 2 g
sumaDistintos:: Int -> Int -> Int -> Int
sumaDistintos a b c | a == b && a == c = a
                    | a == b = a + c
                    | a == c = a + b
                    | b == c = a + b
                    | otherwise = a + b + c

-- Ejercicio 2 i
digitoUnidades:: Int -> Int
digitoUnidades n | n < 10 = n
                 | otherwise = mod n 10

-- Ejercicio 2 j
digitoDecenas:: Int -> Int
digitoDecenas n = mod (div n 10) 10

-- Ejercicio 3
estanRelacionados:: Integer -> Integer -> Bool
estanRelacionados x y | mod (x * x) (x * y) == 0 = True
                      | otherwise = False

-- Ejercicio 4 a
prodInt:: (Float, Float) -> (Float, Float) -> Float
prodInt (x1, x2) (y1, y2) = x1 * y1 + x2 * y2

-- Ejercicio 4 b
todoMenor:: (Float, Float) -> (Float, Float) -> Bool
todoMenor (x, y) (p, q) | x < p && y < q = True
                        | otherwise = False

-- Ejercicio 4 c
distanciaPuntos:: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos (x1, x2) (y1, y2) = sqrt ((x1 - y1) ** 2 + (x2 - y2) ** 2)

-- Ejercicio 4 d
sumaTerna:: (Int, Int, Int) -> Int
sumaTerna (x1, x2, x3) = x1 + x2 + x3

-- Ejercicio 4 e
sumarSoloMultiplos:: (Int, Int, Int) -> Int -> Int
sumarSoloMultiplos (x1, x2, x3) y | mod x1 y == 0 && mod x2 y == 0 && mod x3 y == 0 = x1 + x2 + x3
                                  | mod x1 y == 0 && mod x2 y == 0 = x1 + x2
                                  | mod x2 y == 0 && mod x3 y == 0 = x2 + x3
                                  | mod x1 y == 0 && mod x3 y == 0 = x1 + x3
                                  | mod x1 y == 0 = x1
                                  | mod x2 y == 0 = x2
                                  | otherwise = x3

--Ejercicio 4 f
posPrimerPar:: (Int, Int, Int) -> Int
posPrimerPar (x, y, z) | mod x 2 == 0 = 1
                       | mod y 2 == 0 = 2
                       | mod z 2 == 0 = 3
                       | otherwise = 4

-- Ejercicio 4 g
crearPar:: t -> h -> (t, h)
crearPar x y = (x, y)

-- Ejercicio 4 h
invertir:: (t, h) -> (h, t)
invertir (x, y) = (y, x)

-- Ejercicio 5

f2:: Integer -> Integer
f2 x | x <= 7 = x * x
     | otherwise =2 * x - 1

g2:: Integer -> Integer
g2 x | mod x 2 == 0 = div x 2
     | otherwise = 3 * x +1

todosMenores:: (Integer, Integer, Integer) -> Bool
todosMenores (x, y, z) | f2(x) > g2(x) && f2(y) > g2(y) && f2(z) > g2(z) = True
                       | otherwise = False

-- Ejercicio 6
bisiesto:: Integer -> Bool
bisiesto x | mod x 4 /= 0 || (mod x 100 == 0 && mod x 400 /= 0) = False
           | otherwise = True

-- Ejercicio 7
distanciaManhattan:: (Float, Float, Float) -> (Float, Float, Float) -> Float
distanciaManhattan (x1, x2, x3) (y1, y2, y3) = abs(x1 - y1) + abs(x2 - y2) + abs(x3 - y3)

-- Ejercicio 8
sumaUltimosDosDigitos:: Integer -> Integer
sumaUltimosDosDigitos x = mod x 10 + mod (div x 10) 10

comparar:: Integer -> Integer -> Integer
comparar x y | sumaUltimosDosDigitos(x) < sumaUltimosDosDigitos(y) = 1
             | sumaUltimosDosDigitos(x) > sumaUltimosDosDigitos(y) = -1
             | otherwise = 0