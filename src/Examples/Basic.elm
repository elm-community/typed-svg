module Examples.Basic exposing (Model, Msg(..), view)

import Color
import Html exposing (Html)
import TypedSvg exposing (circle, svg)
import TypedSvg.Attributes exposing (cx, cy, fill, r, stroke, strokeWidth, viewBox)
import TypedSvg.Types exposing (Fill(..), px)


type Msg
    = NoOp


type alias Model =
    Int


view : Model -> Html Msg
view model =
    svg
        [ viewBox 0 0 800 600
        ]
        [ circle
            [ cx (px 150)
            , cy (px 150)
            , r (px 30)
            , fill <| Fill Color.black
            , strokeWidth (px 2)
            , stroke <| Color.rgba 90 60 60 0.5
            ]
            []
        ]
