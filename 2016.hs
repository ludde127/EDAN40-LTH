-- 1)

{-
Needs
(+), (-), (*) :: a -> a -> a
negate, abs, signum :: a -> a
fromInteger :: Integer -> a

-}

data ListNatural = Empty | () :-: ListNatural 
  deriving (Eq, Show)
 
twoL = (() :-: (() :-: Empty))
threeL = () :-: (() :-: (() :-: Empty)) -- === () :-: twoL


-- f1 takes x and y and gives y if x is 0
-- f1 does x -= 1 and adds one to its own recursive call so it would in the end
-- have added x () :-: to y ||| ADDITION

-- f2 takes x, y and gives 0 if x == 0
-- it does x-= 0 while x > 0 and then adds y to its own recursive call
-- if x = 3 and y = 2 this would happen
-- x = 3, y + (f2 2 y)
-- x = 2, y + y + (f2 1 y)
-- x = 1, y + y + y + (f2 0 y)
-- x = 0, 0 -> y + y + y = 3y
-- Multiplication

-- f3 takes x y, if y == 0 give x
-- if x == 0 give error
-- if x > 0 && y > 0 f3 (x-1) (y - 1)
-- this will remove one from each until one of them hits zero.
-- if y is empty first x is given otherwise crash.
-- This is subtraction

f1 Empty  y = y
f1 (() :-: x) y = () :-: (f1 x y)

f2 Empty  y = Empty
f2 (() :-: x) y = f1 y (f2 x y)

f3 x Empty = x
f3 Empty x = error "foo"
f3 (():-:x) (():-:y) = f3 x y

instance Num ListNatural where
  (+) = f1
  (*) = f2
  (-) = f3
  negate _ = error "Only natural"
  abs x = x
  signum Empty = 0
  signum _ = 1 
  fromInteger i = foldr (\_ acc -> (() :-: acc)) Empty [0..i]
  
  
-- Seams to work

-- 2)

{-
f x y = (2+x) * y 
f x y = (*) ((2+) x) y
f x = (*) ((2+) x)
f = (*) . (2+) 

g = flip ($)
-}

-- 3)

tffos xs = [(fst x, fst x, fst x) | x <- xs, (snd x) `mod` 2 == 0]
tffosFM xs = map (\(x, _) -> (x, x, x)) (filter (\(_, y) -> y `mod` 2 == 0) xs) 

reverseF :: [a] -> [a]
reverseF xs = foldr (\e acc -> acc ++ [e]) [] xs

listComp :: [[Int]] -> [[Int]]
listComp xs = [tail x | x <- (filter ([]/=) xs), (head x) > 5]

--4)

{-
do [1, 2, 3, 4]; "curry" :: [Char] gives "currycurrycurrycurry"

As no return is used it will not be wrapped in a monad.

do [1, 2, 3, 4]; return "uncurry" :: [[Char]] gives ["curry", "curry", "curry", "curry"]

a monad is used and it will thus be mapped into a list.

5)

lazy evaluation is waiting on evaluating some code until its value is actually needed, this can sometimes make the program more effective as unused calculations are never done, it can however make it harder to calculate how much memory that the program will use.

lazy evaluation is what makes infinite lists possible.


6)

zipWith :: (a->b->c) -> [a]->[b]->[c] 

map :: (a -> b) -> [a] -> [b]

zipWith map :: [a -> b] -> [[a]] -> [[b]]
a1 = a -> b
b1 = [a]
c1 = [b]

This function will take in a list of functions a -> b and a list of lists of values a. it will then for each function take one list from the lists of lists of a and apply it to that one and give it.


map :: (a -> b) -> [a] -> [b]
zipWith :: (a->b->c) -> [a]->[b]->[c] 
map zipWith :: [a -> b -> c] -> [[a]->[b]->[c] ] 
a1 = a -> b -> c
b1 = [a]->[b]->[c] 

This will take a list of functions a -> b -> c and return a new list of functions where the functions are mapped to lists instead so each function would run itself on all values on each list.

map.zipWith == (.) map zipWith

(.) :: (b -> c) -> (a -> b) -> a -> c
map :: (a1 -> b1) -> [a1] -> [b1]
zipWith :: (a0->b0->c0) -> [a0]->[b0]->[c0] 

b2 = a1 -> b1
c2 = [a1] -> [b1]

a2 = (a0 -> b0 -> c0)
b2 = [a0] -> [b0] -> [c0]

b2 == b2
a1 -> b1 == [a0] -> [b0] -> [c0]
a1 = [a0]
b1 = [b0] -> [c0]

 (.) map zipWith :: (a0 -> b0 -> c0) -> [[a0]] -> [[b0] -> [c0]]
 
It takes a function a -> b -> c and a list of lists of a
it will then return a list of functions [b] -> [c] for each list of list of a. It will be the original function given a value from the list of list of a (partially applied) and will then be [b0] -> [c0]

it is a way to partially apply functions that work on lists 
 
-}








