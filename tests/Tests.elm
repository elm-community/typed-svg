module Tests exposing (..)

-- Test Harness --

import Test exposing (..)
import Expect exposing (Expectation)
import Fuzz exposing (list, int, tuple, string)


-- Libs --

import Color
import Svg exposing (Attribute)
import Svg.Attributes as Att


-- Under Test --

import Svg.TypedAttributes exposing (..)


all : Test
all =
    describe "Building attributes"
        [ testLengthAttrEqual "width" width Att.width
        , testLengthAttrEqual "height" height Att.height
        , testLengthAttrEqual "x" x Att.x
        , testLengthAttrEqual "y" y Att.y
        , testLengthAttrEqual "cx" cx Att.cx
        , testLengthAttrEqual "cy" cy Att.cy
        , testLengthAttrEqual "r" r Att.r
        , testPaintAttrEqual "fill" fill Att.fill
        , testNumberAttrEqual "opacity" opacity Att.opacity
        , testViewBox
        , testTransforms
        , testFontSize
        , testFontWeight
        , testFontFamily
        , testPointerEvents
        ]


testLengthAttrEqual : String -> (Length -> Attribute msg) -> (String -> Attribute msg) -> Test
testLengthAttrEqual name typed untyped =
    describe name
        [ test "no unit" <|
            \() ->
                Expect.equal
                    (typed (num 12.1))
                    (untyped "12.1")
        , test "em" <|
            \() ->
                Expect.equal
                    (typed (em 12.1))
                    (untyped "12.1em")
        , test "ex" <|
            \() ->
                Expect.equal
                    (typed (ex 12.1))
                    (untyped "12.1ex")
        , test "px" <|
            \() ->
                Expect.equal
                    (typed (px 12.1))
                    (untyped "12.1px")
        , test "in" <|
            \() ->
                Expect.equal
                    (typed (inch 12.1))
                    (untyped "12.1in")
        , test "cm" <|
            \() ->
                Expect.equal
                    (typed (cm 12.1))
                    (untyped "12.1cm")
        , test "mm" <|
            \() ->
                Expect.equal
                    (typed (mm 12.1))
                    (untyped "12.1mm")
        , test "pt" <|
            \() ->
                Expect.equal
                    (typed (pt 12.1))
                    (untyped "12.1pt")
        , test "pc" <|
            \() ->
                Expect.equal
                    (typed (pc 12.1))
                    (untyped "12.1pc")
        , test "percent" <|
            \() ->
                Expect.equal
                    (typed (percent 12.1))
                    (untyped "12.1%")
        ]


testNumberAttrEqual : String -> (Float -> Attribute msg) -> (String -> Attribute msg) -> Test
testNumberAttrEqual name typed untyped =
    test name <|
        \() ->
            Expect.equal
                (typed 12.1)
                (untyped "12.1")


testPaintAttrEqual : String -> (Paint -> Attribute msg) -> (String -> Attribute msg) -> Test
testPaintAttrEqual name typed untyped =
    describe name
        [ test "no color" <|
            \() ->
                Expect.equal
                    (typed noPaint)
                    (untyped "none")
        , test "current color" <|
            \() ->
                Expect.equal
                    (typed currentColor)
                    (untyped "currentColor")
        , test "explicit color" <|
            \() ->
                Expect.equal
                    (typed (color (Color.rgb 255 16 0)))
                    (untyped "rgb(255,16,0)")
        , test "function reference" <|
            \() ->
                Expect.equal
                    (typed (paintRef "gradient"))
                    (untyped "url(#gradient) none")
        , test "function reference with default" <|
            \() ->
                Expect.equal
                    (typed (paintRefWithDefault "red" (Color.rgb 0 0 0)))
                    (untyped "url(#red) rgb(0,0,0)")
        ]


testTransforms : Test
testTransforms =
    describe "transforms"
        [ test "affine mattrix" <|
            \() ->
                Expect.equal
                    (transform [ matrix 1 2 3 4 5 6 ])
                    (Att.transform "matrix(1 2 3 4 5 6)")
        , test "translation" <|
            \() ->
                Expect.equal
                    (transform [ translate 2 -3 ])
                    (Att.transform "translate(2 -3)")
        , test "rotation" <|
            \() ->
                Expect.equal
                    (transform [ rotate 0.5 1 1 ])
                    (Att.transform "rotate(0.5 1 1)")
        , test "scale" <|
            \() ->
                Expect.equal
                    (transform [ scale 3 4 ])
                    (Att.transform "scale(3 4)")
        , test "skewX" <|
            \() ->
                Expect.equal
                    (transform [ skewX 4 ])
                    (Att.transform "skewX(4)")
        , test "skewY" <|
            \() ->
                Expect.equal
                    (transform [ skewY 3 ])
                    (Att.transform "skewY(3)")
        , test "multiple transforms" <|
            \() ->
                Expect.equal
                    (transform [ rotate 1 2 3, scale -2 0.1 ])
                    (Att.transform "rotate(1 2 3) scale(-2 0.1)")
        ]


testFontSize : Test
testFontSize =
    describe "font-size"
        [ testLengthAttrEqual "with explicit length" fontSize Att.fontSize
        , test "absolute and relative font sizes" <|
            \() ->
                Expect.equalLists
                    [ xxSmall
                    , xSmall
                    , small
                    , medium
                    , large
                    , xLarge
                    , xxLarge
                    , larger
                    , smaller
                    ]
                    (List.map Att.fontSize
                        [ "xx-small"
                        , "x-small"
                        , "small"
                        , "medium"
                        , "large"
                        , "x-large"
                        , "xx-large"
                        , "larger"
                        , "smaller"
                        ]
                    )
        ]


testFontFamily : Test
testFontFamily =
    describe "font-family"
        [ test "list of families" <|
            \() ->
                Expect.equal
                    (fontFamily [ "Times", "serif" ])
                    (Att.fontFamily "Times, serif")
        , test "no families" <|
            \() ->
                Expect.equal
                    (fontFamily [])
                    (Att.fontFamily "inherit")
        ]


testFontWeight : Test
testFontWeight =
    describe "font-weight"
        [ test "named weights" <|
            \() ->
                Expect.equalLists
                    [ normalWeight
                    , bold
                    , bolder
                    , lighter
                    ]
                    (List.map Att.fontWeight
                        [ "normal"
                        , "bold"
                        , "bolder"
                        , "lighter"
                        ]
                    )
        , test "allowed integer weight" <|
            \() ->
                Expect.equal
                    (intWeight 200)
                    (Att.fontWeight "200")
        , test "integer weight rounded down" <|
            \() ->
                Expect.equal
                    (intWeight 349)
                    (Att.fontWeight "300")
        , test "integer weight rounded up" <|
            \() ->
                Expect.equal
                    (intWeight 350)
                    (Att.fontWeight "400")
        , test "integer weight ceiling at 900" <|
            \() ->
                Expect.equal
                    (intWeight 1000)
                    (Att.fontWeight "900")
        , test "integer weight floor at 100" <|
            \() ->
                Expect.equal
                    (intWeight 5)
                    (Att.fontWeight "100")
        ]


testViewBox : Test
testViewBox =
    test "viewBox" <|
        \() ->
            Expect.equal
                (viewBox 0 -5 100 200)
                (Att.viewBox "0 -5 100 200")


testPointerEvents : Test
testPointerEvents =
    test "pointer-events" <|
        \() ->
            Expect.equalLists
                [ pointerEventsVisiblePainted
                , pointerEventsVisibleFill
                , pointerEventsVisibleStroke
                , pointerEventsVisible
                , pointerEventsPainted
                , pointerEventsFill
                , pointerEventsStroke
                , pointerEventsAll
                , pointerEventsNone
                ]
                (List.map Att.pointerEvents
                    [ "visiblePainted"
                    , "visibleFill"
                    , "visibleStroke"
                    , "visible"
                    , "painted"
                    , "fill"
                    , "stroke"
                    , "all"
                    , "none"
                    ]
                )
