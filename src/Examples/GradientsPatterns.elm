module Examples.GradientsPatterns exposing (main)

import Color
import Html exposing (Html)
import TypedSvg exposing (rect, circle, polygon, svg, linearGradient, radialGradient, pattern, stop, defs)
import TypedSvg.Attributes exposing (id, fill, stroke, viewBox, stopColor, offset, stopOpacity, x1, y1, x2, y2, cx, cy, fx, fy, r, patternUnits, points)
import TypedSvg.Attributes.InPx as InPx
import TypedSvg.Attributes.InPx exposing (height, strokeWidth, width, x, y)
import TypedSvg.Types exposing (Paint(..), Opacity(..), Length(..), CoordinateSystem(..))
import TypedSvg.Core exposing (Svg)


myDefs : List (Svg msg)
myDefs =
  [ linearGradient
    [ id "linGradientTripHor" ]
    [ stop [ offset "0%", stopColor "rgb(255, 255, 255)" ] []
    , stop [ offset "50%", stopColor "rgb(184, 0, 0)"] []
    , stop [ offset "100%", stopColor "rgb(0,0,0)" ] []
    ]
    , linearGradient
    [ id "linGradientDuoVert"
    , x1 <| Percent 0.0
    , y1 <| Percent 0.0
    , x2 <| Percent 0.0
    , y2 <| Percent 100.0
    ]
    [ stop [ offset "0%", stopColor "#434343" , stopOpacity <| Opacity 1.0 ] []
    , stop [ offset "100%", stopColor "#000000" , stopOpacity <| Opacity 1.0 ] []
    ]
    , radialGradient
    [ id "radGradient" 
    , cx <| Percent 50.0
    , cy <| Percent 50.0
    , r <| Percent 80.0
    , fx <| Percent 50.0
    , fy <| Percent 50.0
    ]
    [ stop [ offset "0%", stopColor "rgb(184, 0, 0)" , stopOpacity <| Opacity 1.0 ] []
    , stop [ offset "100%", stopColor "rgb(0, 0, 0)" , stopOpacity <| Opacity 1.0 ] []
    ]
    , pattern
    [ id "chessPattern"
    , width 50
    , height 50
    , patternUnits CoordinateSystemUserSpaceOnUse]
    [ rect [ x 0, y 0, width 25, height 25, fill <| Paint <| Color.rgb255 184 0 0 ][]
    , rect [ x 25, y 0, width 25, height 25, fill <| Paint <| Color.rgb255 25 25 25 ][]
    , rect [ x 0, y 25, width 25, height 25, fill <| Paint <| Color.rgb255 25 25 25 ][]
    , rect [ x 25, y 25, width 25, height 25, fill <| Paint <| Color.rgb255 184 0 0 ][]
    ]
  ]

myRectangle : Svg msg
myRectangle =
        rect
            [ x 100
            , y 100
            , width 150
            , height 150
            , fill <| Reference "linGradientTripHor"
            , strokeWidth 8
            , stroke <| Reference "linGradientDuoVert"
            ]
            []


myCircle : Svg msg
myCircle =
    circle
        [ InPx.cx 375
        , InPx.cy 175
        , InPx.r 70
        , fill <| Reference "radGradient"
        , strokeWidth 8
        , stroke <| Reference "linGradientDuoVert"
        ]
        []


myTriangle : Svg msg
myTriangle =
        polygon
            [ points [(500,110), (650,110), (575, 240)]
            , fill <| Reference "chessPattern"
            , strokeWidth 8
            , stroke <| Reference "linGradientDuoVert"
            ]
            []

-- <polygon points="0,0 750,0 375,650" fill="url(#pattern-checkers)"/>

main : Html msg
main =
    svg [ viewBox 0 0 800 600 ] [ defs [] myDefs, myRectangle, myCircle, myTriangle]