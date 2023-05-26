--1)

{-
f x y = 3 + y / x

f x y = (3+) ((/) y x)
f x y = (3+) ((flip (/)) x y)
f' x = (3+) . (flip (/) x)
f'' x = (.) (3+) (flip (/) x)
f'' = ((.) (3+)) . flip (/) 



f x y = [y z | z <- [1..x]]

f x y = map y (take x (iterate (+1) 1))

f x y = (flip map) (take x (iterate (+1) 1)) y

f x = (flip map) (take x (iterate (+1) 1))

f x = (flip map) ((flip take) (iterate (+1) 1) x)

f = (flip map) . (flip take) (iterate (+1) 1)




2)

(.) :: (b -> c) -> (a -> b) -> a -> c
(:) :: a -> [a] -> [a]

a) (.)(:) :: (a -> a1) -> a -> ([a1] -> [a1])

b) (:(.)) -> (.) ska va typ [a] vilket den inte kan vara 

c) ((.):) == ((:)(.)) :: [(b -> c) -> (a -> b) -> a -> c] -> [(b -> c) -> (a -> b) -> a -> c]

d) ((:):) == ((:)(:)) :: [a -> [a] -> [a]] -> [a -> [a] -> [a]]

e) (.)(.) ::

b1 = b -> c
c = (a0 -> b) -> a0 -> c

(.)(.) :: (a -> b -> c) -> a -> (a0 -> b) -> a0 -> c

3)

A spark in haskell is related to parallelization.

The functions seq, pseq and par decides in which order the chunks will be evaluated. Seq mearly forces evaluation, so that the values will not be lazy.


------ FROM SOLUTION ------

Spark denotes the potential to create a thread.

seq suggests evaluation of its first arg until WHNF (weak head normal form, which is until its constructor) and returns the second argument

STACKOVERFLOW https://stackoverflow.com/questions/6872898/what-is-weak-head-normal-form

Seq is a special function that forces expressions to be evaluated.
seq x y means that when y is evaluated to whnf x is also evaluated to whnf

SECOND TRY:

A spark is a bit of code that will be ran by one of the available threads that haskell can use. A spark is often a small subset of code.

When i say something is evaluated  or similarily i mean to WHNF.

seq suggests execution of its first argument and will then return its second argument.

pseq as seq says that they should be ran at around the same time but forces the evaluation of x before y, the value from y is then returned

par says that they should be done in parrallel but the second can be returned while the first is still executing.

============https://stackoverflow.com/questions/958449/what-is-a-spark-in-haskell

Sparks are an entry in the workpools for a specific thread that will be executed when the thread has time.


============ More reading
http://www.macs.hw.ac.uk/~dsg/gph/docs/Gentle-GPH/sec-gph.html
https://hackage.haskell.org/package/parallel-3.2.2.0/docs/Control-Parallel.html


WHNF means that every ddata structure is only evaluated up to the top level constructor.

-}

--4)

fmap' :: Functor f => (a->b) -> f a -> f b

fmap' f a =
	x <- a
	return (f x)

