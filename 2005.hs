{-

map :: (a -> b) -> [a] -> [b]

const :: a -> b -> a

(++) :: [a] -> [a] -> [a]

map (const (++))


const (++) :: b -> [a] -> [a] -> [a]

a1 = b
b1 = [a] -> [a] -> [a]

map (const (++)) :: [b] -> [[a] -> [a] -> [a]]


2)

Lazy evaluation is the feature where computations are only one when the value from them is actually needed and not before. This is often more effective if all values are not always needed. 

Some benefits are that not everything is needed to be stored in memory at the same, it does for example allow infinite lists to exists as only some of the list is in memory at the same time and they are continually calculated.

a reason for it not being in most languages is that it is very hard to know how much memory some code will use if it is lazily calculated and it thus needs a intepreter. Many intepreted languages have some version of laziness.


-}


unfoldr' :: (b -> Maybe (a,b)) -> b -> [a]
unfoldr' f b = case f b of
 Nothing -> []
 Just (a,b) -> a : unfoldr' f b

iterate' :: (a->a) -> a -> [a] 
iterate' = unfoldr' . g 

-- g must return (b -> Maybe (a,b)) [and potentially b]

g f b = Just (b, f b)   
-- 4)

{--
type Image a = Position -> a
type Position = (Float, Float)

type Region = Image Boolean
type ColorImage = Image Color

paste :: Region -> Image a -> Image a -> Image a
paste reg im1 im2 = \pos -> if reg pos then im1 pos else im2 pos 

b)

lift0 a = \pos -> a

lift1 f im1 = \pos -> f (im1 pos) 

lift2 f im1 im2 = \pos -> f (im1 pos) (im2 pos)

c)
	We need to implement Num for Image,
	to do that we need to say what -, +, signum and fromInteger does when it 
	is used on Image.
	
	We can easily use lift2 to implement - and +.
	ex (-) = im1 'lift2 (-)` im2

Example

instance Num a => Num (Image a) where
	(+) = lift2 (+)
	(-) = lift2 (-)
	(*) = lift2 (*)
	signum = lift1 signum
	fromInteger = lift0 . fromInteger


5)

instance Functor m => Functor (Monad m) where
	fmap f m = do
		x <- m
		return (f x)

--}

q [] = []
q (x:xs) = x : q (filter (/=x) xs) 

-- Whats the type of q?
-- q :: [a] -> [a] simply seen from the q [] = []
-- it gives a list of all the values from the array where each value is exactly once.

-- q = foldr f z | z = []

q' = foldr (\(a, acc) -> if not (elem a acc) then a:acc else acc) []

