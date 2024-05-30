containsList :: [ String ] -> String -> Bool
containsList [] s 
   = False
containsList (x:xs) s
   | x == s = True
   | otherwise = containsList xs s

isSetList :: [String] -> Bool
isSetList []
   = True
isSetList (x:xs)
   | containsList xs x = False
   | otherwise = isSetList xs

largestList :: [Int] -> Int
largestList [e]
   = e 
largestList (x:xs)
   | x > largestList xs = x
   | otherwise = largestList xs

insert :: Int -> [Int] -> [Int]
insert e []
 = [e]
insert e (x:xs)
   | e < x = e : x : xs
   | otherwise = x : insert e xs

sortList :: [Int] -> [Int]
sortList []
   = []
sortList (x:xs)
   = insert x (sortList xs)
 
main :: IO ()
main
   = print(sortList [1,2,2,1,3,6,5,4])