module Solver where
import Data.List
import Data.Maybe

data Pyramids = Pyramids [Maybe Int] [Maybe Int] [Maybe Int] [Maybe Int] deriving (Show, Read)

equalLengths :: [[a]] -> Bool
equalLengths []                         = True
equalLengths (x:[])                     = True
equalLengths (x:xs) | firstTwoEqual     = equalLengths xs
                    | otherwise         = False
                    where firstTwoEqual = (length x == length (head xs) )

solve :: Pyramids -> Maybe [[Int]]
solve ( Pyramids up down left right ) | allEqual = listToMaybe $ bruteforce ( Pyramids up down left right )
                                      | otherwise = error "Invalid input" -- niepotrzebne, bo w za³o¿eniach polecenia jest ¿e input jest poprawny, ale zostawi³em.
                                      where
                                        -- Checks constraint in a single line
                                        lineConstraint :: Maybe Int -> [Int] -> Bool
                                        lineConstraint Nothing _ = True
                                        lineConstraint (Just i) xs = checkConstraint 0 i xs
                                          where checkConstraint _ 0 [] = True
                                                checkConstraint _ _ [] = False
                                                checkConstraint maksymalny constraint (head:tail) = if head > maksymalny then checkConstraint head (constraint-1) tail   -- jesli mniejszy niz maksylmalny => widaæ go
                                                                                                    else checkConstraint maksymalny constraint tail -- byl mniejszy niz maksymalny, nie widac. 

                                        -- Checks if whole board satisfies constraints
                                        allLinesConstraint :: Pyramids -> [[Int]] -> Bool
                                        allLinesConstraint (Pyramids up down left right) rows =
                                           and $ -- zamiast (\x->x) jest all id, które zamieni³em na and  ref: http://stackoverflow.com/questions/8339264/haskell-check-if-two-lists-are-equal
                                              zipWith lineConstraint left rows ++
                                              zipWith lineConstraint right (map reverse rows) ++
                                              zipWith lineConstraint up columns ++
                                              zipWith lineConstraint down (map reverse columns)
                                           where columns = transpose rows -- kolumny to transponowane rzedy

                                        -- check if there are no duplicates in a column (need to be used only for columns)
                                        noDuplicates x = x == removeDups' x -- checks if x equals x after removing duplicates
                                          where
                                            removeDups' [] = [] -- removes duplicates from a list
                                            removeDups' [x] = [x]
                                            removeDups' (x:xs) =
                                              if elem x xs then removeDups'(xs)
                                                           else [x] ++ removeDups'(xs)
                                        -- solving using brute-force method
                                        bruteforce (Pyramids a b l r) =
                                           filter (allLinesConstraint (Pyramids a b l r)) $ allBoards    -- TODO : Prawdopodobnie tutaj trzeba dodac jakies bardziej skomplikowane filtorwanie ze wszystkich plansz.
                                           where allBoards = filter nodups $ sequence $ replicate size allRows   -- Problem: I tak na pocz¹tku generujemy wszystkie plansze, a potem tylko usuwamy niepotrzebne, czyli na poczatku i tak ca³a pamieæ zu¿ywana
                                                 nodups rows = all noDuplicates (transpose rows)
                                                 allRows = permutations [1..size]
                                                 size = length a
                                        
                                        allEqual = equalLengths [up, down, left, right] -- niepotrzebne, bo w za³o¿eniach polecenia jest ¿e input jest poprawny, ale zostawi³em.