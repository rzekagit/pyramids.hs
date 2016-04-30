module Main where

import Test.QuickCheck
import Solver
import System.Exit

main = do
    let givenTask = Pyramids [Just 3, Nothing, Just 1, Nothing] [Nothing, Nothing, Nothing, Nothing] [Nothing, Nothing, Just 4, Nothing] [Nothing, Just 3, Nothing, Nothing]

    if solve givenTask == [[2, 1, 4, 3], [3, 4, 2, 1], [1, 2, 3, 4], [4, 3, 2, 1]] then exitSuccess else exitFailure