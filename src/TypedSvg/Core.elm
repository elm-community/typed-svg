module TypedSvg.Core exposing (..)

import VirtualDom
import Json.Encode as Json


{-| The core building block to create SVG. This library is filled with helper
functions to create these `Svg` values.
This is backed by `VirtualDom.Node` in `evancz/virtual-dom`, but you do not
need to know any details about that to use this library!
-}
type alias Svg msg =
    VirtualDom.Node msg


{-| Set attributes on your `Svg`.
-}
type alias Attribute msg =
    VirtualDom.Property msg


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
