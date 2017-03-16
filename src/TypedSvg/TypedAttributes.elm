module Svg.TypedAttributes exposing (Length, Paint, Transform, bold, bolder, cm, color, currentColor, cx, cy, em, ex, fill, fontFamily, fontSize, height, inch, intWeight, large, larger, lighter, matrix, medium, mm, noPaint, normalWeight, num, opacity, paintRef, paintRefWithDefault, pc, percent, pointerEventsVisiblePainted, pointerEventsVisibleFill, pointerEventsVisibleStroke, pointerEventsVisible, pointerEventsPainted, pointerEventsFill, pointerEventsStroke, pointerEventsAll, pointerEventsNone, pt, px, r, rotate, scale, skewX, skewY, small, smaller, transform, translate, viewBox, width, x, xLarge, xSmall, xxLarge, xxSmall, y)

import Color exposing (Color)
import Svg exposing (Attribute)
import Svg.Attributes as Att


{-|
# Units of length
# Transforms
# Paint
# Fonts
# Misc Attributes
-}



-- Units of length


type Length
    = Cm Float
    | Em Float
    | Ex Float
    | In Float
    | Mm Float
    | Num Float
    | Pc Float
    | Percent Float
    | Pt Float
    | Px Float


cm : Float -> Length
cm =
    Cm


em : Float -> Length
em =
    Em


ex : Float -> Length
ex =
    Ex


inch : Float -> Length
inch =
    In


lengthString : Length -> String
lengthString length =
    case length of
        Cm x ->
            toString x ++ "cm"

        Em x ->
            toString x ++ "em"

        Ex x ->
            toString x ++ "ex"

        In x ->
            toString x ++ "in"

        Mm x ->
            toString x ++ "mm"

        Num x ->
            toString x

        Pc x ->
            toString x ++ "pc"

        Percent x ->
            toString x ++ "%"

        Pt x ->
            toString x ++ "pt"

        Px x ->
            toString x ++ "px"


mm : Float -> Length
mm =
    Mm


num : Float -> Length
num =
    Num


pc : Float -> Length
pc =
    Pc


percent : Float -> Length
percent =
    Percent


pt : Float -> Length
pt =
    Pt


px : Float -> Length
px =
    Px



-- Transforms


type Transform
    = Transform String


atomicTransform : String -> List number -> Transform
atomicTransform name args =
    Transform <|
        String.concat
            [ name
            , "("
            , String.join " " (List.map toString args)
            , ")"
            ]


matrix : number -> number -> number -> number -> number -> number -> Transform
matrix a b c d e f =
    atomicTransform "matrix" [ a, b, c, d, e, f ]


rotate : number -> number -> number -> Transform
rotate a x y =
    atomicTransform "rotate" [ a, x, y ]


scale : number -> number -> Transform
scale x y =
    atomicTransform "scale" [ x, y ]


skewX : number -> Transform
skewX x =
    atomicTransform "skewX" [ x ]


skewY : number -> Transform
skewY y =
    atomicTransform "skewY" [ y ]


transform : List Transform -> Attribute a
transform =
    List.map transformString >> String.join " " >> Att.transform


translate : number -> number -> Transform
translate x y =
    atomicTransform "translate" [ x, y ]


transformString : Transform -> String
transformString xform =
    case xform of
        Transform str ->
            str



-- Paint


type ExplicitPaint
    = NoPaint
    | CurrentColor
    | Color Color


type Paint
    = Explicit ExplicitPaint
    | Reference String ExplicitPaint


{-| Alpha values are ignored, since they are outside the SVG spec. If you need to specify opacity, you should use one of `opacity`, `stroke-opacity`, or `fill-opacity`.
-}
color : Color -> Paint
color =
    Color >> Explicit


currentColor : Paint
currentColor =
    Explicit CurrentColor


noPaint : Paint
noPaint =
    Explicit NoPaint


{-| If the given id is invalid, `noPaint` will be used as default.
-}
paintRef : String -> Paint
paintRef iri =
    Reference iri NoPaint


{-| If the id is invalid, the given color will be used.
-}
paintRefWithDefault : String -> Color -> Paint
paintRefWithDefault iri default =
    Reference iri (Color default)


paintString : Paint -> String
paintString paint =
    let
        explicitPaintString paint =
            case paint of
                NoPaint ->
                    "none"

                CurrentColor ->
                    "currentColor"

                Color c ->
                    let
                        rgb =
                            Color.toRgb c
                    in
                        String.concat
                            [ "rgb("
                            , toString rgb.red
                            , ","
                            , toString rgb.green
                            , ","
                            , toString rgb.blue
                            , ")"
                            ]
    in
        case paint of
            Explicit p ->
                explicitPaintString p

            Reference iri default ->
                String.concat
                    [ "url(#", iri, ") ", explicitPaintString default ]



-- Fonts


bold : Attribute a
bold =
    Att.fontWeight "bold"


bolder : Attribute a
bolder =
    Att.fontWeight "bolder"


{-| An empty list will set `font-family: inherit`
-}
fontFamily : List String -> Attribute a
fontFamily families =
    case families of
        [] ->
            Att.fontFamily "inherit"

        _ ->
            Att.fontFamily (String.join ", " families)


{-| This function takes an explicit length. Absolute and relative font sizes (such as `small` or `larger` have their own functions.
-}
fontSize : Length -> Attribute a
fontSize =
    lengthString >> Att.fontSize


{-| The weight will be rounded to the nearest allowed value... multiples of 100 between 100 to 900.
-}
intWeight : Int -> Attribute a
intWeight i =
    let
        rounded =
            (((i + 50) // 100) * 100)
                |> clamp 100 900
    in
        Att.fontWeight (toString rounded)


large : Attribute a
large =
    Att.fontSize "large"


larger : Attribute a
larger =
    Att.fontSize "larger"


lighter : Attribute a
lighter =
    Att.fontWeight "lighter"


medium : Attribute a
medium =
    Att.fontSize "medium"


normalWeight : Attribute a
normalWeight =
    Att.fontWeight "normal"


small : Attribute a
small =
    Att.fontSize "small"


smaller : Attribute a
smaller =
    Att.fontSize "smaller"


xLarge : Attribute a
xLarge =
    Att.fontSize "x-large"


xSmall : Attribute a
xSmall =
    Att.fontSize "x-small"


xxLarge : Attribute a
xxLarge =
    Att.fontSize "xx-large"


xxSmall : Attribute a
xxSmall =
    Att.fontSize "xx-small"



-- Misc Attributes


cx : Length -> Attribute a
cx =
    lengthString >> Att.cx


cy : Length -> Attribute a
cy =
    lengthString >> Att.cy


fill : Paint -> Attribute a
fill =
    paintString >> Att.fill


height : Length -> Attribute a
height =
    lengthString >> Att.height


pointerEventsVisiblePainted : Attribute a
pointerEventsVisiblePainted =
    Att.pointerEvents "visiblePainted"


pointerEventsVisibleFill : Attribute a
pointerEventsVisibleFill =
    Att.pointerEvents "visibleFill"


pointerEventsVisibleStroke : Attribute a
pointerEventsVisibleStroke =
    Att.pointerEvents "visibleStroke"


pointerEventsVisible : Attribute a
pointerEventsVisible =
    Att.pointerEvents "visible"


pointerEventsPainted : Attribute a
pointerEventsPainted =
    Att.pointerEvents "painted"


pointerEventsFill : Attribute a
pointerEventsFill =
    Att.pointerEvents "fill"


pointerEventsStroke : Attribute a
pointerEventsStroke =
    Att.pointerEvents "stroke"


pointerEventsAll : Attribute a
pointerEventsAll =
    Att.pointerEvents "all"


pointerEventsNone : Attribute a
pointerEventsNone =
    Att.pointerEvents "none"


opacity : Float -> Attribute a
opacity =
    toString >> Att.opacity


r : Length -> Attribute a
r =
    lengthString >> Att.r


viewBox : number -> number -> number -> number -> Attribute a
viewBox minX minY width height =
    [ minX, minY, width, height ]
        |> List.map toString
        |> String.join " "
        |> Att.viewBox


width : Length -> Attribute a
width =
    lengthString >> Att.width


x : Length -> Attribute a
x =
    lengthString >> Att.x


y : Length -> Attribute a
y =
    lengthString >> Att.y
