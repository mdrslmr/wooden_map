{- cabal:
   build-depends:      base , linear , time 
   build-tool-depends: markdown-unlit:markdown-unlit
   ghc-options:        -pgmL markdown-unlit -Wall
-}
module Main where

import Linear.V3 (V3(V3))
import Data.String (String)
import Data.List (sort)

genericPiece :: [V3 Int]
genericPiece = [ V3 0 0 0, V3 0 0 1, V3 0 0 2, V3 0 0 3, V3 0 1 2 ]

type Shape = [V3 Int]


allSolutionsSmart :: [Shape]
allSolutionsSmart = [[V3 1 1 1,V3 1 2 1,V3 1 3 1,V3 1 4 1,V3 1 3 2],[V3 1 1 5,V3 1 1 4,V3 1 1 3,V3 1 1 2,V3 1 2 3],[V3 4 2 2,V3 3 2 2,V3 2 2 2,V3 1 2 2,V3 2 2 3],[V3 4 2 4,V3 3 2 4,V3 2 2 4,V3 1 2 4,V3 2 2 5],[V3 1 5 5,V3 1 4 5,V3 1 3 5,V3 1 2 5,V3 1 3 4],[V3 2 3 1,V3 2 3 2,V3 2 3 3,V3 2 3 4,V3 1 3 3],[V3 1 4 2,V3 2 4 2,V3 3 4 2,V3 4 4 2,V3 3 3 2],[V3 1 5 1,V3 1 5 2,V3 1 5 3,V3 1 5 4,V3 1 4 3],[V3 4 4 4,V3 3 4 4,V3 2 4 4,V3 1 4 4,V3 2 4 5],[V3 5 1 1,V3 4 1 1,V3 3 1 1,V3 2 1 1,V3 3 1 2],[V3 2 1 2,V3 2 1 3,V3 2 1 4,V3 2 1 5,V3 3 1 4],[V3 2 2 1,V3 3 2 1,V3 4 2 1,V3 5 2 1,V3 4 3 1],[V3 3 1 5,V3 3 2 5,V3 3 3 5,V3 3 4 5,V3 2 3 5],[V3 5 4 1,V3 4 4 1,V3 3 4 1,V3 2 4 1,V3 3 3 1],[V3 2 5 5,V3 2 5 4,V3 2 5 3,V3 2 5 2,V3 2 4 3],[V3 2 5 1,V3 3 5 1,V3 4 5 1,V3 5 5 1,V3 4 5 2],[V3 3 1 3,V3 3 2 3,V3 3 3 3,V3 3 4 3,V3 3 3 4],[V3 3 5 2,V3 3 5 3,V3 3 5 4,V3 3 5 5,V3 4 5 4],[V3 4 1 2,V3 4 1 3,V3 4 1 4,V3 4 1 5,V3 5 1 4],[V3 4 5 3,V3 4 4 3,V3 4 3 3,V3 4 2 3,V3 4 3 2],[V3 4 5 5,V3 4 4 5,V3 4 3 5,V3 4 2 5,V3 4 3 4],[V3 5 1 2,V3 5 2 2,V3 5 3 2,V3 5 4 2,V3 5 3 1],[V3 5 4 3,V3 5 3 3,V3 5 2 3,V3 5 1 3,V3 5 2 4],[V3 5 1 5,V3 5 2 5,V3 5 3 5,V3 5 4 5,V3 5 3 4],[V3 5 5 2,V3 5 5 3,V3 5 5 4,V3 5 5 5,V3 5 4 4]]


{-
 - Assigning symbols to the peaces parts:
 -
 -     E
 - A B C D
 -
-}

data Symbol = O | A | B | C | D | E
    deriving (Show, Eq, Ord)

type Map = [(V3 Int, Symbol)]

initMap :: Map
initMap = []

cube :: [Shape] -> Map -> Map
cube xs m = foldl (flip peace) m xs

peace :: Shape -> Map -> Map
peace [a, b, c, d, e] m = put A a (put B b (put C c (put D d (put E e m))))

put :: Symbol -> V3 Int -> Map -> Map
put s v m = e:m
    where e = (v, s)

formatMap :: Map -> String
formatMap m = formatLines 1 (sort m)

formatLines :: Int -> Map -> String
formatLines i ((_,s):xs) | i `mod` 25 == 0 = show s ++ "\n\n" ++ 
                                                    formatLines (i+1) xs
formatLines i ((_,s):xs) | i `mod` 5 == 0 = show s ++ "\n" ++
                                                    formatLines (i+1) xs
formatLines i ((_,s):xs) = show s ++ " " ++ formatLines (i+1) xs
formatLines i [] = "\n"


main :: IO ()
main = do
  let s = allSolutionsSmart
  if length s == 25 
  then
        do 
            putStrLn "The symbols are related to the peace like this: \n"
            putStrLn "    E  "
            putStrLn "A B C D"
            putStrLn "\n"
            putStrLn $ formatMap $ cube s initMap
  else
        print "Wrong size for layer display"
    


