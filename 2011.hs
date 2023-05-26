--1)

{-
map (const (++))


map :: (a2 -> b2) -> [a2] -> [b2]

const :: a1 -> b1 -> a1
(++) :: [a0] -> [a0] -> [a0]



a1 =  [a0] -> [a0] -> [a0]
const (++) ::  b1 -> [a0] -> [a0] -> [a0]


a2 = b1
b2 = [a0] -> [a0] -> [a0]
map (const (++)) :: [b1] -> [[a0] -> [a0] -> [a0]]



a2 = [a0]
b2 = [a0] -> [a0]
map (++) :: [[a0]] -> [[a0] -> [a0]]

const (map (++)) :: b1 ->  [[a0]] -> [[a0] -> [a0]]

2)

Currying is the process of breaking up a tuple to its parts
so that (a -> b) -> c becomes a -> b -> c and uncurry is the opposite where it takes a -> b -> c and gives (a -> b) -> c 


3)

do [1, 2, 3, 4]; "curry"

this has the type String and will show "currycurrycurrycurry"

do [1, 2, 3, 4]; return "uncurry" this gives ["uncurry", "uncurry", "uncurry", "uncurry"]

[String]

4)

intersection.



delete' :: Eq a => a -> [a] -> [a]
delete' x [] = []
delete' x (y:ys)
	| x == y = ys
	| otherwise = y:(delete' x ys)

(\\) = foldl (flip delete')
c a = (a \\) . (a \\)
-}

--5)
f = (/) . (5+)
g x y = ($)

--6)


data Tree = Node Integer Tree Tree | Leaf Integer

exSubTree = (Node 5 
		(Node 3 (Node 4 (Leaf 10) (Leaf 20)) (Leaf 89)) 
		(Node 23 (Leaf 231) (Leaf 20))
	)

tree = (Node 10 exSubTree (Leaf 20)) 

eqTree (Leaf l) (Leaf r) = l == r
eqTree (Node i1 l1 r1) (Node i2 l2 r2) = i1 == i2 && eqTree l1 l2 && eqTree r1 r2
eqTree _ _ = False

subTree t1 t2 = subTree' t1 t2
	
subTree' t1 (Node i l r) = eqTree t1 l || eqTree t1 r || subTree' t1 l || subTree' t1 r
	
subTree' (Leaf l) (Leaf r) = False
subTree' (Node _ _ _) (Leaf _) = False

subTree' _ _ = False
		

