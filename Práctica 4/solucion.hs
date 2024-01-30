-- Práctica 4
-- Ejercicio 1
fibonacci:: Integer -> Integer
fibonacci x | x == 0 = 0
            | x == 1 = 1
            | x >= 2 = fibonacci(x - 1) + fibonacci(x - 2)

-- Ejercicio 2
parteEntera:: Float -> Integer
parteEntera x | x < 1 && x >= 0 = 0
              | x > (-1) && x <= 0 = -1
              | x >= 1 = 1 + parteEntera (x - 1)
              | otherwise =  (-1) + parteEntera (x + 1)

-- Ejercicio 3
esDivisible:: Integer -> Integer -> Bool
esDivisible x y |x == 0 = True
                |x < 0 = False
                |otherwise = esDivisible(x - y) y

-- Ejercicio 4
sumaImparesHasta:: Integer -> Integer -> Integer
sumaImparesHasta n x  | x == 1 = n
                      | otherwise = n + sumaImparesHasta (n + 2) (x - 1)

sumaImpares:: Integer -> Integer
sumaImpares x = sumaImparesHasta 1 x

-- Ejercicio 5
medioFac:: Integer -> Integer
medioFac x | x <= 0 = 1
           | x > 0 = x * medioFac (x - 2)

-- Ejercicio 6
sumaDigitos:: Integer -> Integer
sumaDigitos x | x < 10 = x
              | otherwise = mod x 10 + sumaDigitos (div x 10)

-- Ejercicio 7
todosDigitosIguales:: Integer -> Bool
todosDigitosIguales x | x < 10 = True
                      | mod x 10 /= mod (div x 10) 10 = False
                      | otherwise = todosDigitosIguales (div x 10)

-- Ejercicio 8
cantDigitos:: Integer -> Integer
cantDigitos x | x < 10 = 1
              | otherwise = 1 + cantDigitos (div x 10)

iesimoDigito:: Integer -> Integer -> Integer
iesimoDigito x y | y == cantDigitos x = mod x 10
                 | otherwise = iesimoDigito (div x 10) y

-- Ejercicio 9
longitud:: Integer -> Integer
longitud x | x < 10 = 1
           | otherwise = 1 + longitud (div x 10)

comparaAdelanteAtras:: Integer -> Integer -> Bool
comparaAdelanteAtras x z | x < 10 || z == 0 = True
                         | mod x 10 /= primerNumero = False
                         | otherwise = comparaAdelanteAtras (div (x - primerNumero * (10 ^ (z - 1))) 10) (z - 2)
                         where primerNumero = mod (div x (10 ^ (z - 1))) 10

esCapicua:: Integer -> Bool
esCapicua x = comparaAdelanteAtras x (longitud x)

-- Ejercicio 10 a
f1:: Integer -> Integer
f1 n | n == 0 = 1
     | otherwise = 2 ^ n + f1 (n - 1)

-- Ejercicio 10 b
f2:: Integer -> Float -> Float
f2 n q | n == 1 = q
       | otherwise = q ^ n + f2 (n - 1) q

-- Ejercicio 10 c
f3:: Integer -> Float -> Float
f3 n q = f2 (2 * n) q

-- Ejercicio 10 d
f4:: Integer -> Float -> Float
f4 n q | n == 0 = 1
       | otherwise = (f3 n q) - f2 (n - 1) q

-- Ejercicio 11 a
factorial:: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

eAprox:: Integer -> Float
eAprox 0 = 1
eAprox n = 1 / fromIntegral (factorial n) + eAprox (n - 1)

-- Ejercicio 11 b
e:: Float
e = eAprox 9

-- Ejercicio 12
sucesion:: Integer -> Float
sucesion 1 = 2
sucesion n = 2 + 1 / sucesion (n - 1)

raizDe2Aprox:: Integer -> Float
raizDe2Aprox 1 = 1
raizDe2Aprox n = (sucesion n) - 1 

-- Ejercicio 13

sumatoriaInterna:: Integer -> Integer -> Integer
sumatoriaInterna _ 0 = 0
sumatoriaInterna n m = n ^ m + sumatoriaInterna n (m - 1)

sumatoriaDoble:: Integer -> Integer -> Integer
sumatoriaDoble 0 _ = 0
sumatoriaDoble n m = (sumatoriaInterna n m) + sumatoriaDoble (n - 1) m

-- Ejercicio 14
unaPotencia:: Integer -> Integer -> Integer
unaPotencia q 1 = q
unaPotencia q n = q ^ n + unaPotencia q (n - 1)

sumaPotencias:: Integer -> Integer -> Integer -> Integer
sumaPotencias q n 1 = q * unaPotencia q n
sumaPotencias q n m = q ^ m * (unaPotencia q n) + sumaPotencias q n (m - 1)

-- Ejercicio 15
divisionInterna:: Integer -> Integer ->Float
divisionInterna n 1 = fromIntegral n
divisionInterna n m = fromIntegral n / fromIntegral m + divisionInterna n (m - 1)

sumaRacionales:: Integer -> Integer -> Float
sumaRacionales 1 1 = 1
sumaRacionales n m = (divisionInterna n m) + divisionInterna (n - 1) m

-- Ejercicio 16 a

menorDivisorDesde:: Integer -> Integer -> Integer
menorDivisorDesde n k |mod n k == 0 = k
                      |otherwise = menorDivisorDesde n (k + 2)

menorDivisor:: Integer -> Integer
menorDivisor n |mod n 2 == 0 = 2
               |otherwise = menorDivisorDesde n 3

-- Ejercicio 16 b
esPrimo1:: Integer -> Bool
esPrimo1 n = n == menorDivisor n

-- Ejercicio 16 c
sonCoprimos:: Integer -> Integer -> Bool
sonCoprimos 1 _ = False
sonCoprimos _ 1 = False
sonCoprimos n m | n > m && mod n m == 0 = True
                | n > m && mod n m /= 0 = sonCoprimos m (mod n m)
                | n < m && mod m n == 0 = True
                | n < m && mod m n /= 0 = sonCoprimos n (mod m n)

-- Ejercicio 16 d
siguientePrimo1:: Integer -> Integer -> Integer
siguientePrimo1 n m | esPrimo1 m == True && n == 2 = m
                    | esPrimo1 m == True && n /= 2 = siguientePrimo1 (n - 1) (m + 2)
                    | otherwise = siguientePrimo1 (n) (m + 2)

nEsimoPrimo:: Integer -> Integer
nEsimoPrimo 1 = 2
nEsimoPrimo n = siguientePrimo1 n 3

-- Ejercicio 17
perteneceFibonacci:: Integer -> Integer -> Bool
perteneceFibonacci x n | x < fibonacci n = False
                       | x > fibonacci n = perteneceFibonacci x (n + 1)
                       | otherwise = True


esFibonacci:: Integer -> Bool
esFibonacci x = perteneceFibonacci x 0

-- Ejercicio 18
mayorDigitoPar:: Integer -> Integer
mayorDigitoPar n | n < 10 && even n = n
                 | n < 10 && odd n = -1
                 | even ultimoDigito = max ultimoDigito (mayorDigitoPar nRecortado)
                 | otherwise = mayorDigitoPar nRecortado
                  where ultimoDigito = mod n 10
                        nRecortado = div n 10

-- Ejercicio 19
cantidadDeDivisoresHasta:: Int -> Int -> Int
cantidadDeDivisoresHasta n 1 = 1
cantidadDeDivisoresHasta n d |mod n d == 0 = 1 + cantidadDeDivisoresHasta n (d - 1)
                             |otherwise = cantidadDeDivisoresHasta n (d - 1)

esPrimo:: Int -> Bool
esPrimo n = cantidadDeDivisoresHasta n n == 2

siguientePrimo:: Int -> Int
siguientePrimo n |esPrimo n = n
                 |otherwise = siguientePrimo (n + 1)

enesimoPrimo:: Int -> Int
enesimoPrimo 1 = 2
enesimoPrimo n = siguientePrimo (enesimoPrimo (n - 1) + 1)

sumaKPrimos:: Int -> Int
sumaKPrimos 1 = enesimoPrimo 1
sumaKPrimos k = enesimoPrimo k + sumaKPrimos (k - 1)

esSumaDePrimerosKPrimos:: Int -> Int -> Bool
esSumaDePrimerosKPrimos k n |sumaKPrimos k > n = False
                            |sumaKPrimos k == n = True
                            |otherwise = esSumaDePrimerosKPrimos (k + 1) n

esSumaInicialDePrimos:: Int -> Bool
esSumaInicialDePrimos n = esSumaDePrimerosKPrimos 1 n

-- Ejercicio 20
sumaDivisoresHasta:: Int -> Int -> Int
sumaDivisoresHasta n 1 = 1
sumaDivisoresHasta n k | mod n k == 0 = k + sumaDivisoresHasta n (k - 1)
                       | otherwise = sumaDivisoresHasta n (k - 1)

sumaDivisores:: Int -> Int
sumaDivisores n = sumaDivisoresHasta n n

maxSumaDivisores:: Int -> Int -> Int
maxSumaDivisores x y | x < y = max (sumaDivisores x) (maxSumaDivisores (x + 1) y)
                     | otherwise = sumaDivisores y

tomaValorMax:: Int -> Int -> Int
tomaValorMax x y | x < y && sumaDivisores x /= maxSumaDivisores x y = tomaValorMax (x + 1) y
                 | otherwise = x

-- Ejercicio 21
variableN:: Integer -> Integer -> Integer -> Integer
variableN m n r | n < 0 = 0
                | m ^ 2 + n ^ 2 <= r ^ 2 = 1 + variableN m (n - 1) r
                | otherwise = variableN m (n - 1) r

pitagoras:: Integer -> Integer -> Integer -> Integer
pitagoras m n r | m < 0 = 0
                | otherwise = (variableN m n r) + pitagoras (m - 1) n r
