data MyNatural = Empty | () :-: MyNatural deriving (Eq, Show)

infixr 5 :-:

{-

Will not do this in great detail, the exact same excersise was in 2016.

f1 is addition
f2 is multiplication
f3 is subtraction
-}

f1 Empty y = y
f1 (() :-: x) y = () :-: (f1 x y)
f2 Empty y = Empty
f2 (() :-: x) y = f1 y (f2 x y)
f3 x Empty = x
f3 Empty x = error "foo"
f3 (() :-: x) (() :-: y) = f3 x y

instance Num MyNatural where
  (+) = f1
  (*) = f2
  (-) = f3
  negate = error "Natural"
  abs x = x
  signum (() :-: x) = 1
  signum _ = 0
  fromInteger i = foldr (\elem acc -> (() :-: acc)) Empty [0..i]  
  
 
-- 2

{-

Version 1 is faster as this populates the table so that calculations will be cached instead of redone for each iteration.

-}

-- 3

unfoldr :: (b1 -> Maybe (a1,b1)) -> b1 -> [a1]
unfoldr f b = case f b of
  Nothing -> []
  Just (a,b) -> a : unfoldr f b

iterate' :: (a -> a) -> a -> [a]

iterate' = unfoldr . g -- == (.) unfoldr g

--(.) :: (b2 -> c2) -> (a2 -> b2) -> a2 -> c2
--b2 = (b1 -> Maybe (a1,b1))
--c2 = b1 -> [a1]

--((.) unfoldr) g -- unfoldr partially applied to (.) has type 
-- (a2 -> (b1 -> Maybe (a1,b1))) -> a2 -> b1 -> [a1]
-- g has to have type a2 -> (b1 -> Maybe (a1, b1))
-- and a2 has to be (a1 -> a1) and b1 == a1

-- Define g | iterate takes a function a -> a, a and gives a list of [a]
-- it repeatidly applies its function to the last element and appends the result

-- g :: (a1 -> a1) -> (a1 -> Maybe (a1, a1))

g f = \a -> (Just (a, f a)) 

-- 4 will do later, this is a proof question.

-- Doing this on paper

-- It was contradiction.

-- 5

{-
 A spark in haskell is a chunk of code which needs to be evaluated to whnf and is put into a pool which multiple threads can work on.
 
seq suggests that the first argument should be ran first and the second value will be returned, the first argument could however be evaluated after the second but has to be evaluated.

pseq says that the first argument MUST be evaluated before the right arguemnt is returned.

in par a spark is created and the left side is suggested to be ran first but it can be evaluated while the right arg is being returned.
-}

-- 6)

{-

Types of (.).(.) == (.) (.)(.)

(.) :: (b1 -> c1) -> (a1 -> b1) -> a1 -> c1

(.)(.)(.) :: (b3 -> c3) -> (a3 -> b3) -> a3 -> c3

b3 = (b1 -> c1)
c3 = (a1 -> b1) -> a1 -> c1

a3 = (b0 -> c0)
b3 = (a0 -> b0) -> a0 -> c0

b3 == b3 => 

b1 = a0 -> b0
c1 = a0 -> c0

(.)(.)(.) :: a3 -> c3 == (b0 -> c0) -> (a1 -> a0 -> b0) -> a1 -> a0 -> c0

b) given that
map2 :: (a -> b, c -> d) -> (a, c) -> (b, d)

find e

rulesCompile :: [(String, [String])] -> e
rulesCompile = (map . map2) (words . map toLower, map words)
words :: String -> [String]

rulesCompile = ((.) map map2) ((.) words (map toLower), map words)

toLower :: Char -> Char
(.) :: (b1 -> c1) -> (a1 -> b1) -> a1 -> c1
map :: (a2 -> b2) -> [a2] -> [b2] 
map2 :: (a3 -> b3, c3 -> d3) -> (a3, c3) -> (b3, d3)

(.) map map2 :: 
b1 = (a2 -> b2)
c1 = [a2] -> [b2]

a1 = (a3 -> b3, c3 -> d3)
b1 = (a3, c3) -> (b3, d3)

b1 == b1 => 

a2 = (a3, c3)
b2 = (b3, d3)

((.) map map2) :: (a3 -> b3, c3 -> d3) -> [(a3, c3)] -> [(b3, d3)]

====== (.) words (map toLower)
map toLower :: [Char] -> [Char]

(.) words (map toLower) :: [Char] -> [[Char]]
b1 = [Char]
c1 = [[Char]]

a1 = [Char]
b1 = [Char]

map words ::  [[Char]] -> [[[Char]]]

====== ((.) map map2) ((.) words (map toLower), map words)::

a3 = [Char]
b3 = [[Char]]

c3 = [[Char]]
d3 = [[[Char]]]

((.) map map2) :: (a3 -> b3, c3 -> d3) -> [(a3, c3)] -> [(b3, d3)]
:: [([Char], [[Char]])] -> [([[Char]], [[[Char]]])]
 -}

-- 6c 

{-

transformationApply :: Eq a => a -> ([a] -> [a]) -> [a] -> ([a], [a])
-> Maybe [a]

orElse :: Maybe a -> Maybe a -> Maybe a

map :: (a -> b) -> [a] -> [b]

foldr1 :: (a -> a -> a) -> [a] -> a

wildcard :: String
transformationsApply wildcard f x :: ([a], [a]) -> Maybe [a]
pats :: [([a], [a])]
map (transformationsApply wildcard f x) pats :: [Maybe [a]]

foldr1 orElse :: Maybe a -> [Maybe a] -> Maybe a
foldr1 orElse (map (transformationsApply wildcard f x) pats :: [Maybe [a]]) 

Maybe a

USED WRONG FOLDR I CANT BE BOTHERED TO FIX. 

-}
