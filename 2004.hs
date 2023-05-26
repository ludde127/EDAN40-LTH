test :: Bool -> Bool -> Bool -> Bool

test True True c = not c
test a True True = not a
test True b True = not b
test _ _ _ = False

--g f x = f ((f x) / 3)

g f = f . (/3) . f


e :: (Monad m, Num a) => m a -> m Bool
e k = do 
  x <- k
  return (2*x)
  return False
  
  -- It will only take the last returned valeu
  
  {-the lambda \(c, old) -> case...
  has type
  
  (a -> b)
  Behaivor b => (Char, a1) -> Event b
  
  -}
  
  -- key `snapshot` col :: Event a -> Behavior b -> Event (a, b)
  -- key :: Event a
  -- col :: Behavior b
  -- Då Event (a, b) mappas med c, old där c är Char är a Char
  
  -- key :: Event Char
  
  -- Pallar inte mer gör på papper långsamt
  
  -- 5 Monads are a way to allow the pure haskell code to interact with
  -- the real world and allow side effects. This concept gives us easy ways --to allow the rest of the code to stay compleatly pure and gives us clean ways to handle errors. It allows us to interact with objects that we dont know exists (Maybe). It also gives easy way to pass values between different parts of the program.
  
{-
Monader gör så att man kan ha sidoeffekter förutom rena beäkningar, exempelvis io i IO. De ger även ett sätt att arbeta med tal som kanske inte finns Maybe. Det gör så att man kan kedja ihop operationer och berälknar så att svaret från den ena skickas till den andra. detta gör så att program kan bli kortare men ändå läsbara. 

Monader används även för att seperera rena delar av programmet från orena delar som har sidoeffekter eller kan ge olika beräkningar beroende på vad som ges in, det gör det lättare att förstå när en sidoeffekt anvädns eller när något kan gå fel.

Det ger ett sätt att hantera fel med exempelvis Maybe.
-}

--6)

unfoldr :: (b -> Maybe (a, b)) -> b -> [a]
unfoldr f b = case f b of
	Nothing -> []
	Just (a, b) -> a : unfoldr f b
	
-- Den tar in en funktion f och ett värde b, tillämpar f på b och kollar vad det blev, blev det Nothing ges en tom lista och rekursionen slutar.
-- Annars om det va Just av en tuple så tar man a och fortsätter rekursera

foldr :: (a -> b -> b) -> b -> [a] -> b

unfoldr f' (foldr f z xs) :: f' måste vara av typen b -> Maybe (a, b)

--z får inte lägga på något nytt element för vi kan inte ta bort det så det måste vara [].

-- f' måste vara rätt skriven för att omvandla från f. f' måste vara fs inverse

