{-
f x y = (3 - y) / x
f x y = (/) (3- y) x
f x y = (flip (/)) x ((3-) y)
f x = ((flip (/)) x) . (3-)
f = ((flip (.)) (3-) . (flip (/)))


i = iterate (+2) 3

twL = takeWhile . (>=)

takeLarger = (flip twL i)

g x  = (map x) . takeLarger  


g x y = [x z | z <- [1, 3..y]]
g x y = map x (takeWhile (y>=) (iterate (+2) 1))
g x y = map x ((flip takeWhile) (iterate (+2) 1) (y>=))
g x y = map x (((flip takeWhile) (iterate (+2) 1)) (y>=))

flipTakeIter = ((flip takeWhile) (iterate (+2) 1))

g x y = map x flipTakeIter (y>=)
-}
flipTakeIter = ((flip takeWhile) (iterate (+2) 1))

--g x = (map x) . flipTakeIter . (>=)

--g x = (map x) . (flipTakeIter . (>=))
g = flip (.) (flipTakeIter . (>=)) . map

--f x y = (3 - y) / x
--f x = ((flip (/)) x) . (3-)
--f x = (flip (.)) (3-) ((flip (/)) x)
f x = (flip (.)) (3-) (flip (/))

{-

(.) :: (b -> c) -> (a -> b) -> a -> c
(:) :: a -> [a] -> [a]
(>>=) :: (Monad m) => m a -> (a -> m b) -> m b

a) (.)(:) :: (b -> a) -> b -> [a] -> [a]

b) (:)(.) :: [(b -> c) -> (a -> b) -> a -> c] -> [(b -> c) -> (a -> b) -> a -> c]

c) ((.):) == ((:)(.)) samma som förra

d) (:(.)) :: 
[a] = (b -> c) -> (a -> b) -> a -> c which is not possible, type error

e)

([]>>=) (\_ -> [(>=)])

([]>>=) :: (a -> [b]) -> [b]
m = List

(\_ -> [(>=)])

(>=) :: (Ord a) => a -> a -> Bool

[(>=)] :: (Ord a) => [a -> a -> Bool]

(\_ -> [(>=)]) :: (Ord a) => p -> [a -> a -> Bool]

([]>>=) (\_ -> [(>=)]) :: (Ord a) => [a -> a -> Bool]
-}

-- 3) Doing on paper



--4 give a function of type ([a], a -> b) -> [b]

example ::  ([a], a -> b) -> [b]
example (xs, f) = map f xs -- or uncurry (flip map)
example' = uncurry (flip map)

-- 5)
{-
instance (Ord a, Ord b) => Ord (a, b) where
  (<) (a, b) (c, d) = a < c || (a == c && b < d)
  (<=) (a, b) (c, d) = (a == c && b == d) || ((a, b) < (c, d))
  (>=) (a, b) (c, d) = (c, d) < (a, b) || (a == c && b == d)
  (>) l r = r < l
  max l r = if l >= r then l else r
  min l r = if l <= r then l else r
  

instance Ord b => Ord [b] where
  (<) (x:xs) (y:ys) = x < y || (x == y && xs < ys)
  (<) [] [] = False
  (<) _ [] = False
  (<) [] _ = True
  
  (<=) (x:xs) (y:ys) = x < y || (x == y && xs <= ys) 
  (<=) [] [] = True
  (<=) [] _ = True
  (<=) _ [] = False
  (>) (x:xs) (y:ys) = x > y || (x == y && xs > ys)
  (>) [] [] = False
  (>) _ [] = True
  (>) [] _ = False
 
  (>=) (x:xs) (y:ys) = not (ys > xs)

  max l r = if l >= r then l else r
  min l r = if l <= r then l else r

6)

a)
f :: (Num a, Monad m) => m a -> m a -> m a 

b) The value is [2, 4, 8, 4, 8, 16, 6, 12, 24]

c) the value is Nothing
d) (Monad m, Num a) => m a
e) ""
f) []
-}
  



