module Main where

import Test.QuickCheck (quickCheckResult)
import Test.QuickCheck.Test (isSuccess)

import System.Exit (exitFailure)
import Control.Monad (unless)
import Solver

prop_shouldSolve :: Bool
prop_shouldSolve = solve (Pyramids [Just 3 , Nothing, Just 1 , Nothing]
                                   [Nothing, Nothing, Nothing, Nothing]
                                   [Nothing, Nothing, Just 4 , Nothing]
                                   [Nothing, Just 3 , Nothing, Nothing]) == Just [[2, 1, 4, 3],
                                                                             [3, 4, 2, 1],
                                                                             [1, 2, 3, 4],
                                                                             [4, 3, 1, 2]]

prop_shouldSolveEmpty :: Bool
prop_shouldSolveEmpty = solve (Pyramids [] [] [] []) == Just []

prop_shouldSolveOneD :: Bool
prop_shouldSolveOneD = solve (Pyramids [Just 1] [Just 1] [Just 1] [Just 1]) == Just [[1]]

prop_shouldCheckEqualLengths :: Bool
prop_shouldCheckEqualLengths = equalLengths [[1, 2], [2, 3]]

prop_shouldCheckEqualLengthsOfEmptyList :: Bool
prop_shouldCheckEqualLengthsOfEmptyList = equalLengths []

prop_shouldCheckEqualLengthsAndFail :: Bool
prop_shouldCheckEqualLengthsAndFail = equalLengths [[1], [1, 2, 3]] == False

main :: IO ()
main = do
  let tests = [ quickCheckResult prop_shouldSolve,
                quickCheckResult prop_shouldSolveEmpty,
                quickCheckResult prop_shouldSolveOneD,
                quickCheckResult prop_shouldCheckEqualLengths,
                quickCheckResult prop_shouldCheckEqualLengthsOfEmptyList,
                quickCheckResult prop_shouldCheckEqualLengthsAndFail ]

  success <- fmap (all isSuccess) . sequence $ tests
  unless success exitFailure
