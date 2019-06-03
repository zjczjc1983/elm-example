port module Main exposing (..)
import Browser
import Html exposing (text)

port sendToBrowser: String -> Cmd msg

type Msg = Nothing

init _ = ("", sendToBrowser "这是通过port端口发送到浏览器的字符串")
update _ _ = ("", Cmd.none)
subscriptions _ = Sub.none
view _ = text "port用法"

main : Program () String Msg
main =
  Browser.element
    { init = init
    , update = update
    , subscriptions = subscriptions
    , view = view
    }