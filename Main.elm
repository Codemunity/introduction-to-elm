-- MODEL

type alias Model =
  { nameInput : String
  , isHidden: Bool
  }

type Msg
  = ToggleVisibility
  | NewInput String

-- VIEW

view : Model -> Html Msg
view model =
  div [ class "container" ]
    [ input [ type_ "text", onInput NewInput, placeholder "Name" ] []
    , button [ onClick ToggleVisibility ] [ text "Toggle Visibility" ]
    , p [ hidden model.isHidden ] [ text ("Hello, " ++ model.nameInput) ]
    ]
