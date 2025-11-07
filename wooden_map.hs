{- cabal:
   build-depends:      base , linear , time 
   build-tool-depends: markdown-unlit:markdown-unlit
   ghc-options:        -pgmL markdown-unlit -Wall
-}
module Main where

import Linear.V3 (V3(V3))
import Data.String (String)

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
    deriving Show

type Map = (
                    ((Symbol,Symbol,Symbol,Symbol,Symbol),
                    (Symbol,Symbol,Symbol,Symbol,Symbol),
                    (Symbol,Symbol,Symbol,Symbol,Symbol),
                    (Symbol,Symbol,Symbol,Symbol,Symbol),
                    (Symbol,Symbol,Symbol,Symbol,Symbol)),
                    ((Symbol,Symbol,Symbol,Symbol,Symbol),
                    (Symbol,Symbol,Symbol,Symbol,Symbol),
                    (Symbol,Symbol,Symbol,Symbol,Symbol),
                    (Symbol,Symbol,Symbol,Symbol,Symbol),
                    (Symbol,Symbol,Symbol,Symbol,Symbol)),
                    ((Symbol,Symbol,Symbol,Symbol,Symbol),
                    (Symbol,Symbol,Symbol,Symbol,Symbol),
                    (Symbol,Symbol,Symbol,Symbol,Symbol),
                    (Symbol,Symbol,Symbol,Symbol,Symbol),
                    (Symbol,Symbol,Symbol,Symbol,Symbol)),
                    ((Symbol,Symbol,Symbol,Symbol,Symbol),
                    (Symbol,Symbol,Symbol,Symbol,Symbol),
                    (Symbol,Symbol,Symbol,Symbol,Symbol),
                    (Symbol,Symbol,Symbol,Symbol,Symbol),
                    (Symbol,Symbol,Symbol,Symbol,Symbol)),
                    ((Symbol,Symbol,Symbol,Symbol,Symbol),
                    (Symbol,Symbol,Symbol,Symbol,Symbol),
                    (Symbol,Symbol,Symbol,Symbol,Symbol),
                    (Symbol,Symbol,Symbol,Symbol,Symbol),
                    (Symbol,Symbol,Symbol,Symbol,Symbol)))

initMap :: Map
initMap = (
                ((O,O,O,O,O),
                (O,O,O,O,O),
                (O,O,O,O,O),
                (O,O,O,O,O),
                (O,O,O,O,O)),
                ((O,O,O,O,O),
                (O,O,O,O,O),
                (O,O,O,O,O),
                (O,O,O,O,O),
                (O,O,O,O,O)),
                ((O,O,O,O,O),
                (O,O,O,O,O),
                (O,O,O,O,O),
                (O,O,O,O,O),
                (O,O,O,O,O)),
                ((O,O,O,O,O),
                (O,O,O,O,O),
                (O,O,O,O,O),
                (O,O,O,O,O),
                (O,O,O,O,O)),
                ((O,O,O,O,O),
                (O,O,O,O,O),
                (O,O,O,O,O),
                (O,O,O,O,O),
                (O,O,O,O,O)))

type D2Map =  ((Symbol,Symbol,Symbol,Symbol,Symbol),
                    (Symbol,Symbol,Symbol,Symbol,Symbol),
                    (Symbol,Symbol,Symbol,Symbol,Symbol),
                    (Symbol,Symbol,Symbol,Symbol,Symbol),
                    (Symbol,Symbol,Symbol,Symbol,Symbol))

type Row = (Symbol,Symbol,Symbol,Symbol,Symbol)

cube :: [Shape] -> Map -> Map
cube xs m = foldl (flip peace) m xs

peace :: Shape -> Map -> Map
peace [a, b, c, d, e] m = put A a (put B b (put C c (put D d (put E e m))))

put :: Symbol -> V3 Int -> Map -> Map
put s (V3 x y 1) (l, m, n, o, p) = (put2d s x y l, m, n, o, p)
put s (V3 x y 2) (l, m, n, o, p) = (l, put2d s x y m, n, o, p)
put s (V3 x y 3) (l, m, n, o, p) = (l, m, put2d s x y n, o, p)
put s (V3 x y 4) (l, m, n, o, p) = (l, m, n, put2d s x y o, p)
put s (V3 x y 5) (l, m, n, o, p) = (l, m, n, o, put2d s x y p)
                                        
put2d :: Symbol -> Int -> Int -> D2Map -> D2Map
put2d s x 1 (j, k, l, m, n) = (putRow s x j, k, l, m, n)
put2d s x 2 (j, k, l, m, n) = (j, putRow s x k, l, m, n)
put2d s x 3 (j, k, l, m, n) = (j, k, putRow s x l, m, n)
put2d s x 4 (j, k, l, m, n) = (j, k, l, putRow s x m, n)
put2d s x 5 (j, k, l, m, n) = (j, k, l, m, putRow s x n)

putRow :: Symbol -> Int -> Row -> Row
putRow s 1 (_, b, c, d, e) = (s, b, c, d, e)
putRow s 2 (a, _, c, d, e) = (a, s, c, d, e)
putRow s 3 (a, b, _, d, e) = (a, b, s, d, e)
putRow s 4 (a, b, c, _, e) = (a, b, c, s, e)
putRow s 5 (a, b, c, d, _) = (a, b, c, d, s)

formatMap :: Map -> String
formatMap (l, m, n, o, p) = formatLayer l ++ "\n" ++
                            formatLayer m ++ "\n" ++
                            formatLayer n ++ "\n" ++
                            formatLayer o ++ "\n" ++
                            formatLayer p ++ "\n"
formatLayer :: D2Map -> String
formatLayer (j, k, l, m, n) = formatRow j ++ "\n" ++
                              formatRow k ++ "\n" ++
                              formatRow l ++ "\n" ++
                              formatRow m ++ "\n" ++
                              formatRow n ++ "\n"

formatRow :: Row -> String
formatRow (a,b,c,d,e) = show a ++ " " ++
                        show b ++ " " ++
                        show c ++ " " ++
                        show d ++ " " ++
                        show e


main :: IO ()
main = do
  let s = allSolutionsSmart
  if length s == 25 
  then
        do 
            putStrLn "The symbols are releated to the peace like this: \n"
            putStrLn "    E  "
            putStrLn "A B C D"
            putStrLn "\n"
            putStrLn $ formatMap $ cube s initMap
  else
        print "Wrong size for layer display"
    


