import Browser
import List exposing (map)
import Html exposing (Html, button, input, div, text)
import Html.Events exposing (onBlur, onInput)
import Elm.Note exposing (note)
import Elm.Components.Divider exposing (divider)

type alias AppState =
  {
    notes : List String
  }

initialState : AppState
initialState = { notes = [] }

main =
  Browser.sandbox {
    init = initialState,
    update = update,
    view = view
  }

type Msg = Add String
  | CreateNew

updateLast : List String -> String -> List String
updateLast notes newNote =
  case notes of
    [] -> [newNote]
    (_::last) -> newNote::last

update : Msg -> AppState -> AppState
update msg model =
  case msg of
    Add newNote -> { notes = updateLast model.notes newNote }
    CreateNew -> { notes = ""::model.notes }

addDividers : Html Msg -> Html Msg
addDividers n = div [] [n, divider]

view : AppState -> Html Msg
view model =
  div [] [
    input [onInput Add, onBlur CreateNew] []
    , div [] (map addDividers (map note model.notes))
  ]
