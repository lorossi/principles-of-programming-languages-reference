-- Gtree (general tree) is a structure for a tree with data and an unlimited number of children
data Gtree a = Tnil | Gtree a [Gtree a] deriving (Show, Eq)

-- define a function gtree2list that translates a Gtree to a list
gtree2list Tnil = []
gtree2list (Gtree x xs) = x : concatMap gtree2list xs

-- make Gtree instance of Functor, Foldable, and Applicative
instance Functor Gtree where
  fmap f Tnil = Tnil
  fmap f (Gtree x xs) = Gtree (f x) (fmap (fmap f) xs)

instance Foldable Gtree where
  foldr f i t = foldr f i (gtree2list t) -- equivalent to foldr f i $ gtree2list t

Tnil +++ x = x
x +++ Tnil = x
(Gtree x xs) +++ (Gtree y ys) = Gtree y ((Gtree x [] : xs) ++ ys)
