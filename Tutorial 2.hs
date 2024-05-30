appendList :: [Char] -> [Char] -> [Char]
appendList [] y
   = y
appendList (x:xs) y
   = x : appendList xs y

reverseList :: [Char] -> [Char]
reverseList []
   = []
reverseList (x:xs)
   = appendList (reverseList xs) [x] 

takeList :: Int -> [Int] -> [Int]
takeList 0 xs
   = []
takeList n []
   = []
takeList n (x:xs)
   =  x : takeList (n-1) xs

dropList :: Int -> [Int] -> [Int]
dropList n []
   = []
dropList 0 xs
   = xs
dropList n (x:xs)
   = dropList (n-1) xs

splitList :: Int -> [Int] -> ([Int], [Int])
splitList n []
   = ([], [])
splitList 0 xs
   = ([],xs)
splitList n (x:xs)
   = (x : as, bs)
   where
   (as, bs) = splitList (n-1) xs

memberSet :: Int -> [Int] -> Bool
memberSet e []
   = False
memberSet e (x:xs)
   | e == x = True
   | otherwise = memberSet e xs

unionSet :: [Int] -> [Int] -> [Int]
unionSet [] ys
   = ys
unionSet (x:xs) ys
   | memberSet x ys = unionSet xs ys
   | not (memberSet x ys) = x : unionSet xs ys

intersectSet :: [Int] -> [Int] -> [Int]
intersectSet [] ys
   = []
intersectSet (x:xs) ys
   | memberSet x ys = x : intersectSet xs ys
   | otherwise = intersectSet xs ys

add0 :: Int -> Int -> Int
add0
   = (+)

main :: IO ()
main
   = print(add0 1 2)