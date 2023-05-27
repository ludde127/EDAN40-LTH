--1)

{-
f x y = (3 + x) / y

f x y = (/) (3 + x) y

f x = (/) (3 + x)

f x = (/) ((3+) x)

f = (/) . (3+)

g x y = [y z | z <- [1..x]]

g x y = map y (take x (iterate (+1) 1))

g x y = map y ((flip take) (iterate (+1) 1) x)

g x y = (flip map) ((flip take) (iterate (+1) 1) x) y

g x = (flip map) ((flip take) (iterate (+1) 1) x)

g = (flip map) . ((flip take) (iterate (+1) 1))


2)

(8-)  == ((-) 8) :: (Num a) => a -> a

(.) :: (b -> c) -> (a -> b) -> a -> c
(+) :: (Num a) => a -> a -> a

((+)0) :: (Num a) => a -> a

(+0).(0+)  == (.) ((+)0) ((+)0) :: (Num a) => a -> a


(.) :: (b1 -> c1) -> (a1 -> b1) -> a1 -> c1

b1 = b -> c
c1 = (a -> b) -> a -> c
(.)(.) :: (a1 -> b -> c) -> a1 -> (a -> b) -> a -> c

($) :: (a -> b) -> a -> b
(($)$($)) == (($)($)($))

($) :: (a2 -> b2) -> a2 -> b2
($) :: (a1 -> b1) -> a1 -> b1
($) :: (a0 -> b0) -> a0 -> b0

Läs höger till vänster

($)($) :: (a0 -> b0) -> a0 -> b0

a1 = (a0 -> b0)
b1 = a0 -> b0

($)($)($) :: :: (a0 -> b0) -> a0 -> b0

a2 :: (a0 -> b0)
b2 :: a0 -> b0

[] :: [a]

(>>=) :: (Monad m) => m a -> (a -> m b) -> m b
(>=) :: (Ord a) => a -> a -> Bool

([]>>=) (\_ -> [(>=)]))

[(>=)] :: (Ord a) => [a -> a -> Bool]
(\_ -> [(>=)])) :: (Ord a) => p -> [a -> a -> Bool]


([]>>=) :: (a1 -> [b1]) -> [b1] -- m var en list

([]>>=)(\_->[(>=)]) :: (Ord a) => [a -> a -> Bool]
a1 = p
b1 = a -> a -> Bool

3)

A spark is a bit of code that needs to be evaluated to whnf, the spark is put in a queue and a many threads will take one spark at a time to work on.

seq suggests that the first element is to be made into a spark and ran and that the right side should be returned. 

pseq says is like seq but promises that the first part is ran before the second part is returned.

par turns left and right side into sparks but the left side is suggested to be ran before the right side. the snd arg value is returned
-}

{-

ORKADE INTE HELA DEN ÄR HYFSAT ENKEL NÄR MAN KOMMER IGÅNG TAR DOCK LÅNG TID ATT GÖRA MEN BÖR BLI I STORT RÄTT

data CircList = CircList [Int] -- List Current Length

append :: CircList -> Int -> CircList
append (CircList xs) val = (CircList (xs ++ [val]))

removeFirst :: CircList -> CircList
removeFirst (CircList []) = (CircList [])
removeFirst (CircList (_:xs)) = (CircList xs)

  
perimeter :: CircList -> Int
perimeter (CircList xs) = length xs

currentelem :: CircList -> Maybe Int
currentelem (CircList xs) = 
	if length xs > 0 then 
		Just((head xs))
	else
		Nothing

nextelem :: CircList -> Maybe Int
nextelem (CircList xs) = 
	if length > 1 then 
		Just (xs !! 1)
	else
		Nothing 

previouselem :: CircList -> Maybe Int
previouselem (CircList xs)  = 
	if length xs > 0 then 
		Just(xs !! ((length xs)-1))
	else
		Nothing
		
 --Take one from the front and add to the back
forward :: CircList -> Maybe CircList
forward cl = append (removeFirst cl) (fromMaybe (currentelem cl))

doStep :: CircList -> (Int, CircList)
doStep cl = 
	(currentelem new, new)
	where new = forward cl
	


insert :: CircList -> Int -> CircList
insert (CircList xs) val = (CircList (val:xs))
takefromCl :: Int -> CircList -> [Int]
takefromCl n (CircList xs) = map fst (take n (iterate (\(i, cl) -> doStep cl)))

-}

g :: (Monad m) => m a -> m b -> m (a, b)
g x y = do
	a <- x
	b <- y
	return (a, b)

{-

5) 
g (Just 5) Nothing = Nothing
g [1, 2, 3] [5, 6, 7] = [(1, 5), (1, 6), (1, 7), (2, 5), (2, 6), (2, 7), (3, 5), (3, 6), (3, 7)]

g (Just "I am") (Just "Charlie") = Just (("I am", "Charlie"))


-}

-- 6) filter :: (a -> Bool) -> [a] -> [a]
filter2 :: (a -> Bool) -> [a] -> [a]
filter2 f xs = foldr (\elem acc -> if f elem then elem:acc else acc) [] xs
