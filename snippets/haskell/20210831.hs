-- consider a Slist data structure for lists that store their length
-- define it, make it instance of Foldable, Functor, Applicative, Monad

data Slist a = Slist Int [a] deriving (Show, Eq)

makeSlist v = Slist (length v) v

instance Foldable Slist where
  foldr f i (Slist n xs) = foldr f i xs

instance Functor Slist where
  fmap f (Slist n xs) = Slist n (fmap f xs)

instance Applicative Slist where
  pure v = Slist 1 (pure v)
  (Slist x fs) <*> (Slist y fr) = Slist (x * y) (fs <*> fr)

instance Monad Slist where
  fail _ = Slist 0 [] -- the compiler does not like this one
  (Slist n xs) >>= f = makeSlist (xs >>= (\x -> let Slist n xs = f x in xs))