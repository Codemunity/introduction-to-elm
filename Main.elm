import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

main =
  Html.beginnerProgram
    { model = initialModel
    , update = update
    , view = view
    }

-- MODEL

type alias Model =
  { emailInput : String
  , passwordInput : String
  , confirmPasswordInput : String
  , errorMessages : List String
  }

type Msg
  = NewEmail String
  | NewPassword String
  | NewConfirmPassword String

initialModel =
    Model "" "" "" []
