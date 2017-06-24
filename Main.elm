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

view : Model -> Html Msg
view model =
  div []
    [ input [ type_ "text", onInput NewEmail, placeholder "Email" ] []
    , input [ type_ "password", onInput NewPassword, placeholder "Password" ] []
    , input [ type_ "password", onInput NewConfirmPassword, placeholder "Confirm Password" ] []
    , div [ hidden (List.isEmpty model.errorMessages) ] [ errorsView model.errorMessages ]
    ]

errorsView : List String -> Html Msg
errorsView errors =
  ul [ style [ ("color", "red") ] ] (List.map errorView errors)

errorView : String -> Html Msg
errorView error =
  li [] [ text error ]

-- VALIDATION

emptyEmailMsg = "Email must not be empty."
invEmailMsg = "Email must have a valid format."
passLengthMsg = "Password must contain at least 6 characters."
passMatchMsg = "The passwords don't match."

errorMessage : Bool -> String -> String
errorMessage isInvalid error =
  if isInvalid then
    error
  else
    ""

validateForm : Model -> List String
validateForm model =
  let
      emptyEmailError =
        errorMessage (String.isEmpty model.emailInput) emptyEmailMsg
      invalidEmailError =
        errorMessage (String.contains "@" model.emailInput) invEmailMsg
      passwordLengthError =
        errorMessage (String.length model.passwordInput < 6) passLengthMsg
      confirmPasswordError =
        errorMessage (model.passwordInput /= model.confirmPasswordInput) passMatchMsg
      errors =
        [ emptyEmailError, invalidEmailError, passwordLengthError, confirmPasswordError ]
  in
      List.filter (\error -> not (String.isEmpty error)) errors
