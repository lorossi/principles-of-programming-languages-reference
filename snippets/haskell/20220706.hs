import Data.Data (DataRep)

data Deque a = Deque [a] [a]

toList (Deque front back) = front ++ reverse back

fromList l =
  let half = length l `div` 2
   in Deque (take half l) (reverse $ drop half l)

pushFront x (Deque front back) = Deque (x : front) back

popFront (Deque [] []) = error "Empty deque"
popFront (Deque (x : front) back) = (x, Deque front back)
popFront (Deque [] [x]) = (x, Deque [] [])
popFront (Deque [] back) = popFront $ fromList back -- this is like a doppio carpiato from 10 meters

pushBack x (Deque front back) = Deque front (x : back)

popBack (Deque [] []) = error "Empty deque"
popBack (Deque front (x : back)) = (x, Deque front back)
popBack (Deque [x] []) = (x, Deque [] [])
popBack (Deque front []) = popBack $ fromList front

-- make Deque instance of Eq and Show

instance (Eq a) => Eq (Deque a) where
  d1 == d2 = toList d1 == toList d2

instance (Show a) => Show (Deque a) where
  show d = show $ toList d

-- make Deque Functor, Foldable, Applicative and Monad

instance Functor Deque where
  fmap f (Deque front back) = Deque (map f front) (map f back)

instance Foldable Deque where
  foldr f d = foldr f d . toList

instance Applicative Deque where
  pure x = Deque [x] []
  df <*> dx = fromList $ toList df <*> toList dx

instance Monad Deque where
  d >>= f = fromList $ concatMap (toList . f) $ toList d