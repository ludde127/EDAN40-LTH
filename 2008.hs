--1)

-- map :: (a -> b) -> [a] -> [b]
-- (:) :: a -> [a] -> [a]

-- map (:) :: [a] -> [[a] -> [a]]
-- It takes a list and returns a list of [a] -> [a]
-- vi tar in en lista med värden vi ska lägga på, sen för varje värde
-- ger vi ut en funktion som lägger på det värdet på en lista vi får in
-- som sen returnerar en ny lista.

--2)

{-
The type is [[Char]]

"hello" >> return "world"

it returns ["world", "world", "world", "world", "world"]
-}

--3)
{-
It means that no part of the code can influnce other parts of the code.
All functions are pure like in math and you cant really get undefined behaviour in other functions from things done in others.
-}

--4)

--map curry

--5)
delete :: Eq a => a -> [a] -> [a]
delete y [] = []
delete y (x:xs) = if x == y then xs else x : delete y xs

(\\) :: Eq a => [a] -> [a] -> [a]
(\\) = foldl (flip delete)

g [] = [[]]
g xs = concat [map (x:) (g (xs \\ [x])) | x <- xs]
-- Den skapar en ny lista av listor §§§värden där man har lagt ihop flera listor som är uppbygda igenom att för första elementet ta ut det och sen lägga det först i en ny där man rekursivt kallade funktion. Det kommer skapa alla kombinationer av värdena och lägga dom efter varandra.

filter' :: (a -> Bool) -> [a] -> [a]
filter' p = foldr (\e acc -> if p e then acc ++ [e] else acc) []
