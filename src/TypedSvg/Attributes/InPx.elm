module TypedSvg.Attributes.InPx exposing
    ( x, y, r, width, height, strokeWidth
    , fontSize, textLength
    , markerWidth, markerHeight
    , cx, cy, dx, dy, fx, fy, rx, ry, x1, y1, x2, y2
    )

{-| This module exposes all Length attributes (x, y, width, etc.) as px-based
attributes. It's used as a shortcut so that it becomes unnecessary to prefix
each numeric length with the `px` function.

Example:

    import Color
    import Html exposing (Html)
    import TypedSvg exposing (rect, svg)
    import TypedSvg.Attributes exposing (fill, stroke, viewBox)
    import TypedSvg.Attributes.InPx exposing (height, strokeWidth, width, x, y)

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
import TypedSvg.Types exposing (px)


{-| -}
cx : Float -> Attribute msg
cx value =
    Attr.cx (px value)


{-| -}
cy : Float -> Attribute msg
cy value =
    Attr.cy (px value)


{-| -}
dx : Float -> Attribute msg
dx value =
    Attr.dx (px value)


{-| -}
dy : Float -> Attribute msg
dy value =
    Attr.dy (px value)


{-| -}
fontSize : Float -> Attribute msg
fontSize value =
    Attr.fontSize (px value)


{-| -}
fx : Float -> Attribute msg
fx xAxisCoord =
    Attr.fx (px xAxisCoord)


{-| -}
fy : Float -> Attribute msg
fy yAxisCoord =
    Attr.fx (px yAxisCoord)


{-| -}
height : Float -> Attribute msg
height value =
    Attr.height (px value)


{-| -}
markerHeight : Float -> Attribute msg
markerHeight value =
    Attr.markerHeight (px value)


{-| -}
markerWidth : Float -> Attribute msg
markerWidth value =
    Attr.markerWidth (px value)


{-| -}
r : Float -> Attribute msg
r value =
    Attr.r (px value)


{-| -}
rx : Float -> Attribute msg
rx value =
    Attr.rx (px value)


{-| -}
ry : Float -> Attribute msg
ry value =
    Attr.ry (px value)


{-| -}
textLength : Float -> Attribute msg
textLength value =
    Attr.textLength (px value)


{-| -}
strokeWidth : Float -> Attribute msg
strokeWidth value =
    Attr.strokeWidth (px value)


{-| -}
width : Float -> Attribute msg
width value =
    Attr.width (px value)


{-| -}
x : Float -> Attribute msg
x value =
    Attr.x (px value)


{-| -}
x1 : Float -> Attribute msg
x1 value =
    Attr.x1 (px value)


{-| -}
x2 : Float -> Attribute msg
x2 value =
    Attr.x2 (px value)


{-| -}
y : Float -> Attribute msg
y value =
    Attr.y (px value)


{-| -}
y1 : Float -> Attribute msg
y1 value =
    Attr.y1 (px value)


{-| -}
y2 : Float -> Attribute msg
y2 value =
    Attr.y2 (px value)
