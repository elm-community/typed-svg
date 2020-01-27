module Examples.Basic exposing (main)

import Color
import Html exposing (Html)
import TypedSvg exposing (circle, svg)
import TypedSvg.Attributes exposing (cx, cy, fill, r, stroke, strokeWidth, viewBox)
import TypedSvg.Types exposing (Paint(..), px)
import TypedSvg.Core exposing (Svg)


myCircle : Svg msg
myCircle =
    circle
        [ cx (px 100)
        , cy (px 100)
        , r (px 30)
        , fill <| Paint Color.blue
        , strokeWidth (px 2)
        , stroke <| Paint <| Color.rgba 0.8 0 0 0.5
        ]
        []

main : Html msg
main =
    svg [ viewBox 0 0 800 600 ] [ myCircle ]