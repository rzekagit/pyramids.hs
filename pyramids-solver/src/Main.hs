import System.Environment (getArgs)
import System.Directory (doesFileExist)
import Control.Monad

main = do
  putStrLn "Input file: "
  fileName <- getLine
  putStrLn ("Received file name: " ++ fileName)

  fileExists <- doesFileExist fileName
  unless fileExists $ error "File does not exist."


