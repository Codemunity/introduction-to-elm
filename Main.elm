-- MODEL

type alias Model =
  { nameInput : String
  , isHidden: Bool
  }

type Msg
  = ToggleVisibility
  | NewInput String
