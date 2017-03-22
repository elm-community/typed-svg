module TypedSvg.Core exposing (..)

{-|
# SVG Nodes
@docs Svg, text, node, map

# SVG Attributes
@docs Attribute, attribute, attributeNS, svgNamespace
-}

import VirtualDom
import Json.Encode as Json


{-| The core building block to create SVG. This library is filled with helper
functions to create these `Svg` values.
-}
type alias Svg msg =
    VirtualDom.Node msg


{-| Set attributes on your `Svg`.
-}
type alias Attribute msg =
    VirtualDom.Property msg


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
node name =
    \attributes children ->
        VirtualDom.node name (svgNamespace :: attributes) children


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
