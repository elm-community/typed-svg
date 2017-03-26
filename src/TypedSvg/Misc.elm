module TypedSvg.Misc exposing (foreignObject)

{-| Miscellaneous SVG Elements

# Embedding Objects
@docs foreignObject
-}

import Html
import TypedSvg.Core exposing (Svg, Attribute, node)


{-|
The `foreignObject` SVG element allows for inclusion of a foreign XML namespace
which has its graphical content drawn by a different user agent. The included
foreign graphical content is subject to SVG transformations and compositing.

The contents of foreignObject are assumed to be from a different namespace. Any
SVG elements within a `foreignObject` will not be drawn, except in the situation
where a properly defined SVG subdocument with a proper xmlns attribute
specification is embedded recursively. One situation where this can occur is
when an SVG document fragment is embedded within another non-SVG document
fragment, which in turn is embedded within an SVG document fragment (e.g., an
SVG document fragment contains an XHTML document fragment which in turn contains
 yet another SVG document fragment).

Usually, a foreignObject will be used in conjunction with the `switch` element
and the `requiredExtensions` attribute to provide proper checking for user agent
support and provide an alternate rendering in case user agent support is not
available.
-}
foreignObject : List (Attribute msg) -> List (Html.Html msg) -> Svg msg
foreignObject =
    node "foreignObject"
