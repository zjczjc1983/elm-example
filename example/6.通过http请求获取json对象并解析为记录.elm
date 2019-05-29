import Browser
import Debug exposing (toString)
import Html exposing (text)
import Http
import Json.Decode exposing (int, field, map3)

subscriptions model =
    Sub.none

main =
  Browser.element
    { init = init
    , update = update
    , subscriptions = subscriptions
    , view = view
    }

type Model
  = Failure
  | Loading
  | Success JsonData

init : () -> (Model, Cmd Msg)
init _ =
  ( Loading
  , Http.get
      { url = "http://localhost:3000/intObj"
      , expect = Http.expectJson GotText dataDecoder
      }
  )

type alias JsonData = { prev : Int, cur : Int, next : Int }

dataDecoder =
  map3 JsonData
    (field "prev" int)
    (field "cur" int)
    (field "next" int)

type Msg
  = GotText (Result Http.Error JsonData)

update msg model =
  case msg of
    GotText result ->
      case result of
        Ok fullText ->
          (Success fullText, Cmd.none)
        Err _ ->
          (Failure, Cmd.none)

view model =
  case model of
    Failure ->
      text "Loading error"
    Loading ->
      text "Loading..."
    Success fullText ->
      text (toString fullText)