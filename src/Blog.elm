module Blog (init, view, update) where

import Html exposing (text, div, p)
import Html.Attributes exposing (class)
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
    div [class "container"] [frontPage]


frontPage =
    div [class "front-page"] [div [class "row"]  [col1, col2]]


col1 =
    div [class "col-md-8"] [intro]

col2 =
    div [class "col-md-4"] [text "col2"]

intro =
    div [class "intro"] [
        p [] [text "The web is my platform."],
        p [] [text "I've been experimenting with a range of technologies to create software for the web. Besides helping me think and learn &ndash; and paying my bills &ndash; it enabled me to say goodbye to the cubicle and explore the world."]
    ]


--  UPDATE --

type Action =
    NoOp

update : Action -> Model -> (Model, Effects Action)
update action model = (model, Effects.none)
