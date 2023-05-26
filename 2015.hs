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
-}


