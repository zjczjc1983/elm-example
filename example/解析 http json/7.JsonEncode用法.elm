import Html exposing (..)
import Json.Encode

tom =
  Json.Encode.object
    [ ( "name", Json.Encode.string "Tom" )
    , ( "age", Json.Encode.int 42)
    ]

compact = Json.Encode.encode 0 tom

main =
  text compact