module Examples.RectangleInPx exposing (..)

import Html exposing (Html)
import Color
import TypedSvg exposing (svg, rect)
import TypedSvg.Attributes exposing (viewBox, fill, stroke)
import TypedSvg.Attributes.InPx exposing (x, y, width, height, strokeWidth)


type Msg
    = NoOp


type alias Model =
    Int


view : Model -> Html Msg
view model =
    svg
        [ viewBox 0 0 800 600
        ]
        [ rect
            [ x 150
            , y 150
            , width 200
            , height 200
            , fill Color.white
            , strokeWidth 2
            , stroke Color.black
            ]
            []
        ]
