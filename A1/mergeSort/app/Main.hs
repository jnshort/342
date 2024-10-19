module Main (main) where

import Lib

main :: IO ()
main = do
    putStrLn "Test Case #1: Even num of elements"
    -- Test case w/ a list of even number of elements
    print (mergeSort [5, 2, 4, 7, 1, 3, 2, 6])

    putStrLn "Test Case #2: Odd num of elements"
    -- Test case w/ a list of odd number of elements
    print (mergeSort [10, 1, 8, 7, 3, 4, 5, 6, 2, 9, 0])

    putStrLn "Test Case #3: Reversed List of elements"
    -- Test case w/ a reversed list of elements
    print (mergeSort [10, 9, 8, 7, 6, 5, 4, 3, 2, 1])

    putStrLn "Test Case #4: List already sorted"
    -- Test case w/ a list of elements already sorted
    print (mergeSort [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])

    putStrLn "Test Case #5: Single element"
    -- Test case w/ a single element
    print (mergeSort [42])

    putStrLn "Test Case #6: Empty list"
    print (mergeSort ([] :: [Int]))