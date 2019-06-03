import Browser
import Browser.Navigation as Nav
import Html exposing (text)
import Url

type alias Model =
  { key : Nav.Key
  , url : Url.Url
  }

init flags url key =
  ( Model key url, Cmd.none )

type Msg
  = ChangeUrl Url.Url
  | ClickedLink Browser.UrlRequest

subscriptions model =
    Sub.none

view model =
  { title = "ok"
  , body =
      [ text "ok,too" ]
  }

update msg model =
  case msg of
    ClickedLink urlRequest ->
      case urlRequest of
        Browser.Internal url ->
          ( model, Cmd.none )
        Browser.External href ->
          ( model, Cmd.none)
    ChangeUrl url ->
      ( model, Cmd.none )
    
main : Program () Model Msg
main =
  Browser.application
    { init = init
    , onUrlChange = ChangeUrl
    , onUrlRequest = ClickedLink
    , subscriptions = subscriptions
    , update = update
    , view = view
    }