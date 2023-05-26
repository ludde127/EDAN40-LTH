--2003

--1)
--applyPlusOne f  x = (f x) + 1
--f x = (+) (f x) 1
--f = ((+) 1) . f == ((+) 1)

--2)
--replicate :: Int -> a -> [a]
--because it would only work if x were numbers.

--3)

h f = fst . head . dropWhile (uncurry (/=)) . ps (iterate f)
	where
	ps g x = zip (tail (g x)) (g x)
	

--iterate f tar en funktion f a -> a och applicerar den oändligt många gånger --ger x, f(x), f(f(x)), ...

--iterate f har typen a -> [(a -> a)] om f har typen (a -> a)

--ps g x tar g (x) och zippar g x med sin svans
--så ps g x kommer ge [(g1, g0), (g2, g1), ... (gn+1, gn)]

--dvs ps :: (a->[b]) -> a -> [(b, b)]

--ps (iterate f) :: 

--pallar inte. 

--Den kommer att nästa och föregånde värden i tupler av varje applicering av --funktionen. Sen kommer den att uncurrya ps 

--4)

look key xys = foldl (\acc val -> 
	if (fst val) == key && (Nothing == acc) then
		Just (snd val)
	else if (Nothing /= acc) then
		acc
	else
		Nothing 	

	) Nothing xys
	
--5)
--flip (curry f) = curry (f.swap)

-- f:: a0 -> b0
-- (a1, b1) = a0
-- c1 = b0


-- curry ::  ((a, b) -> c) -> a -> b -> c
-- curry f :: a -> b -> c | f :: (a, b) -> c

-- flip (curry f) :: b -> a -> c

-- if curry (f.swap) shall give same thing, f.swap must be (b, a) -> c


--f :: (a1, b1) -> b0 

swap (a, b) = (b, a) 

--6)
{-
monadMath x y z = do 
	a <- x + y
	b <- x + z
	return [n + n | n<- [a, b]]
-}

--mplus (mplus (mplus x y) (mplus x y)) (mplus (mplus x z) (mplus x z))

instance Num (Maybe Integer) where
	m1 + m2 = do
	  x <- m1
	  y <- m2
	  return (x + y)
	m1 - m2 = do
	  x <- m1
	  y <- m2
	  return (x - y)
	m1 * m2 = do
	  x <- m1
	  y <- m2
	  return (x * y)
        
        abs m1 = m1 >>= return.abs
        
       	signum m1 = do
       		x <- m1
       		return (signum x)
	fromInteger x = Just (fromIntegral x)
         
	

