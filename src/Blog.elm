module Blog (init, view, update) where

import Html exposing (text, div, p, ul, li, a)
import Html.Attributes exposing (class)
import Effects exposing (Effects)
import Signal


type alias Post =
    { title: String }

type alias Model =
    List Post

posts =
    [{ title = "hep"}]

init : (Model, Effects Action)
init =
    (posts, Effects.none)

view : Signal.Address Action -> Model -> Html.Html
view action model =
    div [class "container"] [frontPage model]


frontPage model =
    div [class "front-page"] [div [class "row"]  [col1 model, col2]]


col1 model =
    div [class "col-md-8"] [intro, postsList model]

col2 =
    div [class "col-md-4"] [text "col2"]

intro =
    div [class "intro"] [
        p [] [text "The web is my platform."],
        p [] [text "I've been experimenting with a range of technologies to create software for the web. Besides helping me think and learn &ndash; and paying my bills &ndash; it enabled me to say goodbye to the cubicle and explore the world."]
    ]


postLink post =
    a [] [(text post.title)]

renderPost post =
    li [] [postLink post]

postsList model =
    ul [class "blog-list-simple list-unstyled"] (List.map renderPost model)

--  UPDATE --

type Action =
    NoOp

update : Action -> Model -> (Model, Effects Action)
update action model = (model, Effects.none)
