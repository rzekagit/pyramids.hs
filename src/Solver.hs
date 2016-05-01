module Solver where


data Pyramids = Pyramids [Maybe Int] [Maybe Int] [Maybe Int] [Maybe Int] deriving (Show, Read)

equalLengths :: [[a]] -> Bool
equalLengths []                                       = True
equalLengths (x:xs) | (length x == length (head xs) ) = equalLengths xs
                    | otherwise                       = False

solve :: Pyramids -> [[Int]]
solve ( Pyramids [] _ _ _ )                            = []
solve ( Pyramids a b c d ) | allEqual                  = [] {-TODO-}
                           | otherwise                 = error "Invalid input"
                           where allEqual = equalLengths [a, b, c, d]
