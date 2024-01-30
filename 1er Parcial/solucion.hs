-- Votos En Blanco

votosEnBlancoAux:: [(String, String)] -> [Integer] -> Integer -> Integer
votosEnBlancoAux [x] [y] n = y - n
votosEnBlancoAux (x:xs) (y:ys) n =  y + votosEnBlancoAux xs ys n

votosEnBlanco:: [(String, String)] -> [Integer] -> Integer -> Integer
votosEnBlanco (x:xs) (y:ys) n = - votosEnBlancoAux (x:xs) (y:ys) n

-- Fórmulas Validas

formulasValidas:: [(String, String)] -> Bool
formulasValidas [] = True
formulasValidas [(a, b)] = a /= b
formulasValidas ((a, b):(c, d):xs) | a == b = False
                                   | a == c || a == d || b == c || b == d = False
                                   | otherwise = formulasValidas ((c, d):xs)

-- Porcentaje de Votos

totalVotosSinBlanco:: [Integer] -> Integer
totalVotosSinBlanco [] = 0
totalVotosSinBlanco (z:zs) = z + totalVotosSinBlanco zs

division :: Integer -> Integer -> Float
division n m = (fromIntegral n) / (fromIntegral m)

votosDelCandidato:: String -> [(String, String)] -> [Integer] -> Integer
votosDelCandidato x ((a, b):ys) (z:zs) | x == a = z
                                       | otherwise = votosDelCandidato x ys zs

porcentajeDeVotos:: String -> [(String, String)] -> [Integer] -> Float
porcentajeDeVotos x ((a, b):ys) (z:zs) = 100 * division (votosDelCandidato x ((a, b):ys) (z:zs)) (totalVotosSinBlanco (z:zs))

-- Proximo Presidente

proximoPresidente:: [(String, String)] -> [Integer] -> String
proximoPresidente [(a, b)] [y1] = a
proximoPresidente ((a, b):(c, d):xs) (y1:y2:ys) | y1 <= y2 = proximoPresidente ((c, d):xs) (y2:ys)
                                                | otherwise = proximoPresidente ((a, b):xs) (y1:ys)