module TypedSvg exposing
    ( svg
    , circle, ellipse, image, line, path, polygon, polyline, rect, use
    , animate, animateColor, animateMotion, animateTransform, mpath, set
    , desc, metadata, title
    , a, defs, g, marker, mask, pattern, switch, symbol
    , glyph, glyphRef, textPath, text_, tref, tspan
    , font
    , linearGradient, radialGradient, stop
    , clipPath, colorProfile, cursor, filter, script, style, view
    )

{-|


# HTML Embedding

@docs svg


# Graphics elements

@docs circle, ellipse, image, line, path, polygon, polyline, rect, use


# Animation elements

@docs animate, animateColor, animateMotion, animateTransform, mpath, set


# Descriptive elements

@docs desc, metadata, title


# Containers

@docs a, defs, g, marker, mask, pattern, switch, symbol


# Text

@docs glyph, glyphRef, textPath, text_, tref, tspan


# Fonts

@docs font


# Gradients

@docs linearGradient, radialGradient, stop


# Filters

See TypedSvg.Filters


# Miscellaneous

@docs clipPath, colorProfile, cursor, filter, script, style, view


# Deprecated

See `TypedSvg.Deprecated` (e.g. `altGlyph` etc.)

-}

import Html
import TypedSvg.Core exposing (Attribute, Svg, node)


{-| The root `svg` node for any SVG scene. This example shows a scene
containing a rounded rectangle:

    import Html
    import TypedSvg exposing (..)
    import TypedSvg.Attributes exposing (..)

    roundRect : Html.Html msg
    roundRect =
        svg
            [ width (px 120), height (px 120), viewBox 0 0 120 120 ]
            [ rect [ x (px 10), y (px 10), width (px 100), height (px 100), rx (px 15), ry (px 15) ] [] ]

-}
svg : List (Html.Attribute msg) -> List (Svg msg) -> Html.Html msg
svg =
    node "svg"



-- Animation elements


{-| -}
animate : List (Attribute msg) -> List (Svg msg) -> Svg msg
animate =
    node "animate"


{-| -}
animateColor : List (Attribute msg) -> List (Svg msg) -> Svg msg
animateColor =
    node "animateColor"


{-| -}
animateMotion : List (Attribute msg) -> List (Svg msg) -> Svg msg
animateMotion =
    node "animateMotion"


{-| -}
animateTransform : List (Attribute msg) -> List (Svg msg) -> Svg msg
animateTransform =
    node "animateTransform"


{-| -}
mpath : List (Attribute msg) -> List (Svg msg) -> Svg msg
mpath =
    node "mpath"


{-| -}
set : List (Attribute msg) -> List (Svg msg) -> Svg msg
set =
    node "set"



-- Container elements


{-| The SVG Anchor Element defines a hyperlink.
-}
a : List (Attribute msg) -> List (Svg msg) -> Svg msg
a =
    node "a"


{-| -}
defs : List (Attribute msg) -> List (Svg msg) -> Svg msg
defs =
    node "defs"


{-| -}
g : List (Attribute msg) -> List (Svg msg) -> Svg msg
g =
    node "g"


{-| -}
marker : List (Attribute msg) -> List (Svg msg) -> Svg msg
marker =
    node "marker"


{-| -}
mask : List (Attribute msg) -> List (Svg msg) -> Svg msg
mask =
    node "mask"


{-| -}
pattern : List (Attribute msg) -> List (Svg msg) -> Svg msg
pattern =
    node "pattern"


{-| -}
switch : List (Attribute msg) -> List (Svg msg) -> Svg msg
switch =
    node "switch"


{-| -}
symbol : List (Attribute msg) -> List (Svg msg) -> Svg msg
symbol =
    node "symbol"



-- Descriptive elements


{-| -}
desc : List (Attribute msg) -> List (Svg msg) -> Svg msg
desc =
    node "desc"


{-| -}
metadata : List (Attribute msg) -> List (Svg msg) -> Svg msg
metadata =
    node "metadata"


{-| -}
title : List (Attribute msg) -> List (Svg msg) -> Svg msg
title =
    node "title"



-- Font elements


{-| -}
font : List (Attribute msg) -> List (Svg msg) -> Svg msg
font =
    node "font"



-- Gradient elements


{-| -}
linearGradient : List (Attribute msg) -> List (Svg msg) -> Svg msg
linearGradient =
    node "linearGradient"


{-| -}
radialGradient : List (Attribute msg) -> List (Svg msg) -> Svg msg
radialGradient =
    node "radialGradient"


{-| -}
stop : List (Attribute msg) -> List (Svg msg) -> Svg msg
stop =
    node "stop"



-- Graphics elements


{-| The circle element is an SVG basic shape, used to create circles based on
a center point and a radius.

    circle [ cx (px 60), cy (px 60), r (px 50) ] []

-}
circle : List (Attribute msg) -> List (Svg msg) -> Svg msg
circle =
    node "circle"


{-| The ellipse element creates an ellipse based on a center coordinate
and its x and y radius.

    ellipse
        [ cx (px 100), cy (px 60), rx (px 80), ry (px 50) ]
        []

-}
ellipse : List (Attribute msg) -> List (Svg msg) -> Svg msg
ellipse =
    node "ellipse"


{-| The image element displays JPEG, PNG, and other SVG files. Animated GIF behavior is undefined.

    image
        [ attribute "href" "path_to_image.png"
        , width (px 200)
        , height (px 200)
        ]
        []

-}
image : List (Attribute msg) -> List (Svg msg) -> Svg msg
image =
    node "image"


{-| The line element creates a line connecting two points.

    line
        [ x1 (px 0)
        , y1 (px 80)
        , x2 (px 100)
        , y2 (px 20)
        , stroke (Paint Color.black)
        ]
        []

-}
line : List (Attribute msg) -> List (Svg msg) -> Svg msg
line =
    node "line"


{-| The path element is the generic element for defining a shape.
 All the basic shapes can be created with a path element.
 Here, we show a heart-shaped path:

    TypedSvg.path
        [ d """M 10,30
        A 20,20 0,0,1 50,30
        A 20,20 0,0,1 90,30
        Q 90,60 50,90
        Q 10,60 10,30 z"""
        ]
        []

-}
path : List (Attribute msg) -> List (Svg msg) -> Svg msg
path =
    node "path"


{-| The polygon element defines a closed shape with a set of
 connected straight line segments. The last point is connected
 to the first point. For open shapes, see the `polyline` element.
 Here, we show a polygon with stroke and no fill:

    polygon
        [ points [(0,100), (50,25), (50,75), (100,0)]
        , fill PaintNone
        , stroke (Paint Color.black)
        ]
        []

-}
polygon : List (Attribute msg) -> List (Svg msg) -> Svg msg
polygon =
    node "polygon"


{-| The polyline element is an SVG basic shape, used to create a series of
straight lines connecting several points. Typically a polyline is used to
create open shapes.

    polyline
        [ fill FillNone
        , stroke Color.black
        , points [(20, 100), (40, 60), (70, 80), (100, 20)]
        ]
        []

-}
polyline : List (Attribute msg) -> List (Svg msg) -> Svg msg
polyline =
    node "polyline"


{-| The rect element draws a rectangle defined by its position,
 width, and height. The rectangle may have rounded corners. Here,
 we show a rounded corner rectangle:

    rect
        [ x (px 0)
        , y (px 0)
        , width (px 100)
        , height (px 100)
        , rx (px 15)
        ]
        []

-}
rect : List (Attribute msg) -> List (Svg msg) -> Svg msg
rect =
    node "rect"


{-| -}
use : List (Attribute msg) -> List (Svg msg) -> Svg msg
use =
    node "use"



-- Text content elements


{-| -}
glyph : List (Attribute msg) -> List (Svg msg) -> Svg msg
glyph =
    node "glyph"


{-| -}
glyphRef : List (Attribute msg) -> List (Svg msg) -> Svg msg
glyphRef =
    node "glyphRef"


{-| The `textPath` element draws text along the shape of a path.
It is usually embedded within a `text_` element.

    import TypedSvg exposing (..)
    import TypedSvg.Attributes exposing (..)
    import TypedSvg.Core exposing (text, attribute)
    import TypedSvg.Types exposing (px, Paint(..))

    svg
        [ width (px 100), height (px 100), viewBox 0 0 100 100 ]
        [ TypedSvg.path
            [ id "MyPath"
            , fill PaintNone
            , stroke (Paint Color.red)
            , d "M10,90 Q90,90 90,45 Q90,10 50,10 Q10,10 10,40 Q10,70 45,70 Q70,70 75,50"
            ]
            []
        , text_
            []
            [ textPath
                [ attribute "href" "#MyPath" ]
                [ text "Quick brown fox jumps over the lazy dog." ]
            ]
        ]

-}
textPath : List (Attribute msg) -> List (Svg msg) -> Svg msg
textPath =
    node "textPath"


{-| The `text_` element draws a graphics element consisting of text.
It should not be confused with `text` in `TypedSvg.Core` which produces
a simple text node without any tags. `text` is often embedded within `text_`
to specify its content.

    import TypedSvg exposing (..)
    import TypedSvg.Core exposing (text)
    import TypedSvg.Attributes exposing (..)
    import TypedSvg.Types exposing (px, FontWeight(..))

    text_
        [ x (px 20)
        , y (px 35)
        , fontFamily [ "Helvetica", "sans-serif" ]
        , fontSize (px 30)
        , fontWeight FontWeightBold
        ]
        [ text "Hello World" ]

-}
text_ : List (Attribute msg) -> List (Svg msg) -> Svg msg
text_ =
    node "text"


{-| -}
tref : List (Attribute msg) -> List (Svg msg) -> Svg msg
tref =
    node "tref"


{-| The `tspan` element defines a subtext within a `text_` element or
another `tspan` element. It allows for adjustment of the style and/or
position of that subtext.

    text_
        [ x (px 0)
        , y (px 40)
        , fontFamily [ "Helvetica", "sans-serif" ]
        ]
        [ text "Hello "
        , tspan
            [ dy (px 10)
            , fontFamily [ "Georgia", "serif" ]
            , fontSize (px 30)
            , fontWeight FontWeightBold
            ]
            [ text "New" ]
        , text " World"
        ]

-}
tspan : List (Attribute msg) -> List (Svg msg) -> Svg msg
tspan =
    node "tspan"



-- Uncategorized elements


{-| -}
clipPath : List (Attribute msg) -> List (Svg msg) -> Svg msg
clipPath =
    node "clipPath"


{-| -}
colorProfile : List (Attribute msg) -> List (Svg msg) -> Svg msg
colorProfile =
    node "colorProfile"


{-| -}
cursor : List (Attribute msg) -> List (Svg msg) -> Svg msg
cursor =
    node "cursor"


{-| -}
filter : List (Attribute msg) -> List (Svg msg) -> Svg msg
filter =
    node "filter"


{-| -}
script : List (Attribute msg) -> List (Svg msg) -> Svg msg
script =
    node "script"


{-| -}
style : List (Attribute msg) -> List (Svg msg) -> Svg msg
style =
    node "style"


{-| -}
view : List (Attribute msg) -> List (Svg msg) -> Svg msg
view =
    node "view"
