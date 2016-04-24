module Solver where


data Pyramids = Pyramids [Maybe Int] [Maybe Int] [Maybe Int] [Maybe Int] deriving (Show, Read)

solve :: Pyramids -> Maybe [[Int]]
solve a = Nothing {-TODO-}