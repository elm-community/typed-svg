module Examples.RectangleInPx exposing (main)

{-| Using TypedSvg.Attributes.InPx makes it unnecessary to prefix
each numeric length with the `px` function.
-}

import Color
import Html exposing (Html)
import TypedSvg exposing (rect, svg)
import TypedSvg.Attributes exposing (fill, stroke, viewBox)
import TypedSvg.Attributes.InPx exposing (height, strokeWidth, width, x, y)
import TypedSvg.Types exposing (Paint(..))
import TypedSvg.Core exposing (Svg)


myRectangle : Svg msg
myRectangle =
        rect
            [ x 100
            , y 100
            , width 200
            , height 200
            , fill <| Paint Color.white
            , strokeWidth 2
            , stroke <| Paint Color.black
            ]
            []
        


main : Html msg
main =
    svg [ viewBox 0 0 800 600 ] [ myRectangle ]
