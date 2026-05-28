module Main exposing (main)

import Browser
import Html exposing (Html, div, h1, text)
import Html.Attributes exposing (style)


type alias Model =
    { message : String
    }


type Msg
    = NoOp


init : () -> ( Model, Cmd Msg )
init _ =
    ( { message = "Pokédex Browser" }, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )


view : Model -> Html Msg
view model =
    div [ style "padding" "2rem" ]
        [ h1 [] [ text model.message ]
        , div [] [ text "Elm is running." ]
        ]


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
