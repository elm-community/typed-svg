module TypedSvg.InPx exposing (..)

{-| Typed SVG elements that default to `px` units
-}

import Svg exposing (Svg, image)
import Svg.Attributes exposing (xlinkHref)
import TypedSvg.Attributes.InPx exposing (x, y, width, height)


centeredImage : String -> Float -> Float -> Float -> Float -> Svg msg
centeredImage href w_ h_ x_ y_ =
    image
        [ x (x_ - w_ / 2)
        , y (y_ - h_ / 2)
        , width w_
        , height h_
        , xlinkHref href
        ]
        []
