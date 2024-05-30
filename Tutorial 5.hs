import Data.List

special :: [Char] -> Bool
special s =
  '0' `notElem` s && nub s == s

generator :: [(String, String, String, String)]
generator =
  [ (a, b, c, d)
    | a <- filter special (map show [111 .. 999]),
      b <- permutations a \\ [a],
      c <- permutations a \\ [a, b],
      d <- permutations a \\ [a, b, c]
  ]

perfectSquare :: Int -> Bool
perfectSquare n
   = root 1
   where
   root r
      | r * r > n = False
      | r * r < n = root (r+1)
      | otherwise = True

prime :: Int -> Bool
prime
   = not . factorisable 2

factorisable :: Int -> Int -> Bool
factorisable f n
   | f * f <= n = n `mod` f == 0 || factorisable (f+1) n
   | otherwise = False

tester :: (String, String, String, String) -> Bool
tester (s1,s2,s3,s4) =
  perfectSquare i1
  && prime (i1+i2+i3+i4)
  && not(null (filter perfectSquare is))
  where
  [i1,i2,i3,i4] = map read [s1,s2,s3,s4]
  is = map read (permutations s1 \\ [s1,s2,s3,s4])

main :: IO ()
main =
  print (filter tester generator)