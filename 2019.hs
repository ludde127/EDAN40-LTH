-- 1) Gör denna på papper

-- 2)

data Tree = Node Tree Tree Tree String | Leaf String deriving (Show)

data T a = N (T a) (T a) (T a) a | L a 
  deriving (Show)



myLength :: T String -> T Int
myLength = fmap length

instance Functor T where
  fmap g (L a) = (L (g a))
  fmap g (N l m r a) = (N (fmap g l) (fmap g m) (fmap g r) (g a))
   
instance (Eq a) => Eq (T a)  where
  (==) (L a) (L b) = a == b
  (==) (N l m r a) (N l1 m1 r1 a1) = a == a1 && l == l1 && m == m1 && r == r1
  (==) _ _ = False
  (/=) l r = not (l == r) 
 
{-

f x y = (3 - y) * x
f x = ((*) x) . (3-)
f = flip ((flip (.)) (3-) (*))

g x y = map x $ filter (<3) y
g x = (map x) . (filter (<3))
g x = (flip (.)) (filter (<3)) (map x)

g =  ((flip (.)) (filter (<3))) . map


4)

The reason for it being almost as slow is that it is only evaluated to WHNF which it mostly is from the start, we would need to force full evaluation if we wanted the full speed boost from parrallelization.


5) This excersie is insane and i will not do it.
I do not remember the exact types of everything from the third assignment (or any code i have ever written more than a couple days ago).

We were also reassured that it would not come at this years examination.

-}
