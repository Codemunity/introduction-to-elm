import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

main =
  Html.beginnerProgram
    { model = initialModel
    , update = update
    , view = view
    }
