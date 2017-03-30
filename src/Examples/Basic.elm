module Examples.Basic exposing (..)

import Html exposing (Html)
import Color
import TypedSvg exposing (svg, circle)
import TypedSvg.Attributes exposing (viewBox, cx, cy, r, fill, strokeWidth, stroke)
import TypedSvg.Types exposing (px)


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
            , fill Color.black
            , strokeWidth (px 2)
            , stroke <| Color.rgba 90 60 60 0.5
            ]
            []
        ]
