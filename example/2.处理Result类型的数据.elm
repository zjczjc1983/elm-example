import Html exposing (..)
import Json.Decode
import Debug exposing (toString)

decodeJson json =
  let
    thisIsResultType = Json.Decode.decodeString Json.Decode.int json
  in
    case thisIsResultType of
      Ok data ->
        data
      Err _ ->
        0

main =
  text (toString (decodeJson "120"))