-- BTT implements trees that can be ternary or binary, every node contains a value but the empty tree
-- there must not be unary nodes
-- BTT must be be instance of Functor and Foldable

data BTT a = Nil | B a (BTT a) (BTT a) | T a (BTT a) (BTT a) (BTT a) deriving (Show, Eq)

instance Functor BTT where
  fmap f Nil = Nil
  fmap f (B a l r) = B (f a) (fmap f l) (fmap f r) -- for binary (left/right)
  fmap f (T a l c r) = T (f a) (fmap f l) (fmap f c) (fmap f r) -- for ternary (left/center/right)

instance Foldable BTT where
  foldr f i Nil = i
  foldr f i (B x l r) = f x $ foldr f (foldr f i r) l
  foldr f i (T x l c r) = f x $ foldr f (foldr f (foldr f i r) c) l

-- define a concatenation for BTT with the following constraints:
--  if one of the operands is a binary node, such node becomes ternary and the other operand will become the added subtree
--  if both the operands are ternary nodes, the right operand must be appended on the right of the left operand recursively
x <++> Nil = x
Nil <++> x = x
(B x l r) <++> y = T x l r y -- brackets are redundant
y <++> (B x l r) = T x y l r -- brackets are redundant
(T x l c r) <++> v@(T x' l' c' r') = T x l c (r <++> v)

-- Make BTT instance of Applicative
ltconcat t = foldr (<++>) Nil t -- concatenation of a list of BTT

ltconcmap f t = ltconcat $ fmap f t -- map and then concatenate

instance Applicative BTT where
  pure x = B x Nil Nil

  x <*> y = ltconcmap (`fmap` y) x -- map and then concatenate