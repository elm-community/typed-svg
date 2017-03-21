module TypedSvg.Attributes.InPx exposing (..)

import Svg exposing (Attribute)
import TypedSvg.Lengths exposing (px)
import TypedSvg.Attributes as AnyUnit


{-
   An example use of this modules attributes:

   circle [ cx 10, cy 10, r 50, strokeWidth 2, stroke Color.red ] []
-}


cx : Float -> Attribute msg
cx value =
    AnyUnit.cx (px value)


cy : Float -> Attribute msg
cy value =
    AnyUnit.cy (px value)


x : Float -> Attribute msg
x value =
    AnyUnit.x (px value)


y : Float -> Attribute msg
y value =
    AnyUnit.y (px value)


rx : Float -> Attribute msg
rx value =
    AnyUnit.rx (px value)


ry : Float -> Attribute msg
ry value =
    AnyUnit.ry (px value)


r : Float -> Attribute msg
r value =
    AnyUnit.r (px value)


strokeWidth : Float -> Attribute msg
strokeWidth value =
    AnyUnit.strokeWidth (px value)


width : Float -> Attribute msg
width value =
    AnyUnit.width (px value)


height : Float -> Attribute msg
height value =
    AnyUnit.height (px value)


fontSize : Float -> Attribute msg
fontSize value =
    AnyUnit.fontSize (px value)
