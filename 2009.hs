{-
f x = (5 - x) / 3

f x = (/) ((-) 5 x) 3
f = ((flip (/)) 3) . (5-) 

f2 x y = (5 - x) / y == (/)((5-) x) y 
f2 x = (/)((5-) x)

f2 = ((/) . (5-))

2)

f :: (Num a, Monad m) => m a -> m a -> m -> a

f [1, 2, 3] [2, 4, 8] ger [2, 4, 8, 4, 8, 16, 6, 12, 24] 
f (Just 5) Nothin ger Nothing
-}

f x y = do
 a <- x
 b <- y
 return (a*b)
 
 {-
 3)
 
curried form means that it takes in arguments one after the other
this makes it possible to pass some arguments but not all and 
thus make it partially applied. This is usefull when we want to combine functions
 -}
 
 --4)
 
--replicate2 :: Int -> a -> [a]
 

 -- This is not sufficient as it would only work for numbers and not for
 -- any other types as the list comprehension is only defined for nums.
 -- And additionally the list comprehension is wrong, it should be [x, x..]
 
 -- 5)
 
 -- zipWith :: (a->b->c) -> [a]->[b]->[c]
 -- map :: (a -> b) -> [a] -> [b] 
 
 
 {-
 zipWith map :: [a -> b] -> [[a]] -> [[b]]
 Denna kommmer att ta en lista av funktioner a->b och sedan ta in en lista av listor av a och ge ut en lista av listor av b som är skapade av att applicera varje funktion i funktions listan på varje a och ge ett b.
 
 
map zipWith :: [a->b->c] -> [[a]->[b]->[c]]
 
 

Tar in en lista av funktioner a -> b -> c och returnerar en lista funktioner från listor av a till b till c, den kommer ge alla permutationer. 
 
 
(.) :: (b1 -> c1) -> (a1 -> b1) -> a1 -> c1
 
(b1 -> c1) = map => ((a -> b) -> ([a] -> [b]))
 
b1 = a0 -> b0

c1 = [a0] -> [b0]

a1 = a -> b -> c

b1 = [a] -> [b] -> [c]

a0 -> b0 == [a] -> [b] -> [c]
a0 = [a]
b0 = [b] -> [c]

(.) map zipWith :: (a -> b -> c) -> [[a]] -> [[b] -> [c]]

denna tar in en funktion a -> b -> c och en lista av listor av a och kör funktionen på varje lista av a och den blir då partially applied så den ger en lista av funktioner [b] -> [c]

6)

-- foldl and foldr
foldr            :: (a -> b -> b) -> b -> [a] -> b
foldl            :: (a -> b -> a) -> a -> [b] -> a

foldr slutar med det givna värdet medans foldl börjar med det
foldr har acc som andra arg till sin function medans det är foldls första.

 -}
map2 f = foldr (\e acc -> (f e):acc) []

 

