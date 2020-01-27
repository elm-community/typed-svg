module Examples.SumAnimateTransform exposing (main)

import Color
import Html exposing (Html)
import TypedSvg exposing (..)
import TypedSvg.Attributes exposing (attributeName, attributeType, animateTransformType, from, from3, to, to3, begin, dur, repeatCount, additive, stroke, fill)
import TypedSvg.Types exposing (..)
import TypedSvg.Core exposing (Svg)
import TypedSvg.Attributes.InPx exposing (x, y, width, height)


myScale : Svg msg
myScale =
    animateTransform
        [ attributeName "transform"
        , attributeType AttributeTypeXml
        , animateTransformType AnimateTransformTypeScale
        , from 1
        , to 3
        , begin [ TimingOffsetValue "0s" ]
        , dur <| Duration "10s"
        , repeatCount RepeatIndefinite
        , additive AdditiveSum
        ]
        []


myRotate : Svg msg
myRotate =
    animateTransform
        [ attributeName "transform"
        , attributeType AttributeTypeXml
        , animateTransformType AnimateTransformTypeRotate
        , from3 0 30 20
        , to3 360 30 20
        , begin [ TimingOffsetValue "0s" ]
        , dur <| Duration "10s"
        , repeatCount RepeatIndefinite
        , additive AdditiveSum
        ]
        []


myRectangle : Svg msg
myRectangle =
    rect
        [ x 10
        , y 10
        , width 40
        , height 20
        , stroke <| Paint Color.black
        , fill PaintNone
        ]
        [ myScale
        , myRotate
        ]


main : Html msg
main =
    svg [] [ myRectangle ]
