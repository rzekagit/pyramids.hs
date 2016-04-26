module Solver where


data Pyramids = Pyramids [Maybe Int] [Maybe Int] [Maybe Int] [Maybe Int] deriving (Show, Read)

solve :: Pyramids -> [[Int]]
solve _ = error "Not yet implemented" {-TODO-}