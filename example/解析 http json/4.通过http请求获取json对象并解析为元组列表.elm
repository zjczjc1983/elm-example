import Browser
import Debug exposing (toString)
import Html exposing (text)
import Http
import Json.Decode exposing (int, string, keyValuePairs)

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
  | Success (List (String, Int))

init : () -> (Model, Cmd Msg)
init _ =
  ( Loading
  , Http.get
      { url = "http://localhost:3000/intObj"
      , expect = Http.expectJson GotText dataDecoder
      }
  )

dataDecoder =
  keyValuePairs int

type Msg
  = GotText (Result Http.Error (List (String, Int)))

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