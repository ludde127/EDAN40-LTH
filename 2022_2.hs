foo :: [a] -> [a]
foo [] = []
foo (x:xs) = foo xs ++ [x]

{-
Prove that foo (foo xs) = xs

basecase foo (foo []) = foo ([]) = [] 

inductive

foo xs = foo (x:xs1) = foo xs1 ++ [x] -> [xn, xn-1 , ... , x0]

foo (x: foo xs) = foo (xn: [xn-1 , ... , x0]) = foo [xn-1 , ... , x0] ++ [xn]


foo reverses, so the reverse of the reverse is the same.  

This is almost enought but not really, couldent be bothered tho.


2)

a)

(:) :: a -> [a] -> [a]
(.) :: (b -> c) -> (a -> b) -> a -> c

(:(.))

[a] = (b -> c) -> (a -> b) -> a -> c not possible, type error

b)

((:).) == ((.)(:)) :: (a1 -> a) -> a1 -> [a] -> [a]

b1 = a
c1 = [a] -> [a]

c)

(.(:)) :: (([a] -> [a]) -> c1) -> a -> c1

a1 = a
b1 = [a] -> [a]

d)

((.):) == ((:)(.)) :: [ (b -> c) -> (a -> b) -> a -> c] -> [ (b -> c) -> (a -> b) -> a -> c]

a1 = (b -> c) -> (a -> b) -> a -> c
-}

-- 3)

data T = N T T T String | L String
data Tree a = Node (Tree a) (Tree a) (Tree a) a | Leaf a deriving (Show)

myLength :: Tree String -> Tree Int
myLength = fmap length

myReverse :: Tree String -> Tree String
myReverse = fmap reverse

instance Functor Tree where 
  fmap f (Leaf a) = Leaf (f a)
  fmap f (Node l m r a) = Node (fmap f l) (fmap f m) (fmap f r) (f a) 
  
-- 4)

f x y = do
  a <- x
  b <- y
  return (a*b)
  
{-
f :: (Num a, Monad m) => m a -> m a -> m a

[2, 4, 8, 4, 8, 16, 6, 12, 24]
f (Just 5) Nothing -> Nothing
yes gives Just 7
(Monad m, Num n) => m n
-}


-- 5)

{-
a) The first version is much faster.
b) This is because version 1 uses memoization by storing calculations in the simTable, in the other version calculations are redone many many times while they are only done once in the first version (if they are needed else never (lazy)).
-}

