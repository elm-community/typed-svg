module TypedSvg.Attributes.InEm exposing
    ( x, y, r, width, height, strokeWidth
    , fontSize, textLength
    , markerWidth, markerHeight
    , cx, cy, dx, dy, fx, fy, rx, ry, x1, y1, x2, y2
    )

{-| This module exposes all Length attributes (x, y, width, etc.) as `em`-based
attributes. It's used as a shortcut so that it becomes unnecessary to prefix
each numeric length with the `em` function.

Example:

    import Color
    import Html exposing (Html)
    import TypedSvg exposing (rect, svg)
    import TypedSvg.Attributes exposing (fill, stroke, viewBox)
    import TypedSvg.Attributes.InEm exposing (height, strokeWidth, width, x, y)

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
                [ x 15
                , y 15
                , width 20
                , height 20
                , fill Color.white
                , strokeWidth 0.5
                , stroke Color.black
                ]
                []
            ]


# Common Length Attributes

@docs x, y, r, width, height, strokeWidth


# Text

@docs fontSize, textLength


# Marker

@docs markerWidth, markerHeight


# Other

@docs cx, cy, dx, dy, fx, fy, rx, ry, x1, y1, x2, y2

-}

import TypedSvg.Attributes as Attr
import TypedSvg.Core exposing (Attribute)
import TypedSvg.Types exposing (em)


{-| -}
cx : Float -> Attribute msg
cx value =
    Attr.cx (em value)


{-| -}
cy : Float -> Attribute msg
cy value =
    Attr.cy (em value)


{-| -}
dx : Float -> Attribute msg
dx value =
    Attr.dx (em value)


{-| -}
dy : Float -> Attribute msg
dy value =
    Attr.dy (em value)


{-| -}
fontSize : Float -> Attribute msg
fontSize value =
    Attr.fontSize (em value)


{-| -}
fx : Float -> Attribute msg
fx xAxisCoord =
    Attr.fx (em xAxisCoord)


{-| -}
fy : Float -> Attribute msg
fy yAxisCoord =
    Attr.fx (em yAxisCoord)


{-| -}
height : Float -> Attribute msg
height value =
    Attr.height (em value)


{-| -}
markerHeight : Float -> Attribute msg
markerHeight value =
    Attr.markerHeight (em value)


{-| -}
markerWidth : Float -> Attribute msg
markerWidth value =
    Attr.markerWidth (em value)


{-| -}
r : Float -> Attribute msg
r value =
    Attr.r (em value)


{-| -}
rx : Float -> Attribute msg
rx value =
    Attr.rx (em value)


{-| -}
ry : Float -> Attribute msg
ry value =
    Attr.ry (em value)


{-| -}
textLength : Float -> Attribute msg
textLength value =
    Attr.textLength (em value)


{-| -}
strokeWidth : Float -> Attribute msg
strokeWidth value =
    Attr.strokeWidth (em value)


{-| -}
width : Float -> Attribute msg
width value =
    Attr.width (em value)


{-| -}
x : Float -> Attribute msg
x value =
    Attr.x (em value)


{-| -}
x1 : Float -> Attribute msg
x1 value =
    Attr.x1 (em value)


{-| -}
x2 : Float -> Attribute msg
x2 value =
    Attr.x2 (em value)


{-| -}
y : Float -> Attribute msg
y value =
    Attr.y (em value)


{-| -}
y1 : Float -> Attribute msg
y1 value =
    Attr.y1 (em value)


{-| -}
y2 : Float -> Attribute msg
y2 value =
    Attr.y2 (em value)
