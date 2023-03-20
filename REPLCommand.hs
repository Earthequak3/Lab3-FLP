
module REPLCommand where

import Lab2
import Control.Applicative (many, (<|>))

data REPLCommand
  = Quit
  | Load String
  | Eval String

replCommand::Parser REPLCommand
replCommand = quit <|>load <eval>

quit::Parser REPLCommand
quit = do
    symbol ":q" <|> symbol ":quit"
    return Quit
load = do
    symbol":l" <|> symbol":load"
    str <- many anychar
    return $ Load str

eval::Parser REPLCommand
eval = do
    str <-many anychar
    return $ Eval str
