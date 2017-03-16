module TypedSvg.Attributes.InPx exposing (..)

import Svg exposing (Attribute)
import TypedSvg.Lengths exposing (px)
import TypedSvg.Attributes as AnyUnit


{-
   An example use of this modules attributes:

   circle [ cx 10, cy 10, r 50, strokeWidth 2, stroke Color.red ] []
-}


cx : Float -> Attribute a
cx value =
    AnyUnit.cx (px value)


cy : Float -> Attribute a
cy value =
    AnyUnit.cy (px value)


x : Float -> Attribute a
x value =
    AnyUnit.x (px value)


y : Float -> Attribute a
y value =
    AnyUnit.y (px value)


rx : Float -> Attribute a
rx value =
    AnyUnit.rx (px value)


ry : Float -> Attribute a
ry value =
    AnyUnit.ry (px value)


r : Float -> Attribute a
r value =
    AnyUnit.r (px value)


strokeWidth : Float -> Attribute a
strokeWidth value =
    AnyUnit.strokeWidth (px value)


width : Float -> Attribute a
width value =
    AnyUnit.width (px value)


height : Float -> Attribute a
height value =
    AnyUnit.height (px value)


fontSize : Float -> Attribute a
fontSize value =
    AnyUnit.fontSize (px value)
