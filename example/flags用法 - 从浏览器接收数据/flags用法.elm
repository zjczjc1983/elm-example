import Browser
import Html exposing (..)

type Msg = Int

init : String -> (String, Cmd Msg)
init fromTheBrowser = ( fromTheBrowser, Cmd.none )
view str = text str
update _ _ = ( "", Cmd.none )
subscriptions _ = Sub.none

-- main : Program () String Msg
main =
  Browser.element
    { init = init
    , update = update
    , subscriptions = subscriptions
    , view = view
    }