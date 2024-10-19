module Lib
    ( someFunc
    , mergeSort
    ) where

someFunc :: IO ()
someFunc = putStrLn "Hello World!"

merge :: Ord a => [a] -> [a] -> [a]
-- Pattern matching instance: Refer to notes section below
merge [] right = right
merge left [] = left
merge left right = el : (merge left' right') where
    el = min (head left) (head right)
    -- left' = Determined by element from left or right list
        -- finding minimum or smallest element from left list means left' = tail of left list
    -- if right element is found as first element to be compared (minimum/smallest), then left' list = left list
    left' = choose left right
    right' = choose right left
    choose list1 list2 
        | (compare (head list1) (head list2)) == GT = list1 -- GT(>), LT(<), EQ(=)
        | otherwise = tail list1 -- handles EQ & LT cases.

mergeSort :: Ord a => [a] -> [a]
-- Pattern matching instance: Refer to notes section below
mergeSort [] = []
mergeSort [x] = [x] 
-- new List uses merge function, which takes 2 params of mergeSorted left and right lists
mergeSort list = merge (mergeSort left) (mergeSort right) 
    where
    -- pivot at midpoint of list 
    pivot = (length list) `div` 2
    left = take pivot list
    -- Once left side of list is merged, drop left side of list and return remaining right side list.
    right = drop pivot list



----------------    NOTES    ------------------

-- "Ord a" allows comparison functions to be utilized in function.

-- Pattern Matching: Arguments provided in a function expression can be matched from the definitin of a function
-- e.g. Is the list empty?
    -- Function Declaration: isEmpty receives a list of elements a
    -- isEmpty :: [a] -> Bool
        -- Function definition: if argument provided = empty list, then output true 
        -- isEmpty [] = True
        -- isEmpty xs = False -- if argument provided = anything else, output false  
        -- testing via terminal: "isEmpty []" outputs true, but "isEmpty [2]" outputs false.

-- Guards (Similar to pattern matching) & similar to switch statement
    -- isEmpty :: Eq a => [a] -> Bool
    -- isEmpty list 
    --     | list == [] = True -- if list is empty, output true.
    --     | otherwise = False -- otherwise clause, output false.
    -- Identical to testing via terminal above.


----------------    NOTES    ------------------