{-
1. point-free

Rewrite the following two definitions into a point-free form, i.e.,
f = ...,
g = ...,
using neither lambda-expressions nor list comprehensions nor
enumeration nor where-clause nor let-clause:

f x y = x / (5 - y)
g x y = [x z | z <- [3,7..y]]

-}

--f x y = (/) x ((5-) y)

--f x y = (x/) ((5-) y)
--f x = (x/) . (5-)
--f x = (flip (.)) (5-) ((/) x)
f = ((flip (.)) (5-)) . (/)

--g x y = [x z | z <- [3, 7..y]] 
--g x y = map x (takeWhile (y>=) (iterate (+4) 7))
--g x y = map x (takeWhile (y>=) (iterate (+4) 7))
--g x y = map x ((flip takeWhile) (iterate (+4) 7) (y>=))

g = ((flip (.)) (((flip takeWhile) (iterate (+4) 7)) . (>=))) . map

--2. Provide the types and explain the results of applying the following functions: seq, pseq, par.

-- seq, pseq, par :: a -> b -> b
-- seq evaluates the left side to WHNF and then returns the second part immediatly.
-- pseq :: This is a more strict version of seq where the left argument MUST be evaluated to WHNF before the right side is evaluated.
-- par :: This one creates a spark and allows the code to be parallellized, the left side may be ran while the right side is and the right arg is returned.

{-This examination is extracted from quizzes and very weirdly formated
I will skip this one in favor of newer.-}
