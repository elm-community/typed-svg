module TypedSvg.Filters.Attributes exposing (azimuth, baseFrequency, bias, colorInterpolationFilters, colorMatrixType, colorMatrixValues, compositeOperator, diffuseConstant, divisor, edgeMode, elevation, filterRes, filterUnits, floodColor, floodOpacity, funcType, in2, in_, k1, k2, k3, k4, kernelMatrix, kernelUnitLength, limitingConeAngle, mode, morphologyOperator, numOctaves, order, pointsAtX, pointsAtY, pointsAtZ, preserveAlpha, radius, result, scale, seed, surfaceScale, targetX, targetY, turbulenceType, z)

{-| Attributes of SVG filter elements


# Attributes

@docs azimuth, baseFrequency, bias, colorInterpolationFilters, colorMatrixType, colorMatrixValues, compositeOperator, diffuseConstant, divisor, edgeMode, elevation, filterRes, filterUnits, floodColor, floodOpacity, funcType, in2, in_, k1, k2, k3, k4, kernelMatrix, kernelUnitLength, limitingConeAngle, mode, morphologyOperator, numOctaves, order, pointsAtX, pointsAtY, pointsAtZ, preserveAlpha, radius, result, scale, seed, surfaceScale, targetX, targetY, turbulenceType, z

-}

import TypedSvg.Core exposing (..)
import TypedSvg.Types exposing (..)
import TypedSvg.TypesToStrings exposing (..)


{-| The azimuth attribute represents the direction angle of the light source on
the XY plane (clockwise), in degrees from the x axis.

If the attribute is not specified, then the effect is as if a value of 0
were specified.

Used by Elements: Filters.distantLight

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/azimuth>

-}
azimuth : Float -> Attribute msg
azimuth angle =
    attribute "azimuth" <| String.fromFloat angle


{-| The baseFrequency attribute represents the frequency parameter for the noise
function of the `Filters.turbulence` primitive. The first Float represents
a base frequency in the X direction and the second value represents a base
frequency in the Y direction.

Negative values are forbidden.

If the attribute is not specified, then the effect is as if a value of 0
were specified.

Used by Elements: Filters.turbulence

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/baseFrequency>

-}
baseFrequency : Float -> Float -> Attribute msg
baseFrequency xFrequency yFrequency =
    attribute "baseFrequency" <| String.fromFloat xFrequency ++ " " ++ String.fromFloat yFrequency


{-| The bias attribute shifts the range of a filter. After applying the
kernelMatrix of the `Filters.convolveMatrix` element to the input image to
yield a Float and applying the divisor attribute, the bias attribute is
added to each component. This allows representation of values that would
otherwise be clamped to 0 or 1.

If bias is not specified, then the effect is as if a value of 0 were
specified.

Used by Elements: Filters.convolveMatrix

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/bias>

-}
bias : Float -> Attribute msg
bias rangeShift =
    attribute "bias" <| String.fromFloat rangeShift


{-| The `colorInterpolationFilters` attribute specifies the color space for
imaging operations performed via filter effects.

Note that `colorInterpolationFilters` has a different initial value than
`colorInterpolation`. `colorInterpolationFilters` has an initial value of
linearRGB, whereas color-interpolation has an initial value of sRGB. Thus,
in the default case, filter effects operations occur in the linearRGB
color space, whereas all other color interpolations occur by default in the
sRGB color space.

As a presentation attribute, it also can be used as a property directly
inside a CSS stylesheet.

Used by Elements: Filters.blend, Filters.colorMatrix,
Filters.componentTransfer, Filters.composite, Filters.convolveMatrix,
Filters.diffuseLighting, Filters.displacementMap, Filters.gaussianBlur,
Filters.morphology, Filters.offset, Filters.specularLighting,
Filters.tile

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/color-interpolation-filters>

-}
colorInterpolationFilters : ColorInterpolation -> Attribute msg
colorInterpolationFilters colorInterpolation =
    attribute "color-interpolation-filters" <| colorInterpolationToString colorInterpolation


{-| Indicates the type of matrix operation. The keyword matrix indicates that a
full 5x4 matrix of values will be provided. The other keywords represent
convenience shortcuts to allow commonly used color operations to be
performed without specifying a complete matrix.

Used by Elements: Filters.colorMatrix

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/type>

-}
colorMatrixType : ColorMatrixType -> Attribute msg
colorMatrixType cmType =
    attribute "type" <| colorMatrixTypeToString cmType


{-| Contents of `colorMatrixValues` depends on the value of the attribute
`type`.

Used by Elements: Filters.colorMatrix

NOTE: this is called `values` in `elm-lang/svg` but is different here
in order to differentiate from animationValues.

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/values>

-}
colorMatrixValues : String -> Attribute msg
colorMatrixValues string =
    attribute "values" string


{-| `compositeOperator` defines the compositing operation that is to be performed
in the `Filters.composite` element

Used by Elements: Filters.composite

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/operator>

-}
compositeOperator : CompositeOperator -> Attribute msg
compositeOperator operator =
    attribute "operator" <| compositeOperatorToString operator


{-| The `diffuseConstant` attribute represant the kd value in the Phong lighting
model. In SVG, this can be any non-negative number.

If the attribute is not specified, then the effect is as if a value of 1
were specified.

Used by Elements: Filters.diffuseLighting

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/diffuseConstant>

-}
diffuseConstant : Float -> Attribute msg
diffuseConstant kdValue =
    attribute "diffuseConstant" <| String.fromFloat kdValue


{-| After applying the `kernelMatrix` of the `Filters.convolveMatrix` element to
the input image to yield a number, that Float is divided by the value given to
the divisor attribute to yield the final destination color value. A divisor
that is the sum of all the matrix values tends to have an evening effect on
the overall color intensity of the result.

The default value is the sum of all values in kernelMatrix, with the
exception that if the sum is zero, then the divisor is set to 1.

It is an error to specify a divisor of zero.

Used by Elements: Filters.convolveMatrix

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/divisor>

-}
divisor : Float -> Attribute msg
divisor value =
    attribute "divisor" <| String.fromFloat value


{-| The edgeMode attribute determines how to extend the input image as necessary
with color values so that the matrix operations can be applied when the
kernel is positioned at or near the edge of the input image.

Used by Elements: Filters.convolveMatrix

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/edgeMode>

-}
edgeMode : EdgeMode -> Attribute msg
edgeMode eMode =
    attribute "edgeMode" <| edgeModeToString eMode


{-| The elevation attribute represents the direction angle for a light source
from the XY plane towards the Z axis, in degrees. Note the positive Z-axis
points towards the viewer of the content.

Used by Elements: Filters.distantLight

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/elevation>

-}
elevation : Float -> Attribute msg
elevation angle =
    attribute "elevation" <| String.fromFloat angle


{-| A `filter` element can define a region to which a given filter effect
applies and can provide a resolution for any intermediate continuous tone
images used to process any raster-based filter primitives.

NOTE: Obsolete.

Used by Elements: Filters.filter

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/filterRes>

-}
filterRes : Float -> Float -> Attribute msg
filterRes xPixels yPixels =
    attribute "filterRes" <| String.fromFloat xPixels ++ " " ++ String.fromFloat yPixels


{-| The `filterUnits` attribute defines the coordinate system for attributes
`x`, `y`, `width` and `height`.

Used by Elements: Filters.filter

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/filterUnits>

-}
filterUnits : CoordinateSystem -> Attribute msg
filterUnits coordinateSystem =
    attribute "filterUnits" <| coordinateSystemToString coordinateSystem


{-| The `floodColor` attribute indicates what color to use to flood the current
filter primitive subregion defined through the `Filters.flood` element. The
keyword currentColor and ICC colors can be specified in the same manner as
within a `paint` specification for the fill and stroke attributes.

As a presentation attribute, it also can be used as a property directly
inside a CSS stylesheet.

Used by Elements: Filters.flood

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/flood-color>

-}
floodColor : FloodColor -> Attribute msg
floodColor col =
    attribute "floodColor" <| floodColorToString col


{-| The `floodOpacity` attribute indicates the opacity value to use across the
current filter primitive subregion defined through the `Filters.flood` element.

Used by Elements: Filters.flood

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/flood-opacity>

-}
floodOpacity : Opacity -> Attribute msg
floodOpacity opacity =
    attribute "floodOpacity" <| opacityToString opacity


{-| The `in_` attribute identifies input for the given filter primitive.

Takes type InValue, which can be one of 6 constants, or a reference

If no value is provided and this is the first filter primitive, then this
filter primitive will use `InSourceGraphic` as its input.

If no value is provided and this is a subsequent filter primitive, then this
filter primitive will use the result from the previous filter primitive as
its input.

Used by Elements: Filters.blend, Filters.colorMatrix,
Filters.componentTransfer, Filters.composite, Filters.convolveMatrix,
Filters.diffuseLighting, Filters.displacementMap, Filters.gaussianBlur,
Filters.morphology, Filters.offset, Filters.specularLighting,
Filters.tile

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/in>

-}
in_ : InValue -> Attribute msg
in_ value =
    attribute "in" <| inValueToString value


{-| The `in2` attribute identifies the second input for the given filter
primitive. It works exactly like the in attribute.

Used by Elements: Filters.blend, Filters.colorMatrix,
Filters.componentTransfer, Filters.composite, Filters.convolveMatrix,
Filters.diffuseLighting, Filters.displacementMap, Filters.gaussianBlur,
Filters.morphology, Filters.offset, Filters.specularLighting,
Filters.tile

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/in2>

-}
in2 : InValue -> Attribute msg
in2 value =
    attribute "in2" <| inValueToString value


{-| The k1 attribute defines one of the values to be used within the arithmetic
operation of the `Filters.composite` filter primitive.

If this attribute is not set, its default value is 0.

Used by Elements: Filters.composite

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/k1>

-}
k1 : Float -> Attribute msg
k1 value =
    attribute "k1" <| String.fromFloat value


{-| The k2 attribute defines one of the values to be used within the arithmetic
operation of the `Filters.composite` filter primitive.

If this attribute is not set, its default value is 0.

Used by Elements: Filters.composite

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/k2>

-}
k2 : Float -> Attribute msg
k2 value =
    attribute "k2" <| String.fromFloat value


{-| The k3 attribute defines one of the values to be used within the arithmetic
operation of the `Filters.composite` filter primitive.

If this attribute is not set, its default value is 0.

Used by Elements: Filters.composite

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/k3>

-}
k3 : Float -> Attribute msg
k3 value =
    attribute "k3" <| String.fromFloat value


{-| The k4 attribute defines one of the values to be used within the arithmetic
operation of the `Filters.composite` filter primitive.

If this attribute is not set, its default value is 0.

Used by Elements: Filters.composite

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/k4>

-}
k4 : Float -> Attribute msg
k4 value =
    attribute "k4" <| String.fromFloat value


{-| The `order` attribute defines the list of numbers that makes up the kernel
matrix for the `Filters.convolveMatrix` element.

The Float of entries in the list must be equal to `orderX` x `orderY`, as
defined in the `order` attribute.

Used by Elements: Filters.convolveMatrix

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/kernelMatrix>

-}
kernelMatrix : List Float -> Attribute msg
kernelMatrix numberList =
    attribute "kernelMatrix" (String.join " " (List.map String.fromFloat numberList))


{-| The `kernelUnitLength` attribute has two meaning based on the context it's
used:

  - For lighting filter primitives, it indicates the intended distance in
    current filter units (i.e., units as determined by the value of attribute
    primitiveUnits) for `dx` and `dy`, respectively, in the surface normal
    calculation formulas.

  - For the `feConvolveMatrix` primitive, it indicates the intended distance
    in current filter units (i.e., units as determined by the value of
    attribute primitiveUnits) between successive columns and rows,
    respectively, in the kernelMatrix.

Used by Elements: Filters.convolveMatrix, Filters.diffuseLighting,
Filters.specularLighting

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/kernelUnitLength>

-}
kernelUnitLength : Float -> Float -> Attribute msg
kernelUnitLength dx dy =
    attribute "kernelUnitLength" <| String.fromFloat dx ++ " " ++ String.fromFloat dy


{-| The limitingConeAngle attribute represents the angle in degrees between
the spot light axis (i.e. the axis between the light source and the point
to which it is pointing at) and the spot light cone. So it defines a
limiting cone which restricts the region where the light is projected.
No light is projected outside the cone.

If no value is specified, then no limiting cone will be applied.

Used by Elements: Filters.spotlight

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/limitingConeAngle>

-}
limitingConeAngle : Float -> Attribute msg
limitingConeAngle num =
    attribute "limitingConeAngle" <| String.fromFloat num


{-| The `mode` attribute defines the blending mode on the `Filters.blend` filter
primitive.

Used by Elements: Filters.blend

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/mode>

-}
mode : Mode -> Attribute msg
mode md =
    attribute "mode" <| modeToString md


{-| `morphologyOperator` defines the compositing operation that is to be performed
in the `feMorphology` element

Used by Elements: Filters.morphology

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/operator>

-}
morphologyOperator : MorphologyOperator -> Attribute msg
morphologyOperator operator =
    attribute "operator" <| morphologyOperatorToString operator


{-| The `numOctaves` parameter for the noise function of the
`Filters.turbulence` primitive.

If the attribute is not specified, then the effect is as if a value of 1
were specified.

Used by Elements: Filters.turbulence

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/>

-}
numOctaves : Int -> Attribute msg
numOctaves int =
    attribute "numOctaves" <| String.fromInt int


{-| The order attribute indicates the size of the matrix to be used by an
`Filters.convolveMatrix` element.

The values provided must be integers greater than zero. The first number,
`orderX`, indicates the Float of columns in the matrix. The second number,
`orderY`, indicates the Float of rows in the matrix.

A typical value is order="3". It is recommended that only small values
(e.g., 3) be used; higher values may result in very high CPU overhead and
usually do not produce results that justify the impact on performance.

If the attribute is not specified, the effect is as if a value of 3 were
specified.

Used by Elements: Filters.convolveMatrix

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/order>

-}
order : Float -> Float -> Attribute msg
order orderX orderY =
    attribute "order" <| String.fromFloat orderX ++ " " ++ String.fromFloat orderY


{-| The `pointsAtX` attribute represent the X location in the coordinate system
established by attribute primitiveUnits on the `filter` element of the point
at which the light source is pointing.

If the attribute is not specified, then the effect is as if a value of 0
were specified.

Used by Elements: Filters.spotlight

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/pointsAtX>

-}
pointsAtX : Float -> Attribute msg
pointsAtX lightSourceX =
    attribute "pointsAtX" <| String.fromFloat lightSourceX


{-| The `pointsAtY` attribute represent the Y location in the coordinate system
established by attribute primitiveUnits on the `filter` element of the point
at which the light source is pointing.

If the attribute is not specified, then the effect is as if a value of 0
were specified.

Used by Elements: Filters.spotlight

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/pointsAtY>

-}
pointsAtY : Float -> Attribute msg
pointsAtY lightSourceY =
    attribute "pointsAtY" <| String.fromFloat lightSourceY


{-| The `pointsAtZ` attribute represents the Z location in the coordinate system
established by attribute primitiveUnits on the `filter` element of the point
at which the light source is pointing.

If the attribute is not specified, then the effect is as if a value of 0
were specified.

Used by Elements: Filters.spotlight

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/pointsAtZ>

-}
pointsAtZ : Float -> Attribute msg
pointsAtZ lightSourceZ =
    attribute "pointsAtZ" <| String.fromFloat lightSourceZ


{-| The `preserveAlpha` attribute indicates how an `feConvolveMatrix` element
handles alpha transparency.

A value of false indicates that the convolution matrix will apply to all
channels, including the alpha channel. This is the default value.

A value of true indicates that the convolution matrix will only apply to the
color channels.

Used by Elements: Filters.convolveMatrix

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/preserveAlpha>

-}
preserveAlpha : Bool -> Attribute msg
preserveAlpha applyOnlyToColorChannels =
    attribute "preserveAlpha" <| boolToString applyOnlyToColorChannels


{-| The `radius` attribute represent the radius for the operation on a given
`feMorphology` filter primitive. The values are in the coordinate system
established by the `primitiveUnits` attribute on the `filter` element.

If the attribute is not specified, then the effect is as if a value of 0
were specified.

Used by Elements: Filters.morphology

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/radius>

-}
radius : Float -> Float -> Attribute msg
radius xRadius yRadius =
    attribute "radius" <| String.fromFloat xRadius ++ " " ++ String.fromFloat yRadius


{-| The `result` attribute defines the assigned name for this filter primitive.
If supplied, then graphics that result from processing this filter primitive
can be referenced by an in attribute on a subsequent filter primitive within
the same `filter` element.

If no value is provided, the output will only be available for re-use as the
implicit input into the next filter primitive if that filter primitive
provides no value for its in attribute.

Used by Elements: feBlend, feColorMatrix, feComponentTransfer, feComposite,
feConvolveMatrix, feDiffuseLighting, feDisplacementMap, feDropShadow,
feFlood,feFuncA, feFuncB, feFuncG, feFuncR,feGaussianBlur, feImage,
feMerge, feMergeNode, feMorphology, feOffset, feSpecularLighting,
feTile, feTurbulence

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/result>

-}
result : String -> Attribute msg
result reference =
    attribute "result" <| reference


{-| The `scale` attribute define the displacement scale factor to be used on a
`Filters.displacementMap` filter primitive. The amount is expressed in the
coordinate system established by the `primitiveUnits` attribute on the
`filter` element.

When the value of this attribute is 0, this operation has no effect on the
source image.

If the attribute is not specified, then the effect is as if a value of 0
were specified.

Used by Elements: Filters.displacementMap

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/scale>

-}
scale : Float -> Attribute msg
scale value =
    attribute "scale" <| String.fromFloat value


{-| The seed attribute represents the starting Float for the pseudo random
number generator of the `Filters.turbulence` primitive.

If the attribute is not specified, then the effect is as if a value of 0
were specified.

Used by Elements: Filters.turbulence

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/seed>

-}
seed : Float -> Attribute msg
seed value =
    attribute "seed" <| String.fromFloat value


{-| The `surfaceScale` attribute represents the height of the surface for a
light filter primitive.

If the attribute is not specified, then the effect is as if a value of 1
were specified.

Used by Elements: Filters.diffuseLighting, Filters.specularLighting

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/surfaceScale>

-}
surfaceScale : Float -> Attribute msg
surfaceScale value =
    attribute "surfaceScale" <| String.fromFloat value


{-| The `targetX` attribute determines the positioning in X of the convolution
matrix relative to a given target pixel in the input image. The leftmost
column of the matrix is column Float zero. The value must be such that:

    0 <= targetX < orderX

By default, the convolution matrix is centered in X over each pixel of the
input image (i.e., targetX = floor ( orderX / 2 )).

Used by Elements: convolveMatrix

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/targetX>

-}
targetX : Float -> Attribute msg
targetX xPosition =
    attribute "targetX" <| String.fromFloat xPosition


{-| The targetY attribute determines the positioning in Y of the convolution
matrix relative to a given target pixel in the input image. The topmost
row of the matrix is row Float zero. The value must be such that:

    0 <= targetY < orderY

By default, the convolution matrix is centered in Y over each pixel of the
input image (i.e., targetY = floor ( orderY / 2 )).

Used by Elements: Filters.convolveMatrix

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/targetY>

-}
targetY : Float -> Attribute msg
targetY yPosition =
    attribute "targetY" <| String.fromFloat yPosition


{-| Indicates the type of component transfer function.

Used by Elements: Filters.funcR, Filters.funcG, Filters.funcA, Filters.funcB

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/type>

-}
funcType : FuncType -> Attribute msg
funcType fType =
    attribute "type" <| funcTypeToString fType


{-| Indicates whether the filter primitive should perform a noise or turbulence
function.

Used by Elements: Filters.turbulence

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/type>

-}
turbulenceType : TurbulenceType -> Attribute msg
turbulenceType tType =
    attribute "type" <| turbulenceTypeToString tType


{-| The `z` attribute difines the location along the Z-axis for a light source
in the coordinate system established by the primitiveUnits attribute on the
`filter` element, assuming that, in the initial coordinate system, the
positive Z-axis comes out towards the person viewing the content and
assuming that one unit along the Z-axis equals on unit in X and Z.

If the attribute is not specified, then the effect is as if a value of 0 were specified.

Used by Elements: Filters.pointlight, Filters.spotlight

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/z>

-}
z : Float -> Attribute msg
z value =
    attribute "z" <| String.fromFloat value
