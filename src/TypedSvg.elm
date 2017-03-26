module TypedSvg
    exposing
        ( svg
        , circle
        , ellipse
        , image
        , line
        , path
        , polygon
        , polyline
        , rect
        , use
        , animate
        , animateColor
        , animateMotion
        , animateTransform
        , mpath
        , set
        , desc
        , metadata
        , title
        , a
        , defs
        , g
        , marker
        , mask
        , pattern
        , switch
        , symbol
        , glyph
        , glyphRef
        , textPath
        , text_
        , tref
        , tspan
        , font
        , linearGradient
        , radialGradient
        , stop
        , clipPath
        , colorProfile
        , cursor
        , filter
        , script
        , style
        , view
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
-}

-- centeredImage : String -> Float -> Float -> Float -> Float -> Svg msg
-- centeredImage href w_ h_ x_ y_ =
--     image
--         [ x (x_ - w_ / 2)
--         , y (y_ - h_ / 2)
--         , width w_
--         , height h_
--         , xlinkHref href
--         ]
--         []

import Html
import TypedSvg.Core exposing (Svg, Attribute, node)


{-| The root `<svg>` node for any SVG scene. This example shows a scene
containing a rounded rectangle:

    import Html
    import Svg exposing (..)
    import Svg.Attributes exposing (..)

    roundRect : Html.Html msg
    roundRect =
        svg
          [ width "120", height "120", viewBox "0 0 120 120" ]
          [ rect [ x "10", y "10", width "100", height "100", rx "15", ry "15" ] [] ]
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

    circle [ cx "60", cy "60", r "50" ] []
-}
circle : List (Attribute msg) -> List (Svg msg) -> Svg msg
circle =
    node "circle"


{-| -}
ellipse : List (Attribute msg) -> List (Svg msg) -> Svg msg
ellipse =
    node "ellipse"


{-| -}
image : List (Attribute msg) -> List (Svg msg) -> Svg msg
image =
    node "image"


{-| -}
line : List (Attribute msg) -> List (Svg msg) -> Svg msg
line =
    node "line"


{-| -}
path : List (Attribute msg) -> List (Svg msg) -> Svg msg
path =
    node "path"


{-| -}
polygon : List (Attribute msg) -> List (Svg msg) -> Svg msg
polygon =
    node "polygon"


{-| The polyline element is an SVG basic shape, used to create a series of
straight lines connecting several points. Typically a polyline is used to
create open shapes.

    polyline [ fill "none", stroke "black", points "20,100 40,60 70,80 100,20" ] []
-}
polyline : List (Attribute msg) -> List (Svg msg) -> Svg msg
polyline =
    node "polyline"


{-| -}
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


{-| -}
textPath : List (Attribute msg) -> List (Svg msg) -> Svg msg
textPath =
    node "textPath"


{-| -}
text_ : List (Attribute msg) -> List (Svg msg) -> Svg msg
text_ =
    node "text"


{-| -}
tref : List (Attribute msg) -> List (Svg msg) -> Svg msg
tref =
    node "tref"


{-| -}
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
