module Printing (showExp) where

import Exp
import Data.List (intercalate)

showVar :: Var -> String
showVar = getVar

showExp::ComplexExp -> String
showExp (CX v) = showVar v
showExp (Nat n) = show n
showExp (CLam x e) = "(" ++ "\\" ++ showVar x ++ "-" ++ showExp e ++ ")"
showExp(Let x e1 e2) = "(" ++ "let" ++ showVar x ++ ":=" ++ showExp e1 ++ "in" ++ showExp e2 ++ ")"
showExp (List list) = "[" ++ intercalate "," (map showExp list) ++ "]"
