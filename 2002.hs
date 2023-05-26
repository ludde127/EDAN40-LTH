oneOf False False c = c
oneOf a False False = a
oneOf False b False = b
oneOf _ _ _ = False

m x xs = [f x | f <- xs]



scanr_ f s [] = [s]
scanr_ f s (x:xs) = (f x (head ys)):ys
	where ys = scanr_ f s xs
	
	
scanl_ f s [] = []
scanl_ f s (x:xs) = s:scanl_ f (f s x) xs 


--foldr :: (a -> b -> b) -> b -> [a] -> b
--foldl :: (a -> b -> a) -> a -> [b] -> a



scanrl f s xs = [foldl f s sub | sub <- [take i xs | i <- [0..(length xs)]]]
scanrf f s xs = [foldr f s sub | sub <- [drop i xs | i <- [0..(length xs)]]]

scanr_ :: (t -> a -> a) -> a -> [t] -> [a]
scanl_ :: (a -> t -> a) -> a -> [t] -> [a]

reverse' :: [a] -> [a]

reverse' xs = foldl (flip (:)) [] xs
--reverse'' xs = foldl (:) [] xs

-- A subclass is a refinement of a class and can bring additional functionallity that better fits a more precise problem. An example is a 

class Drawable a where
	draw :: a -> IO ()

class (Drawable a) => Shape a where
	area :: a -> Double
	
	
class Animal a where
	poop :: a -> Int

class (Animal a) => Frog a where
	jump :: a -> Int

--4)
-- 
--
--
--

data Music = Note Pitch Dur [NoteAttribute] -- a note \ atomic
	| Rest Dur -- a rest / objects
	| Music :+: Music -- sequential composition
	| Music :=: Music -- parallel composition

m1 = [Note (C,5) dur [] :+: Note (D,5) dur [], Note (E,5) dur []]
m2 = [Note (C,5) dur [], Note (D,5) dur [], Note (E,5) dur []]

line2 (x:xs) = lineToList x : line2 xs
	

