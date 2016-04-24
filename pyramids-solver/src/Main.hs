module Main where
import System.Environment (getArgs)
import System.Directory (doesFileExist)
import Control.Monad
import Solver

main = do
  {-read filename-}
  putStrLn "Input file: "
  fileName <- getLine
  putStrLn ("Received file name: " ++ fileName)

  {-assert file exists-}
  fileExists <- doesFileExist fileName
  unless fileExists $ error "File does not exist."

  {-read task-}
  fileContent <- readFile fileName
  let task = read fileContent :: Pyramids

  putStrLn "Task: "
  putStrLn (show task)

  putStrLn "Solution: "
  putStrLn $ show (solve task)





