module TypedSvg.Filters.Attributes exposing (..)

{-| Attributes of SVG filter elements
-}

import Color exposing (Color)
import Color.Convert exposing (colorToCssRgba)
import Svg exposing (Attribute, Svg)
import Svg.Attributes as Attr
import TypedSvg.Types exposing (..)


{-|
    The azimuth attribute represents the direction angle of the light source on
    the XY plane (clockwise), in degrees from the x axis.

    If the attribute is not specified, then the effect is as if a value of 0
    were specified.

    Used by Elements: feDistantLight

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/azimuth
-}
azimuth : number -> Attribute msg
azimuth angle =
    Attr.azimuth <| toString angle


{-|
    The baseFrequency attribute represents the frequency parameter for the noise
    function of the feTurbulence primitive. The first number represents a base
    frequency in the X direction and the second value represents a base
    frequency in the Y direction.

    Negative values are forbidden.

    If the attribute is not specified, then the effect is as if a value of 0
    were specified.

    Used by Elements: feTurbulence

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/baseFrequency
-}
baseFrequency : number -> number -> Attribute msg
baseFrequency xFrequency yFrequency =
    Attr.baseFrequency <| (toString xFrequency) ++ " " ++ (toString yFrequency)


{-|
    The bias attribute shifts the range of a filter. After applying the
    kernelMatrix of the feConvolveMatrix element to the input image to yield a
    number and applying the divisor attribute, the bias attribute is added to
    each component. This allows representation of values that would otherwise
    be clamped to 0 or 1.

    If bias is not specified, then the effect is as if a value of 0 were
    specified.

    Used by Elements: feConvolveMatrix

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/bias
-}
bias : number -> Attribute msg
bias rangeShift =
    Attr.bias <| toString rangeShift


{-|
    The `colorInterpolationFilters` attribute specifies the color space for
    imaging operations performed via filter effects.

    Note that `colorInterpolationFilters` has a different initial value than
    `colorInterpolation`. `colorInterpolationFilters` has an initial value of
    linearRGB, whereas color-interpolation has an initial value of sRGB. Thus,
    in the default case, filter effects operations occur in the linearRGB
    color space, whereas all other color interpolations occur by default in the
    sRGB color space.

    As a presentation attribute, it also can be used as a property directly
    inside a CSS stylesheet.

    Used by Elements: feBlend, feColorMatrix, feComponentTransfer, feComposite,
        feConvolveMatrix, feDiffuseLighting, feDisplacementMap, feGaussianBlur,
        feMorphology, feOffset, feSpecularLighting, feTile

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/color-interpolation-filters
-}
colorInterpolationFilters : ColorInterpolation -> Attribute msg
colorInterpolationFilters colorInterpolation =
    Attr.colorInterpolationFilters <| colorInterpolationToString colorInterpolation


{-|
    compositeOperator defines the compositing operation that is to be performed
    in the `feComposite` element

    Used by Elements: feComposite

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/operator
-}
compositeOperator : CompositeOperator -> Attribute msg
compositeOperator operator =
    Attr.operator <|
        case operator of
            CompositeOperatorOver ->
                "over"

            CompositeOperatorIn ->
                "in"

            CompositeOperatorOut ->
                "out"

            CompositeOperatorAtop ->
                "atop"

            CompositeOperatorXor ->
                "xor"

            CompositeOperatorArithmetic ->
                "arithmetic"


type CompositeOperator
    = CompositeOperatorOver
    | CompositeOperatorIn
    | CompositeOperatorOut
    | CompositeOperatorAtop
    | CompositeOperatorXor
    | CompositeOperatorArithmetic


{-|
    The diffuseConstant attribute represant the kd value in the Phong lighting
    model. In SVG, this can be any non-negative number.

    If the attribute is not specified, then the effect is as if a value of 1
    were specified.

    Used by Elements: feDiffuseLighting

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/diffuseConstant
-}
diffuseConstant : number -> Attribute msg
diffuseConstant kdValue =
    Attr.diffuseConstant <| toString kdValue


{-|
    After applying the kernelMatrix of the feConvolveMatrix element to the input
    image to yield a number, that number is divided by the value given to the
    divisor attribute to yield the final destination color value. A divisor that
    is the sum of all the matrix values tends to have an evening effect on the
    overall color intensity of the result.

    The default value is the sum of all values in kernelMatrix, with the
    exception that if the sum is zero, then the divisor is set to 1.

    It is an error to specify a divisor of zero.

    Used by Elements: feConvolveMatrix

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/divisor
-}
divisor : number -> Attribute msg
divisor value =
    Attr.divisor <| toString value


{-|
    The edgeMode attribute determines how to extend the input image as necessary
    with color values so that the matrix operations can be applied when the
    kernel is positioned at or near the edge of the input image.

    Used by Elements: feConvolveMatrix

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/edgeMode
-}
edgeMode : EdgeMode -> Attribute msg
edgeMode option =
    Attr.edgeMode <|
        case option of
            EdgeModeDuplicate ->
                "duplicate"

            EdgeModeWrap ->
                "wrap"

            EdgeModeNone ->
                "none"


type EdgeMode
    = EdgeModeDuplicate
    | EdgeModeWrap
    | EdgeModeNone


{-|
    The elevation attribute represents the direction angle for a light source
    from the XY plane towards the Z axis, in degrees. Note the positive Z-axis
    points towards the viewer of the content.

    Used by Elements: feDistantLight

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/elevation
-}
elevation : number -> Attribute msg
elevation angle =
    Attr.elevation <| toString angle


{-|
    A <filter> element can define a region to which a given filter effect
    applies and can provide a resolution for any intermediate continuous tone
    images used to process any raster-based filter primitives.

    NOTE: Obsolete.

    Used by Elements: filter

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/filterRes
-}
filterRes : number -> number -> Attribute msg
filterRes xPixels yPixels =
    Attr.filterRes <| (toString xPixels) ++ " " ++ (toString yPixels)


{-|
    The filterUnits attribute defines the coordinate system for attributes x, y,
    width and height.

    Used by Elements: filter

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/filterUnits
-}
filterUnits : CoordinateSystem -> Attribute msg
filterUnits coordinateSystem =
    Attr.filterUnits <| coordinateSystemToString coordinateSystem


{-|
    The `floodColor` attribute indicates what color to use to flood the current
    filter primitive subregion defined through the `feFlood` element. The
    keyword currentColor and ICC colors can be specified in the same manner as
    within a `paint` specification for the fill and stroke attributes.

    As a presentation attribute, it also can be used as a property directly
    inside a CSS stylesheet.

    Used by Elements: feFlood

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/flood-color
-}
floodColor : FloodColor -> Attribute msg
floodColor color =
    Attr.floodColor <|
        case color of
            FloodInherit ->
                "inherit"

            FloodCurrentColor ->
                "currentColor"

            Flood color ->
                colorToCssRgba color

            FloodICC iccColor ->
                iccColor


type FloodColor
    = FloodInherit
    | FloodCurrentColor
    | Flood Color
    | FloodICC String


{-|
    The `floodOpacity` attribute indicates the opacity value to use across the
    current filter primitive subregion defined through the `feFlood` element.

    Used by Elements: feFlood

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/flood-opacity
-}
floodOpacity : Opacity -> Attribute msg
floodOpacity opacity =
    Attr.floodOpacity <| opacityToString opacity


{-|
    The `in_` attribute identifies input for the given filter primitive.

    Takes type InValue, which can be one of 6 constants, or a reference

    If no value is provided and this is the first filter primitive, then this
    filter primitive will use `InSourceGraphic` as its input.

    If no value is provided and this is a subsequent filter primitive, then this
    filter primitive will use the result from the previous filter primitive as
    its input.

    Used by Elements: feBlend, feColorMatrix, feComponentTransfer, feComposite,
        feConvolveMatrix, feDiffuseLighting, feDisplacementMap, feGaussianBlur,
        feMorphology, feOffset, feSpecularLighting, feTile

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/in
-}
in_ : InValue -> Attribute msg
in_ value =
    Attr.in_ <| inValueToString value


{-|
    The `in2` attribute identifies the second input for the given filter
    primitive. It works exactly like the in attribute.

    Used by Elements: feBlend, feColorMatrix, feComponentTransfer, feComposite,
        feConvolveMatrix, feDiffuseLighting, feDisplacementMap, feGaussianBlur,
        feMorphology, feOffset, feSpecularLighting, feTile

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/in2
-}
in2 : InValue -> Attribute msg
in2 value =
    Attr.in2 <| inValueToString value


type InValue
    = InSourceGraphic
    | InSourceAlpha
    | InBackgroundAlpha
    | InFillPaint
    | InStrokePaint
    | InReference String


inValueToString : InValue -> String
inValueToString value =
    case value of
        InSourceGraphic ->
            "sourceGraphic"

        InSourceAlpha ->
            "sourceAlpha"

        InBackgroundAlpha ->
            "backgroundAlpha"

        InFillPaint ->
            "fillPaint"

        InStrokePaint ->
            "strokePaint"

        InReference str ->
            str


{-|
    The k1 attribute defines one of the values to be used within the arithmetic
    operation of the `feComposite` filter primitive.

    If this attribute is not set, its default value is 0.

    Used by Elements: feComposite

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/k1
-}
k1 : number -> Attribute msg
k1 value =
    Attr.k1 <| toString value


{-|
    The k2 attribute defines one of the values to be used within the arithmetic
    operation of the `feComposite` filter primitive.

    If this attribute is not set, its default value is 0.

    Used by Elements: feComposite

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/k2
-}
k2 : number -> Attribute msg
k2 value =
    Attr.k2 <| toString value


{-|
    The k3 attribute defines one of the values to be used within the arithmetic
    operation of the `feComposite` filter primitive.

    If this attribute is not set, its default value is 0.

    Used by Elements: feComposite

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/k3
-}
k3 : number -> Attribute msg
k3 value =
    Attr.k3 <| toString value


{-|
    The k4 attribute defines one of the values to be used within the arithmetic
    operation of the `feComposite` filter primitive.

    If this attribute is not set, its default value is 0.

    Used by Elements: feComposite

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/k4
-}
k4 : number -> Attribute msg
k4 value =
    Attr.k4 <| toString value


{-|
    The `order` attribute defines the list of numbers that makes up the kernel
    matrix for the `feConvolveMatrix` element.

    The number of entries in the list must be equal to `orderX` x `orderY`, as
    defined in the `order` attribute.

    Used by Elements: feConvolveMatrix

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/kernelMatrix
-}
kernelMatrix : List number -> Attribute msg
kernelMatrix numberList =
    Attr.kernelMatrix (String.join " " (List.map toString numberList))


{-|
    The kernelUnitLength attribute has two meaning based on the context it's
    used:

    - For lighting filter primitives, it indicates the intended distance in
      current filter units (i.e., units as determined by the value of attribute
      primitiveUnits) for `dx` and `dy`, respectively, in the surface normal
      calculation formulas.

    - For the `feConvolveMatrix` primitive, it indicates the intended distance
      in current filter units (i.e., units as determined by the value of
      attribute primitiveUnits) between successive columns and rows,
      respectively, in the kernelMatrix.

    Used by Elements: feConvolveMatrix, feDiffuseLighting, feSpecularLighting

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/kernelUnitLength
-}
kernelUnitLength : number -> number -> Attribute msg
kernelUnitLength dx dy =
    Attr.kernelUnitLength <| (toString dx) ++ " " ++ (toString dy)


{-|
    The limitingConeAngle attribute represents the angle in degrees between
    the spot light axis (i.e. the axis between the light source and the point
    to which it is pointing at) and the spot light cone. So it defines a
    limiting cone which restricts the region where the light is projected.
    No light is projected outside the cone.

    If no value is specified, then no limiting cone will be applied.

    Used by Elements: feSpotlight

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/limitingConeAngle
-}
limitingConeAngle : number -> Attribute msg
limitingConeAngle number =
    Attr.limitingConeAngle <| toString number


{-|
    The mode attribute defines the blending mode on the `feBlend` filter
    primitive.

    Used by Elements: feBlend

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/mode
-}
mode : Mode -> Attribute msg
mode option =
    Attr.mode <|
        case option of
            ModeNormal ->
                "normal"

            ModeMultiply ->
                "multiply"

            ModeScreen ->
                "screen"

            ModeDarken ->
                "darken"

            ModeLighten ->
                "lighten"


type Mode
    = ModeNormal
    | ModeMultiply
    | ModeScreen
    | ModeDarken
    | ModeLighten


{-|
    The numOctaves parameter for the noise function of the `feTurbulence`
    primitive.

    If the attribute is not specified, then the effect is as if a value of 1
    were specified.

    Used by Elements: feTurbulence

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/
-}
numOctaves : Int -> Attribute msg
numOctaves int =
    Attr.numOctaves <| toString int


{-|
    compositeOperator defines the compositing operation that is to be performed
    in the `feMorphology` element

    Used by Elements: feMorphology

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/operator
-}
morphologyOperator : MorphologyOperator -> Attribute msg
morphologyOperator operator =
    Attr.operator <|
        case operator of
            MorphologyOperatorErode ->
                "erode"

            MorphologyOperatorDilate ->
                "dilate"


type MorphologyOperator
    = MorphologyOperatorErode
    | MorphologyOperatorDilate


{-|
    The order attribute indicates the size of the matrix to be used by an
    `feConvolveMatrix` element.

    The values provided must be integers greater than zero. The first number,
    `orderX`, indicates the number of columns in the matrix. The second number,
    `orderY`, indicates the number of rows in the matrix.

    A typical value is order="3". It is recommended that only small values
    (e.g., 3) be used; higher values may result in very high CPU overhead and
    usually do not produce results that justify the impact on performance.

    If the attribute is not specified, the effect is as if a value of 3 were
    specified.

    Used by Elements: feConvolveMatrix

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/order
-}
order : number -> number -> Attribute msg
order orderX orderY =
    Attr.order <| (toString orderX) ++ " " ++ (toString orderY)


{-|
    The `pointsAtX` attribute represent the X location in the coordinate system
    established by attribute primitiveUnits on the `filter` element of the point
    at which the light source is pointing.

    If the attribute is not specified, then the effect is as if a value of 0
    were specified.

    Used by Elements: feSpotlight

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/pointsAtX
-}
pointsAtX : number -> Attribute msg
pointsAtX lightSourceX =
    Attr.pointsAtX <| toString lightSourceX


{-|
    The `pointsAtY` attribute represent the Y location in the coordinate system
    established by attribute primitiveUnits on the `filter` element of the point
    at which the light source is pointing.

    If the attribute is not specified, then the effect is as if a value of 0
    were specified.

    Used by Elements: feSpotlight

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/pointsAtY
-}
pointsAtY : number -> Attribute msg
pointsAtY lightSourceY =
    Attr.pointsAtY <| toString lightSourceY


{-|
    The `pointsAtZ` attribute represents the Z location in the coordinate system
    established by attribute primitiveUnits on the `filter` element of the point
    at which the light source is pointing.

    If the attribute is not specified, then the effect is as if a value of 0
    were specified.

    Used by Elements: feSpotlight

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/pointsAtZ
-}
pointsAtZ : number -> Attribute msg
pointsAtZ lightSourceZ =
    Attr.pointsAtZ <| toString lightSourceZ


{-|
    The `preserveAlpha` attribute indicates how an `feConvolveMatrix` element
    handles alpha transparency.

    A value of false indicates that the convolution matrix will apply to all
    channels, including the alpha channel. This is the default value.

    A value of true indicates that the convolution matrix will only apply to the
    color channels.

    Used by Elements: feConvolveMatrix

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/preserveAlpha
-}
preserveAlpha : Bool -> Attribute msg
preserveAlpha applyOnlyToColorChannels =
    Attr.preserveAlpha <| boolToString applyOnlyToColorChannels


{-|
    The `radius` attribute represent the radius for the operation on a given
    `feMorphology` filter primitive. The values are in the coordinate system
    established by the `primitiveUnits` attribute on the `filter` element.

    If the attribute is not specified, then the effect is as if a value of 0
    were specified.

    Used by Elements: feMorphology

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/radius
-}
radius : number -> number -> Attribute msg
radius xRadius yRadius =
    Attr.radius <| (toString xRadius) ++ " " ++ (toString yRadius)


{-|
    The `result` attribute defines the assigned name for this filter primitive.
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

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/result
-}
result : String -> Attribute msg
result reference =
    Attr.result <| reference


{-|
    The `scale` attribute define the displacement scale factor to be used on a
    `feDisplacementMap` filter primitive. The amount is expressed in the
    coordinate system established by the `primitiveUnits` attribute on the
    `filter` element.

    When the value of this attribute is 0, this operation has no effect on the
    source image.

    If the attribute is not specified, then the effect is as if a value of 0
    were specified.

    Used by Elements: feDisplacementMap

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/scale
-}
scale : number -> Attribute msg
scale value =
    Attr.scale <| toString value


{-|
    The seed attribute represents the starting number for the pseudo random
    number generator of the `feTurbulence` primitive.

    If the attribute is not specified, then the effect is as if a value of 0
    were specified.

    Used by Elements: feTurbulence

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/seed
-}
seed : number -> Attribute msg
seed value =
    Attr.seed <| toString value


{-|
    The `surfaceScale` attribute represents the height of the surface for a
    light filter primitive.

    If the attribute is not specified, then the effect is as if a value of 1
    were specified.

    Used by Elements: feDiffuseLighting, feSpecularLighting

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/surfaceScale
-}
surfaceScale : number -> Attribute msg
surfaceScale value =
    Attr.surfaceScale <| toString value


{-|
    The `targetX` attribute determines the positioning in X of the convolution
    matrix relative to a given target pixel in the input image. The leftmost
    column of the matrix is column number zero. The value must be such that:

        0 <= targetX < orderX

    By default, the convolution matrix is centered in X over each pixel of the
    input image (i.e., targetX = floor ( orderX / 2 )).

    Used by Elements: feConvolveMatrix

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/targetX
-}
targetX : number -> Attribute msg
targetX xPosition =
    Attr.targetX <| toString xPosition


{-|
    The targetY attribute determines the positioning in Y of the convolution
    matrix relative to a given target pixel in the input image. The topmost
    row of the matrix is row number zero. The value must be such that:

        0 <= targetY < orderY

    By default, the convolution matrix is centered in Y over each pixel of the
    input image (i.e., targetY = floor ( orderY / 2 )).

    Used by Elements: feConvolveMatrix

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/targetY
-}
targetY : number -> Attribute msg
targetY yPosition =
    Attr.targetY <| toString yPosition


{-|
    Indicates the type of matrix operation. The keyword matrix indicates that a
    full 5x4 matrix of values will be provided. The other keywords represent
    convenience shortcuts to allow commonly used color operations to be
    performed without specifying a complete matrix.

    Used by Elements: feColorMatrix

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/type_
-}
feColorMatrixType : FeColorMatrixType -> Attribute msg
feColorMatrixType t =
    Attr.type_ <|
        case t of
            TypeMatrix ->
                "matrix"

            TypeSaturate ->
                "saturate"

            TypeHueRotate ->
                "hueRotate"

            TypeLuminanceToAlpha ->
                "luminanceToAlpha"


type FeColorMatrixType
    = TypeMatrix
    | TypeSaturate
    | TypeHueRotate
    | TypeLuminanceToAlpha


{-|
    Indicates the type of component transfer function.

    Used by Elements: feFuncR, feFuncG, feFuncA, feFuncB

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/type_
-}
feFuncType : FeFuncType -> Attribute msg
feFuncType t =
    Attr.type_ <|
        case t of
            TypeIdentity ->
                "identity"

            TypeTable ->
                "table"

            TypeDiscrete ->
                "discrete"

            TypeLinear ->
                "linear"

            TypeGamma ->
                "gamma"


type FeFuncType
    = TypeIdentity
    | TypeTable
    | TypeDiscrete
    | TypeLinear
    | TypeGamma


{-|
    Indicates whether the filter primitive should perform a noise or turbulence
    function.

    Used by Elements: feTurbulence

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/type_
-}
feTurbulenceType : FeTurbulenceType -> Attribute msg
feTurbulenceType t =
    Attr.type_ <|
        case t of
            TypeFractalNoise ->
                "fractalNoise"

            TypeTurbulence ->
                "turbulence"


type FeTurbulenceType
    = TypeFractalNoise
    | TypeTurbulence


{-|
    Contents of feColorMatrixValues depends on the value of the attribute
    `type`.

    Used by Elements: feColorMatrix

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/values
-}
feColorMatrixValues : String -> Attribute msg
feColorMatrixValues string =
    Attr.values string


{-|
    The `z` attribute difines the location along the Z-axis for a light source
    in the coordinate system established by the primitiveUnits attribute on the
    `filter` element, assuming that, in the initial coordinate system, the
    positive Z-axis comes out towards the person viewing the content and
    assuming that one unit along the Z-axis equals on unit in X and Z.

    If the attribute is not specified, then the effect is as if a value of 0 were specified.

    Used by Elements: fePointlight, feSpotlight

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/z
-}
z : number -> Attribute msg
z value =
    Attr.z <| toString value
