module TypedSvg.Deprecated exposing (altGlyph, altGlyphDef, altGlyphItem)

{-| Deprecated SVG Elements


# Glyphs

@docs altGlyph, altGlyphDef, altGlyphItem

-}

import TypedSvg.Core exposing (Attribute, Svg, node)


{-| -}
altGlyph : List (Attribute msg) -> List (Svg msg) -> Svg msg
altGlyph =
    node "altGlyph"


{-| -}
altGlyphDef : List (Attribute msg) -> List (Svg msg) -> Svg msg
altGlyphDef =
    node "altGlyphDef"


{-| -}
altGlyphItem : List (Attribute msg) -> List (Svg msg) -> Svg msg
altGlyphItem =
    node "altGlyphItem"
