module Blog (init, view, update) where

import Html exposing (text)
import Effects exposing (Effects)
import Signal

type alias Model =
    { title: String }

init : (Model, Effects Action)
init =
    ({ title = "Hep"
    }, Effects.none)

view : Signal.Address Action -> Model -> Html.Html
view action model =
    text "Hello World"

--  UPDATE --

type Action =
    NoOp

update : Action -> Model -> (Model, Effects Action)
update action model = (model, Effects.none)
