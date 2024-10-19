-- Import allows access to "sort" and "sortBy" functions
import Data.List

-- Declare datatype to choose how to sort people
data SortOrder = Age | Name 

-- Declare person datatype with name and age
data Person = Person { 
                name :: String, 
                age :: Int}
                    deriving (Show, Eq)

-- Instance of Ord for Person datatype
-- Allows "sort" function in "Data.List" to sort a list of Person datatypes by name
instance Ord Person where 
    compare (Person n1 _) (Person n2 _) = compare n1 n2 

-- Comparison function to allow us to also sort people by age
compareAge :: Person -> Person -> Ordering 
compareAge (Person _ a) (Person _ b) =
    compare b a 

-- 
sortPeople :: SortOrder -> [Person] -> [Person]
sortPeople Name x = sort x 
sortPeople Age x = sortBy compareAge x 


main :: IO ()
main = do 
    let people = [(Person "Hal" 20), (Person "Susann" 31), (Person "Dwight" 19), (Person "Kassandra" 21),
         (Person "Lawrence" 25), (Person "Cindy" 22), (Person "Cory" 27), (Person "Mac" 19),
         (Person "Romana" 27), (Person "Doretha" 32), (Person "Danna" 20), (Person "Zara" 23),
         (Person "Rosalyn" 26), (Person "Risa" 24), (Person "Benny" 28), (Person "Juan" 33),
         (Person "Natalie" 25)]
    let numbers = [645.41, 37.59, 76.41, 5.31, 1.11, 1.10, 23.46, 635.47, -876.32, 467.83, 62.25]
    
    putStrLn "Sort list of generic ordinal values (ascending order):"
    print (sort numbers) 

    putStrLn "\nSort list of people, lexigraphically (ascending order by Name):"
    print (sortPeople Name people)

    putStrLn "\nSort list of poeple, descending order (decending order by Age):"
    print (sortPeople Age people)
