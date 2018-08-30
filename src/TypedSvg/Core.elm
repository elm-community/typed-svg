module TypedSvg.Core exposing
    ( Svg, text, node, map, foreignObject
    , Attribute, attribute, attributeNS, svgNamespace
    )

{-|


# SVG Nodes

@docs Svg, text, node, map, foreignObject


# SVG Attributes

@docs Attribute, attribute, attributeNS, svgNamespace

-}

import Html
import Json.Encode as Json
import VirtualDom


{-| The core building block to create SVG. This library is filled with helper
functions to create these `Svg` values.
-}
type alias Svg msg =
    VirtualDom.Node msg


{-| Set attributes on your `Svg`.
-}
type alias Attribute msg =
    VirtualDom.Attribute msg


{-| -}
svgNamespace : Attribute msg
svgNamespace =
    VirtualDom.property "namespace" (Json.string "http://www.w3.org/2000/svg")


{-| Create any SVG node. To create a `<rect>` helper function, you would write:
rect : List (Attribute msg) -> List (Svg msg) -> Svg msg
rect attributes children =
node "rect" attributes children
You should always be able to use the helper functions already defined in this
library though!
-}
node : String -> List (Attribute msg) -> List (Svg msg) -> Svg msg
node =
    VirtualDom.nodeNS "http://www.w3.org/2000/svg"


{-| Creates any untyped attribute
-}
attribute : String -> String -> Attribute msg
attribute =
    VirtualDom.attribute


{-| Creates any untyped, namespaced attribute
-}
attributeNS : String -> String -> String -> Attribute msg
attributeNS =
    VirtualDom.attributeNS


{-| A simple text node, no tags at all.
Warning: not to be confused with `text_` which produces the SVG `<text>` tag!
-}
text : String -> Svg msg
text =
    VirtualDom.text


{-| Transform the messages produced by some `Svg`.
-}
map : (a -> msg) -> Svg a -> Svg msg
map =
    VirtualDom.map


{-| The `foreignObject` SVG element allows for inclusion of a foreign XML namespace
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
