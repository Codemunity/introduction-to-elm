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
view =
  div [ class "container" ]
    [ input [ type_ "text", onInput NewInput, placeholder "Name" ] []
    , button [ onClick ToggleVisibility ] [ text "Toggle Visibility" ]
    , p [ hidden model.isHidden ] [ text ("Hello, " ++ model.nameInput) ]
    ]

-- UPDATE

update : Msg -> Model -> Model
update msg model =
  case msg of
    ToggleVisibility ->
      { model | isHidden = not model.isHidden }
    NewInput name ->
      { model | nameInput = name }
