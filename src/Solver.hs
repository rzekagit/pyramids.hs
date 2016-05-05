module Solver where


data Pyramids = Pyramids [Maybe Int] [Maybe Int] [Maybe Int] [Maybe Int] deriving (Show, Read)

equalLengths :: [[a]] -> Bool
equalLengths []                         = True
equalLengths (x:[])                     = True
equalLengths (x:xs) | firstTwoEqual     = equalLengths xs
                    | otherwise         = False
                    where firstTwoEqual = (length x == length (head xs) )

solve :: Pyramids -> [[Int]]
solve ( Pyramids up down left right ) | allEqual   = [] {-TODO-}
                                      | otherwise  = error "Invalid input"
                                      where allEqual = equalLengths [up, down, left, right]



