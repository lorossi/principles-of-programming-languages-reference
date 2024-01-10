-- define a generalized zip function that take sa finite list of possible infinite lists and returns a possibly infinite list containing a list of all the first elements, followed by a list of all the second elements, and so on
-- the result is finite if and only if all the input lists are finite
-- gzip [[1,2,3],[4,5,6],[7,8,9,10]] ==> [[1,4,7],[2,5,8],[3,6,9]]

gzip xs = if not (any null xs) then map head xs : gzip (map tail xs) else []

-- explanation:
-- if the list does not contain any empty list, then extract the first element and concatenate it with the result of the function applied to the tail of the list
-- otherwise, return the empty list

-- define a function which returns the possibly infinite list of the sum of the two greatest elements in the same position of the list
-- TODO: check this one too, because I don't fully understand how it's done