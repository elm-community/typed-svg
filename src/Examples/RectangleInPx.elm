module Examples.RectangleInPx exposing (Model, Msg(..), view)

import Color
import Html exposing (Html)
import TypedSvg exposing (rect, svg)
import TypedSvg.Attributes exposing (fill, stroke, viewBox)
import TypedSvg.Attributes.InPx exposing (height, strokeWidth, width, x, y)
import TypedSvg.Types exposing (Fill(..))


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
            , fill <| Fill Color.white
            , strokeWidth 2
            , stroke Color.black
            ]
            []
        ]
