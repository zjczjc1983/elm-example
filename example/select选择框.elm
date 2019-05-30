import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

init : () -> (String, Cmd Msg)
init _ =
  ("ok", Cmd.none)

type Msg
  = Msg1 String

update msg model =
  case msg of
    Msg1 str ->
      (str, Cmd.none)

view model =
  div []
    [ select
        [ onInput Msg1 ]
        [ option [ value "first" ] [ text "first" ]
        , option [ value "second" ] [ text "second" ]
        ]
      , 
      div [] [ text model ]
    ]
 
subscriptions model =
    Sub.none

main =
  Browser.element
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }