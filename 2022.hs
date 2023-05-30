-- 1)

{-

reduce :: a -> a
words :: String -> [String]
map :: (a -> b) -> [a] -> [b] 
toLower :: Char -> Char
filter :: (a -> Bool) -> [a] -> [a] 
not :: Bool -> Bool
flip :: (a -> b -> c) -> b -> a -> c
elem :: (Eq a) => a -> [a] -> Bool

chars :: String

prepare = reduce . words . map toLower . filter (not . flip elem chars)

(not . flip elem chars) == not ((flip elem) chars)

not ((flip elem) chars) :: Char -> Bool

filter (not . flip elem chars) :: [Char] -> [Char]

map toLower (filter (not . flip elem chars))

map toLower :: [Char] -> [Char]

map toLower (filter (not . flip elem chars)) :: [Char] -> [Char]

words . map toLower . filter (not . flip elem chars) :: [Char] -> [[Char]]

reduce . words . map toLower . filter (not . flip elem chars) :: [Char] ->[[Char]]


b)

map2 :: (a -> b, c -> d) -> (a, c) -> (b, d)

rulesCompile :: [(String, [String])] -> b
rulesCompile = (map . map2) (words . map toLower, map words)

words . map toLower == words (map toLower) :: NOT ENTIERLY CORRECT, INPUT IS FIRST GIVEN TO INNER WHEN COMPOSITION IS USED

map toLower :: String -> String
words (map toLower) :: String -> [String]

map words :: [String] -> [[String]]

(.) :: words (map toLower) ::

map . map2 == (.) map map2

map :: (a -> b) -> [a] -> [b] 
map2 :: (a -> b, c -> d) -> (a, c) -> (b, d)

(.) :: (b1 -> c1) -> (a1 -> b1) -> a1 -> c1

(.) map map2

b1 = a0 -> b0
c1 = [a0] -> [b0]

a1 = (a2 -> b2, c2 -> d2)

b1 = (a2, c2) -> (b2, d2)

a0 = (a2, c2)
b0 = (b2, d2)

(.) map map2 :: (a2 -> b2, c2 -> d2) -> [(a2, c2)] -> [(b2, d2)]
(.) map map2 :: (a -> b, c -> d) -> [(a, c)] -> [(b, d)]

(map . map2) (words . map toLower, map words) :: [(String, [String])] -> [([String], [[String]])]

a String
b [String]
c [String]
d [[String]]


c) 

transformationApply :: Eq a => a -> ([a] -> [a]) -> [a] -> ([a], [a])
-> Maybe [a]

orElse :: Maybe a -> Maybe a -> Maybe a

foldr1 :: (a -> b -> b) -> [a] -> b

foldr1 orElse (map (transformationApply wildcard f x) pats)

transformationApply wildcard f x :: Eq a => ([a], [a]) -> Maybe [a]
wildcard :: a
f :: ([a] -> [a])
x = [a]

map :: (a -> b) -> [a] -> [b] 
map (transformationApply wildcard f x) pats :: [Maybe [a]]

pats :: [([a], [a])]

foldr1 orElse :: [Maybe a] -> Maybe a
foldr1 orElse (map (transformationApply wildcard f x) pats) ::  Maybe [a]

-}

-- 2) DOING ON PAPER.

{-
3) 

Sparks occure when doing parallelization in haskell. A spark is created for a chunk of code that needs to be evaluted. A spark is in a queue that all the active threads run on. It can be induced by use of par
-}

--4)

data Colour = Black | White
type Image a = Position -> a
type Position = (Float, Float)
type Region = Image Bool
type ColourImage = Image Colour
-- a

paste reg im1 im2 = \pos -> if reg pos then im1 pos else im2 pos 

-- b
lift0 a = \_ -> a
lift1 f img = \p -> f (img p)
lift2 f img1 img2 = \p -> f (img1 p) (img2 p)

--5

{-
the type is e :: (Num b) => Maybe a -> Maybe b
the value will always be Nothing as there is a nothing in the do block and anything bound to nothing is nothing.
-}

