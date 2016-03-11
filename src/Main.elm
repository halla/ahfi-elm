import StartApp
import Task
import Effects exposing (Never)
import Blog exposing (init, view, update)

app =
    StartApp.start
        { init = init
        , view = view
        , update = update
        , inputs = []
        }

main = app.html


port tasks : Signal (Task.Task Never ())
port tasks =
    app.tasks