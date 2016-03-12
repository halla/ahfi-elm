module Route (..) where

import Effects exposing (Effects, Never)
import Hop

type Action
    = HopAction Hop.Action
    | ShowIndex Hop.Payload
    | ShowPost Hop.Payload
    | ShowNotFound

type AvailableView
    = Index
    | ViewPost
    | NotFound

type alias Model =
    { routerPayload : Hop.Payload
    , view : AvailableView
    }

initialModel =
    { routerPayload = router.payload
    , view = Index
    }


update : Action -> Model -> (Model, Effects Action)
update action model =
    case action of
        ShowIndex payload ->
            ( model | view = Index,  Effects.none )
        ShowPost payload ->
            ( model | view = ViewPost, Effects.none)
        _ -> (model, Effects.none)




routes : List (String, Hop.Payload -> Action)
routes =
    [ ( "/", Index )
    , ( "/blog/:year/:month/:slug", ShowPost )
    ]

router : Hop.Router Action
router =
    Hop.new
        { routes = routes
        , notFoundAction = ShowNotFound
        }
