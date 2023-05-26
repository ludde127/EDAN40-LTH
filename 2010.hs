{-
1)

a)
f x = 5 + 8/x
f = (5+) . (8/) 

b)
f x = ((+) x) . (3*) 

f = flip ((flip (.)) (3*) (+))


-}

-- 2)

secondQ f ys = map f [y+4 | y <-ys, y<5]
secondQ2 f ys = map f (map (+4) (filter ( < 5) ys))

-- 3)

-- A problem here is that the number Five is missing. You can simply add it in. And we can not do [Zero..Three] if we do not derive Enum

{-
It means that there can not be any functions which have sideeffects, each function can only given a input x give the output y and always do that. And haskell does also not have any classs.


5)

do "merry"; return "christmas" has the type [[Char]]

it gives ["christmas", "christmas", "christmas", "christmas"]



6)

a)
(.) :: (b1 -> c1) -> (a1 -> b1) -> a1 -> c1
(:) :: a -> [a] -> [a]

b1 = a
c1 = [a] -> [a]



(.)(:) :: (a1 -> a) -> a1 ->  [a] -> [a]


(:(.)) :: a -> 
b1 -> c1 is not of type [d] so it can not work


(:) :: a -> [a] -> [a]
(.) :: (b1 -> c1) -> (a1 -> b1) -> a1 -> c1


(:)(.) :: [(b1 -> c1) -> (a1 -> b1) -> a1 -> c1] -> [(b1 -> c1) -> (a1 -> b1) -> a1 -> c1]


d)
(:) :: a -> [a] -> [a]
((:):) :: [a -> [a] -> [a]] -> [a -> [a] -> [a]]



-}



