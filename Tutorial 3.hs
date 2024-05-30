inc :: Int -> Int
inc x
   = x + 1

incList :: [ Int ] -> [ Int ]
incList []
   = []
incList (x:xs)
   = inc x : incList xs

neg :: Bool -> Bool
neg x
   = not x

negList :: [ Bool ] -> [ Bool ]
negList []
   = []
negList (x:xs)
   = neg x : negList xs

mapList :: (a -> b) -> [ a ] -> [ b ]
mapList f []
   = []
mapList f (x:xs)
   = f x : mapList f xs

single :: Int -> Bool
single n
   = n >= 0 && n <= 9

singleList :: [ Int ] -> [ Int ]
singleList []
   = []
singleList (x:xs)
  | single x  = x : singleList xs
  | otherwise = singleList xs

palindrome :: String -> Bool
palindrome x
   = x == reverse x

palindromeList :: [ String ] -> [ String ]
palindromeList []
   = []
palindromeList (x:xs)
   | palindrome x = x : palindromeList xs
   | otherwise = palindromeList xs

filterList :: (a -> Bool) -> [ a ] -> [ a ]
filterList f []
   = []
filterList f (x:xs)
   | f x = x : filterList f xs
   | otherwise = filterList f xs

partitionList :: (a -> Bool) -> [ a ] -> ([ a ], [ a ])
partitionList f []
   = ([],[])
partitionList f xs
   = (filterList f xs, filterList (not . f) xs)

partitionList2 :: (a -> Bool) -> [ a ] -> ([ a ], [ a ])
partitionList2 f []
   = ([],[])
partitionList2 f xs
   = ([ x | x <- xs, f x ], [ x | x <- xs, (not . f) x ])

qsort :: Ord a => [ a ] -> [ a ]
qsort []
   = []
qsort ( x : xs )
   = qsort as ++ [ x ] ++ qsort bs
   where
   ( as , bs ) = partitionList ( < x ) xs

main :: IO ()
main
   = print(qsort [1,23,12,3,4,45])