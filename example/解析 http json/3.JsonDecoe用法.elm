import Html exposing (..)
import Json.Decode
import Debug exposing (toString)
import Array exposing (..)
import Dict exposing (..)

jsonIntToElmInt json =
  let
    thisIsResultType = Json.Decode.decodeString (Json.Decode.nullable Json.Decode.int) json
  in
    case thisIsResultType of
      Ok num ->
        num
      {- 返回值为Maybe类型 -}
      Err err ->
        Nothing

jsonArrayToElmArray json =
  let
    thisIsResultType = Json.Decode.decodeString (Json.Decode.array Json.Decode.int) json
  in
    case thisIsResultType of
      Ok num ->
        num
      {- 返回值为Array类型 -}
      Err _ ->
        Array.fromList [] 

jsonObjToElmDict json =
  let
    thisIsResultType = Json.Decode.decodeString (Json.Decode.dict Json.Decode.int) json
  in
    case thisIsResultType of
      Ok obj ->
        obj
      {- 返回值为Dict类型 -}
      Err _ ->
        Dict.fromList []

jsonObjToElmDict2 json =
  let
    thisIsResultType = Json.Decode.decodeString (Json.Decode.keyValuePairs Json.Decode.int) json
  in
    case thisIsResultType of
      Ok obj ->
        obj
      {- 返回值为List类型 -}
      Err _ ->
        []
        
main =
  div []
   [ div []
      [ text "\"1983\" => "
      , text (toString (jsonIntToElmInt "1983"))
      , text " （json数字转elm整型）"
      ]
   , div []
      [ text "\"\" => "
      , text (toString (jsonIntToElmInt ""))
      , text " （可接受json空字符串）"
      ]
   , div []
      [ text "\"[1,2,3]\" => "
      , text (toString (jsonArrayToElmArray "[1,2,3]"))
      , text " （json数组转elm数组）"
      ]
   , div []
      [ text "\"{\"alice\": 42, \"bob\": 99}\" => "
      , text (toString (jsonObjToElmDict "{\"alice\": 42, \"bob\": 99}"))
      , text " （json对象转elm数组）"
      ]
   , div []
      [ text "\"{\"alice\": 42, \"bob\": 99}\" => "
      , text (toString (jsonObjToElmDict2 "{\"alice\": 42, \"bob\": 99}"))
      , text " （json对象转elm数组）"
      ]
   ]