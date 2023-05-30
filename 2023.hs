{-
1)



f x y = (42 - y) * x
f x y = (*) x ((42-) y)
f x = ((*) x) . (42-) 
f = (flip (.)) (42-) . (*)


g x y = y x

g x y = y $ x
g x y = ($) y x
g x y = flip ($) x y
g = flip ($)
-}
f = (flip (.)) (42-) . (*)
g = flip ($)


{-
2)

($) :: (a -> b) -> a -> b 
(.) :: (b -> c) -> (a -> b) -> a -> c
(:) :: a -> [a] -> [a]
(==) :: a -> a -> Bool
(||) :: Bool -> Bool -> Bool

(($) $) == (($)($))

(($)($)) :: (a -> b) -> a -> b
a1 = (a -> b)
b1 = a -> b
 
((.) .) == ((.)(.)) :: (a -> b0 -> c0) -> a -> (a0 -> b0) -> a0 -> c0

b = (b0 -> c0)
c = (a0 -> b0) -> a0 -> c0

((:) :) == ((:)(:)) :: [a0 -> [a0] -> [a0]] -> [a0 -> [a0] -> [a0]]

a = a0 -> [a0] -> [a0]

((==)==) == ((==)(==)) :: (Eq a, Eq a0 -> a0 -> Bool)) =>  (a0 -> a0 -> Bool) -> Bool

a = (a0 -> a0 -> Bool)



((||) ||)  == ((||)(||)) :: Type error, to many arugments

-}

-- 3) Did on paper

{-
A thunk is a non evaluated value. It is used for making stuff in haskell lazy. Thunks are not evaluated until they are actually used. 


5)

The type is Maybe a -> Maybe Bool
As there is a Nothing on the second line of the do expression we know that the monad used is a Maybe. As we can see that it returns False we know that the return type is Maybe Bool. 
-}

--6
-- data TreeString String = Node Tree Tree Tree | Leaf String
data Tree a = Node (Tree a) (Tree a) (Tree a) | Leaf a deriving (Show)

instance Functor Tree where
  fmap f (Leaf a) = Leaf (f a)
  fmap f (Node l m r) = Node (fmap f l) (fmap f m) (fmap f r) 
  
myLength :: Tree String -> Tree Int
myLength = fmap length

myReverse :: Tree String -> Tree String
myReverse = fmap reverse 
