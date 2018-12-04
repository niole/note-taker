import Browser
import List exposing (map)
import Html exposing (Html, button, input, div, text)
import Html.Events exposing (onInput)
import Elm.Note exposing (note)

type alias AppState =
  {
    notes : List String
  }

initialState : AppState
initialState = { notes = ["note one"]}

main =
  Browser.sandbox {
    init = initialState,
    update = update,
    view = view
  }

type Msg = Add String

update : Msg -> AppState -> AppState
update msg model =
  case msg of
    Add newNote -> { notes = model.notes ++ [newNote] }

handleKeyPress : String -> Msg
handleKeyPress text = Add text

view : AppState -> Html Msg
view model =
  div [] [
    div [] (map note model.notes)
    , input [onInput Add] []
  ]
