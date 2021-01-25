module Examples.Paints exposing (main)

import Color
import Html exposing (Html, div, node)
import TypedSvg exposing (circle, g, pattern, rect, svg, text_)
import TypedSvg.Attributes exposing (cx, cy, fill, id, patternUnits, r, stroke, strokeWidth, textAnchor, transform, viewBox)
import TypedSvg.Attributes.InPx exposing (fontSize, height, width, x, y)
import TypedSvg.Core exposing (Svg, text)
import TypedSvg.Types exposing (AnchorAlignment(..), CoordinateSystem(..), Paint(..), Transform(..), px)


drawCircle : Paint -> Float -> String -> Svg msg
drawCircle paint left label =
    g
        [ transform [ Translate left 60 ] ]
        [ circle
            [ cx (px 30)
            , cy (px 0)
            , r (px 30)
            , fill paint
            , stroke <| Paint Color.grey
            ]
            []
        , text_ [ x 30, y 40, textAnchor AnchorMiddle ] [ text label ]
        ]


main : Html msg
main =
    div []
        [ node "style" [] [ text """
        :root {--custom-pink: #f0bbd1;}
        svg {font-family: monospace; font-size: 5px;}
        """ ]
        , svg [ viewBox 0 0 800 600 ]
            [ pattern
                [ id "chessPattern"
                , width 50
                , height 50
                , patternUnits CoordinateSystemUserSpaceOnUse
                ]
                [ rect [ x 0, y 0, width 25, height 25, fill <| Paint <| Color.rgb255 184 0 0 ] []
                , rect [ x 25, y 0, width 25, height 25, fill <| Paint <| Color.rgb255 25 25 25 ] []
                , rect [ x 0, y 25, width 25, height 25, fill <| Paint <| Color.rgb255 25 25 25 ] []
                , rect [ x 25, y 25, width 25, height 25, fill <| Paint <| Color.rgb255 184 0 0 ] []
                ]
            , drawCircle (Paint Color.red) 10 "Paint Color.red"
            , drawCircle (CSSVariable "--custom-pink") 90 "CSSVariable \"--custom-pink\""
            , drawCircle (Reference "chessPattern") 170 "Reference \"chessPattern\""
            , drawCircle PaintNone 250 "PaintNone"
            ]
        ]
