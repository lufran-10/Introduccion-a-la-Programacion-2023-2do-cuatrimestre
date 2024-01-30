-- Simulacro 1er Parcial
-- 1
validarPrimero:: [(String, String)] -> Bool
validarPrimero [(a, b)] | a /= b = True
                        | otherwise = False
validarPrimero ((a, b):(c, d):xs) | a == b = False
                                  | (a == c && b == d) || (a == d && b == c) = False
                                  | otherwise = validarPrimero ((a, b):xs)

relacionesValidas:: [(String, String)] -> Bool
relacionesValidas [] = True
relacionesValidas (x:xs) = validarPrimero (x:xs) && relacionesValidas xs
 
-- 2
pertenece:: String -> [String] -> Bool
pertenece _ [] = False
pertenece x (y:ys) | x == y = True
                   | otherwise = pertenece x ys

personas:: [(String, String)] -> [String]
personas [] = []
personas ((a, b):xs) | pertenece a (personas xs) && pertenece b (personas xs) = personas xs
                     | pertenece a (personas xs) = b : personas xs
                     | pertenece b (personas xs) = a : personas xs
                     | otherwise = a : b : personas xs

-- 3
amigosDe:: String -> [(String, String)] -> [String]
amigosDe _ [] = []
amigosDe x ((a, b):ys) | x == a = b : amigosDe x ys
                       | x == b = a : amigosDe x ys
                       | otherwise = amigosDe x ys

-- 4
longitud:: [String] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

comparacionAmigos:: [String] -> [(String, String)] -> String
comparacionAmigos [x] _ = x
comparacionAmigos (x:y:xs) rel
              | longitud (amigosDe x rel) > longitud (amigosDe y rel) = comparacionAmigos (x:xs) rel
              | otherwise = comparacionAmigos (y:xs) rel

personaConMasAmigos:: [(String, String)] -> String
personaConMasAmigos rel = comparacionAmigos (personas rel) rel