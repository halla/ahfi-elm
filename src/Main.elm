import StartApp
import Task
import Effects exposing (Never)
import App exposing (init, view, update, Action)

import Route exposing (router)

app =
    StartApp.start
        { init = init
        , view = view
        , update = update
        , inputs = [ routerSignal ]
        }

main = app.html

routerSignal : Signal Action
routerSignal =
    Signal.map App.RouteAction router.signal

port tasks : Signal (Task.Task Never ())
port tasks =
    app.tasks

port routeRunTask : Task.Task () ()
port routeRunTask =
    router.run
