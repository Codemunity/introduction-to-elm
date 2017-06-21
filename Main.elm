import Html exposing (..)

name : String
name = "Elm"


greet : String -> String
greet name =
  "Hello, " ++ name

main =
  text (greet name)
