import Html

-- main = text (Debug.toString (Debug.log "one" {a = 1, b = 2}))
main = [1,2,3] |> Debug.log "one" |> Debug.toString |> Html.text