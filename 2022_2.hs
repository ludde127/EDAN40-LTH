foo :: [a] -> [a]
foo [] = []
foo (x:xs) = foo xs ++ [x]

{-
1)

foo :: [a] -> [a]
foo [] = []
foo (x:xs) = foo xs ++ [x]

prove that foo (foo xs) = xs

We start with the basecase xs = []

foo (foo []) = foo [] = [], Works

now assume this works for any xs

foo (foo (x:xs)) = foo (foo xs ++ [x])

foo is clearly a reversing function, we now have to prove that 
reverse (xs ++ ys) == (reverse ys) ++ (reverse xs)

basecase xs = []
reverse ([] ++ ys) = reverse ys = (reverse ys) ++ []

inductive case, assuming reverse (xs ++ ys) = (reverse ys) ++ (reverse xs)
reverse ((x:xs) ++ (ys)) = reverse (x: (xs ++ ys)) = (reverse (xs ++ ys)) ++ [x] = INSERT ASSUMTION = ((reverse ys) ++ (reverse xs)) ++ [x] =
(reverse ys) ++ ((reverse xs) ++ [x]) = (reverse ys) ++ (reverse (x:xs))

which shows it works for the larger case aswell.

now we can get back to the problem

foo (foo (x:xs)) = foo (foo xs ++ [x]) = foo [x] ++ foo (foo xs) = x:xs

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

