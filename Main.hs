module Main where

import System.IO

import Lab2
import Exp
import Parsing
import Printing
import REPLCommand

main :: IO ()
main = do
    putStr "miniHaskell> "
    s <- getline
    case parseFirst replCommand s of
        Nothing -> putStrLn "Cannot parse" >> main
        Just Quit -> return()
        Just (load_) -> putStrLn "Not implemented">>main

        Just(Eval es) ->
            case parseFirst exprParse es of
                Nothing ->putStrLn "Error" >>main
                Just e -> putStrLn (showExp e) >> main

