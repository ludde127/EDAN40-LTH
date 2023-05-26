-- The scan function accumulates a value lika a fold but reutnas a list of all intermediate values

-- scanr (+) [1, 2, 3] = [6, 5, 3, 0]
-- scanl (+) [1, 2, 3] = [0, 1, 3, 6]


scanr2 :: (a -> a -> a) -> a -> [a] -> [a]



scanr2 f a (x:xs) = 
  if length xs > 0 then
  	(f x (head ys)) : ys
  else
    [f a x] ++ [a]
  where ys = scanr2 f a xs
  
  
scanr2r f a xs = foldr (\elem acc -> (f elem (head acc):acc)) [a] xs

scanl2 f a [] = [a]
scanl2 f a (x:xs) = a:(scanl2 f (f a x) xs)

scanl2r f a xs = foldl (\acc elem -> acc ++ [f (last acc) elem]) [a] xs

reverse2 xs = foldr (\elem acc -> acc ++ [elem]) [] xs

-- 2)

{-

Explain the subclass relation between type classes in Haskell. 

Subclasses in haskell refines what a class is meant to do. For example PlusMonad is a subclass of Monad. It sais what can be done on data in a more precise manner.


ANSWER
A method of introducing typeclasses with  inherited constraints. A subclass B of a class A must fullfill all the constrainst put on A. It can also add more constraints if wanted.

class A b where  -- The definition of the class A
	f1 :: b -> Int
class A b => B b where -- The definition of a class B where its instance is also of A (Subclass).
	f2 :: b -> b -> Bool
	
in this case all instances of B will have to define f1 and f2.
-}

--3)
-- LÖSTES PÅ PAPPER


--4)
f x y = do
	a <- x
	b <- y
	return (a * b)
{-



f :: (Monad m, Num a) => m a -> m a -> m a 

The value of f [1, 2, 3] [2, 4, 8] is [2, 4, 8, 4, 8, 16, 6, 12, 24]
The value of f (Just 5) Nothin = Nothing
is fmap (+2) (Just 5) correct? yes it will give Just 7
return 5 :: (Monad m) => m Integer FEL SKA VARA (Monad m, Num a) => m a



5)

1) Det skapas en spark av grtr som kan komma att göras av en annan tråd medans andra argumentet görs av huvudtråden, sen kommer lesser göras till en spark och andra delen kommer köras av huvudtråden. Ingen stor vinst då det den bara evaluerar till whnf.

I andra skapas en spark av grtr och högra delen körs av huvudtråden sen kommer lesser bli tvingad att köras innan högra delen körs. Lite bättre då lesser tvingas köras innan grtr

I tredje kommer force grtr bli en spark och högra delen kommer köras som 3an
Forcing list evaluation makes it slightly more efficient.

seq föreslår att första elementet körs först och returnerar det andra

pseq tvingar att första evalueras först och returnerar den andra.

par är som seq men möjliggör att evaluering av första argumentet sker medans andra returneras.

--6) Denna är irrelevant, kommer inte komma.

-}
