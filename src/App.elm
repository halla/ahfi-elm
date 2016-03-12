module App (..) where

import Route
import Blog
import Html exposing (text, div, p, ul, li, a)
import Effects exposing (Effects)
import Signal

type alias Model =
    { blogPosts : List Blog.Post
    , route : Route.Model
    }

initialModel : Model
initialModel =
    { blogPosts = (fst Blog.init)
    , route = Route.initialModel
    }

init : (Model, Effects Action)
init =
    (initialModel, Effects.none)

type Action
    = NoOp
    | RouteAction Route.Action
    | BlogAction Blog.Action


update : Action -> Model -> (Model, Effects Action)
update action model =
    case (Debug.log "action" action) of
        RouteAction subAction ->
            let
                (updatedRoute, fx) = Route.update subAction model.route
            in
                ( { model | route = updatedRoute }, Effects.none)
        BlogAction subAction ->
            let
                (updatedModel, fx) = Blog.update subAction model.blogPosts
            in
                ( { model | blogPosts = updatedModel }, Effects.map BlogAction fx)
        NoOp ->
            ( model, Effects.none )


view : Signal.Address Action -> Model -> Html.Html 
view address model =
    case model.route.view of
        Route.Index -> text "hep"
        Route.ViewPost -> text "viewpost"
        Route.NotFound -> text "notfound"
