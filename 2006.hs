{-
-- 1)

--f = filter . flip elem

-- elem :: Eq a => a0 -> [a0] -> Bool
-- flip :: (a1 -> b1 -> c1) -> b1 -> a1 -> c1
-- filter :: (a2 -> a3) -> [a2] -> [a2]

-- a1 = a0
-- b1 = [a0]
-- c1 = Bool

-- flip elem :: [a0] -> a0 -> Bool

--(.)        :: (b4 -> c4) -> (a4 -> b4) -> a4 -> c4

-- b4 = (a2 -> a3)
-- c4 = [a2] -> [a2]

-- a4 = [a0]

-- b4 = a0 -> Bool

-- filter . flip elem :: [a0] -> [a0] -> [a0]  

-- The function takes in an list and another list and keeps only items from the other list if they are in the first one

-- b)

f' xs ys = [y | y <- ys, y `elem` xs]

-- 2)

{-
It means that they are typed as taking in arguments one after eachother instead of as a tuple, this makes currying easier to handle and to understand and makes it more close to the hardware.

It allows partial applications and function composition as it does not need all arguments to have been applied.
-}

-- 3

--e :: Maybe a -> Maybe Bool
e k = do
 x <- k
 Nothing
 return False
 
 -- 4) skip
 
 -- 5)
 -- a The difference is that m1 has two element where the first element is a combination of two notes (Music) and the other one note. m2 has three elements where all three are Notes
 
 -- 5b)
 
 --line2 xs = foldr (:+:) (Rest 0)
 
 
 -- 6)
 
 --map' :: (a -> b) -> [a] -> [b]
 -}
 map2 f2 = foldr (\val acc -> (f2 val):acc) []
 
 --4)
 --a)
 -- (-) :: Num a => a -> a -> a
 
 -- (8-) == (-) 8 :: Num a => a -> a
 
 --b)
 -- (+0).(0+) == ((+) 0) . ((+) 0) == (.) ((+) 0) ((+) 0)
 -- ((+) 0) :: Num a1 => a1 -> a1
 -- (.) :: (Num a1, Num b1, Num b2, Num c2) => a1 -> c1
 
--  b) Num a1 => a1 -> a1


-- c) (.)(.)
 

-- Right (.) :: (b0 -> c0) -> (a0 -> b0) -> a0 -> c0

-- Left (.) :: (b1 -> c1) -> (a1 -> b1) -> a1 -> c1

-- b1 = b0 -> c0
-- c1 = (a0 -> b0) -> a0 -> c0

-- (.)(.) :: (a1 -> b0 -> c0) -> a1 -> (a0 -> b0) -> a0 -> c0

-- d) (:[]) :: a -> [a]

-- e) (($) $ ($)) == ($)($)($)
-- 0r ($) :: (a0 -> b0) -> a0 -> b0
-- 1r ($) :: (a1 -> b1) -> a1 -> b1

-- a0 == a1, bo == b1, 

-- 2r ($) :: (a2 -> b2) -> a2 -> b2
-- No effect, ($)($)($) :: == :: ($)

-- f) ([]>>=)(\_->[(>=)])

-- (\_->[(>=)]) == [(>=)] :: Eq a => Ord a => p -> [a -> a -> Bool]
-- (>>=) :: Monad m => m a -> (a -> m b) -> m b 
--([]>>=) :: Monad m => (a2 -> [a2]) -> [a2]
-- a2 = p, [a2] = [a -> a -> Bool] => p = a -> a -> Bool
-- a2 = a -> a -> Bool
-- (\_->[(>=)]) == [(>=)] :: Ord a => [a -> a -> Bool]


