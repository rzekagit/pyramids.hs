module Main where

import Test.QuickCheck (quickCheckResult)
import Test.QuickCheck.Test (isSuccess)

import System.Exit (exitFailure)
import Control.Monad (when)
import Solver

prop_shouldSolve :: Bool
prop_shouldSolve = solve (Pyramids [Just 3, Nothing, Just 1, Nothing] [Nothing, Nothing, Nothing, Nothing] [Nothing, Nothing, Just 4, Nothing] [Nothing, Just 3, Nothing, Nothing]) == [[2, 1, 4, 3], [3, 4, 2, 1], [1, 2, 3, 4], [4, 3, 2, 1]]

main :: IO ()
main = do
  let tests = [ quickCheckResult prop_shouldSolve ]

  success <- fmap (all isSuccess) . sequence $ tests
  when (not success) $ exitFailure
