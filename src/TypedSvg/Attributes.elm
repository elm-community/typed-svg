module TypedSvg.Attributes
    exposing
        ( AccumulateOption(..)
        , AdditiveOption(..)
        , AttributeTypeOption(..)
        , CalcModeOption(..)
        , ClipOption(..)
        , CoordinateSystem(..)
        , DurationValue(..)
        , EdgeModeOption(..)
        , TimingValue(..)
        , Transform(..)
          {--Regular Attributes-}
        , accentHeight
        , accelerate
        , accumulate
        , additive
          -- , alphabetic
          -- , allowReorder
          -- , amplitude
          -- , arabicForm
        , ascent
        , attributeName
        , attributeType
          -- , autoReverse
        , azimuth
        , baseFrequency
          -- , baseProfile
          -- , bbox
        , begin
        , bias
          -- , by
        , calcMode
          -- , capHeight
        , class
        , clipPathUnits
        , contentScriptType
        , contentStyleType
        , cx
        , cy
        , d
          -- , decelerate
          -- , descent
        , diffuseConstant
        , divisor
        , dur
        , dx
        , dy
        , edgeMode
        , elevation
          -- , enableBackground
        , end
          -- , exponent
        , externalResourcesRequired
        , filterRes
        , filterUnits
          -- , format
        , from
          -- , g1
          -- , g2
          -- , glyphName
          -- , glyphRef
        , gradientTransform
        , gradientUnits
          -- , hanging
          -- , horizAdvX
          -- , horizOriginX
          -- , horizOriginY
          -- , id
          -- , ideographic
        , in_
        , in2
          -- , intercept
          -- , k
        , k1
        , k2
        , k3
        , k4
        , kernelMatrix
        , kernelUnitLength
          -- , keyPoints
        , keySplines
        , keyTimes
          -- , lang
        , lengthAdjust
        , limitingConeAngle
        , local
        , markerHeight
        , markerUnits
        , markerWidth
        , maskContentUnits
        , maskUnits
          -- , mathematical
        , max
          -- , media
          -- , method
        , min
        , mode
          -- , name
        , numOctaves
          -- , offset
        , operator
        , order
          -- , orient
          -- , orientation
          -- , origin
        , overlinePosition
        , overlineThickness
          -- , panose1
        , path
        , pathLength
        , patternContentUnits
        , patternTransform
        , patternUnits
        , pointOrder
        , points
        , pointsAtX
        , pointsAtY
        , pointsAtZ
        , preserveAlpha
        , preserveAspectRatio
        , primitiveUnits
        , r
        , radius
          -- , refX
          -- , refY
          -- , renderingIntent
        , repeatCount
        , repeatDur
          -- , requiredExtensions
        , requiredFeatures
        , restart
        , result
          -- , rotate
        , rx
        , ry
        , scale
        , seed
          -- , slope
          -- , spacing
        , specularConstant
        , specularExponent
          -- , speed
          -- , spreadMethod
          -- , startOffset
        , stdDeviation
          -- , stemh
          -- , stemv
        , stitchTiles
        , strikethroughPosition
        , strikethroughThickness
          -- , string
        , style
        , surfaceScale
          -- , systemLanguage
          -- , tableValues
          -- , target
        , targetX
        , targetY
        , textLength
        , title
        , to
        , transform
        , type_
          -- , u1
          -- , u2
        , underlinePosition
        , underlineThickness
          -- , unicode
          -- , unicodeRange
          -- , unitsPerEm
          -- , vAlphabetic
          -- , vHanging
          -- , vIdeographic
          -- , vMathematical
        , values
        , version
          -- , vertAdvY
          -- , vertOriginX
          -- , vertOriginY
        , viewBox
          -- , viewTarget
          -- , widths
        , xChannelSelector
          -- , xlinkActuate
          -- , xlinkArcrole
        , xlinkHref
          -- , xlinkRole
        , xlinkShow
        , xlinkTitle
          -- , xlinkType
          -- , xmlBase
        , xmlLang
        , xmlSpace
        , yChannelSelector
        , z
          -- , zoomAndPan
          --
          {--Length or Position Attributes-}
        , fx
        , fy
        , height
        , width
        , x
        , y
        , y1
        , x1
        , x2
        , y2
          --
          {--Presentation Attributes-}
          -- , alignmentBaseline
          -- , baselineShift
          -- , clipPath
          -- , clipRule
          -- , clip
          -- , colorInterpolationFilters
          -- , colorInterpolation
          -- , colorProfile
          -- , colorRendering
          -- , color
          -- , cursor
          -- , direction
          -- , display
          -- , dominantBaseline
          -- , enableBackground
          -- , fillOpacity
          -- , fillRule
          -- , fill
          -- , filter
          -- , floodColor
          -- , floodOpacity
          -- , fontFamily
          -- , fontSizeAdjust
          -- , fontSize
          -- , fontStretch
          -- , fontStyle
          -- , fontVariant
          -- , fontWeight
          -- , glyphOrientationHorizontal
          -- , glyphOrientationVertical
          -- , imageRendering
          -- , kerning
          -- , letterSpacing
          -- , lightingColor
          -- , markerEnd
          -- , markerMid
          -- , markerStart
          -- , mask
          -- , opacity
          -- , overflow
          -- , pointerEvents
          -- , shapeRendering
          -- , stopColor
          -- , stopOpacity
          -- , strokeDasharray
          -- , strokeDashoffset
          -- , strokeLinecap
          -- , strokeLinejoin
          -- , strokeMiterlimit
          -- , strokeOpacity
          -- , strokeWidth
          -- , stroke
          -- , textAnchor
          -- , textDecoration
          -- , textRendering
          -- , unicodeBidi
          -- , visibility
          -- , wordSpacing
          -- , writingMode
        )

import Color exposing (Color)
import Color.Convert exposing (colorToCssRgba)
import Html exposing (Html, a)
import Svg exposing (Attribute, Svg, a, svg)
import Svg.Attributes as Attr exposing (contentScriptType, enableBackground, externalResourcesRequired, gradientTransform, kernelMatrix, kernelUnitLength)
import TypedSvg.Lengths exposing (..)


{-| The Transform type is used by `transform` and `gradientTransform`
-}
type Transform
    = Matrix Float Float Float Float Float Float
    | Rotate Float Float Float
    | Scale Float Float
    | SkewX Float
    | SkewY Float
    | Translate Float Float


transformToString : Transform -> String
transformToString xform =
    let
        tr name args =
            String.concat
                [ name
                , "("
                , String.join " " (List.map toString args)
                , ")"
                ]
    in
        case xform of
            Matrix a b c d e f ->
                tr <| "matrix" [ a, b, c, d, e, f ]

            Rotate a x y ->
                tr <| "rotate" [ a, x, y ]

            Scale x y ->
                tr <| "scale" [ x, y ]

            SkewX x ->
                tr <| "skewX" [ x ]

            SkewY y ->
                tr <| "skewY" [ y ]

            Translate x y ->
                tr <| "translate" [ x, y ]


{-| In a future version of TypedSvg, this may be turned into a DSL
-}
type alias ClockValue =
    String


timingValueAsString : TimingValue -> String
timingValueAsString timingValue =
    case timingValue of
        TimingOffsetValue clock ->
            clock

        TimingSyncBaseValue str ->
            str

        TimingEventValue str ->
            str

        TimingRepeatValue str ->
            str

        TimingAccessKeyValue str ->
            str

        TimingWallclockSyncValue str ->
            str

        TimingIndefinite ->
            "indefinite"


{-| Used by `begin` and `end` in constraining animation times
-}
type TimingValue
    = TimingOffsetValue ClockValue
    | TimingSyncBaseValue String
    | TimingEventValue String
    | TimingRepeatValue String
    | TimingAccessKeyValue String
    | TimingWallclockSyncValue String
    | TimingIndefinite


{-| CoordinateSystem is used by filter and clip
-}
coordinateSystemToString : CoordinateSystem -> String
coordinateSystemToString coordinateSystem =
    case coordinateSystem of
        CoordinateSystemUserSpaceOnUse ->
            "userSpaceOnUse"

        CoordinateSystemObjectBoundingBox ->
            "objectBoundingBox"


type CoordinateSystem
    = CoordinateSystemUserSpaceOnUse
    | CoordinateSystemObjectBoundingBox


{-| Defines the distance from the origin to the top of accent characters,
    measured by a distance within the font coordinate system.

    Used by Elements: fontFace

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/accent-height
-}
accentHeight : number -> Attribute a
accentHeight height =
    Attr.accentHeight (toString height)


{-| Defines a simple acceleration of time for the element. Element time will
    accelerate from a rate of 0 at the beginning up to a run rate, over the
    course of the specified proportion of the simple duration.

    The default value is 0 (no acceleration).

    Legal values for `rate` are floating point values between 0 and 1
    (inclusive).

    See https://www.w3.org/TR/smil/smil-timemanip.html#TimeManip-accelerateSyntax
-}
accelerate : number -> Attribute a
accelerate rate =
    Attr.accelerate (toString rate)


{-| This attribute controls whether or not the animation is cumulative.

    It is useful for repeated animations to build upon the previous results,
    accumulating with each iteration.

    Used by Elements: animate, animateColor, animateMotion, animateTransform

    See https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/accumulate
-}
accumulate : AccumulateOption -> Attribute a
accumulate option =
    Attr.accumulate <|
        case option of
            AccumulateNone ->
                "none"

            AccumulateSum ->
                "sum"


type AccumulateOption
    = AccumulateNone
    | AccumulateSum


{-| This attribute controls whether or not the animation is additive.

    It is frequently useful to define animation as an offset or delta to an
    attribute's value, rather than as absolute values.

    Used by Elements: animate, animateColor, animateMotion, animateTransform

    See https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/additive
-}
additive : AdditiveOption -> Attribute a
additive option =
    Attr.additive <|
        case option of
            AdditiveNone ->
                "none"

            AdditiveReplace ->
                "replace"


type AdditiveOption
    = AdditiveNone
    | AdditiveReplace


{-| This attribute defines the maximum unaccented depth of the font within the
    font coordinate system.

    If the attribute is not specified, the effect is as if the attribute were
    set to the vert-origin-y value for the corresponding font.

    Used by Elements: fontFace

    See https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/ascent
-}
ascent : number -> Attribute a
ascent maxDepth =
    Attr.ascent (toString maxDepth)


{-| This attribute indicates the name of the attribute in the parent element
    that is going to be changed during an animation.

    Used by Elements: animate, animateColor, animateTransform, set

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/attributeName
-}
attributeName : String -> Attribute a
attributeName name =
    Attr.attributeName name


{-| This attribute specifies the namespace in which the target attribute and its
    associated values are defined.

    Used by Elements: animate, animateColor, animateTransform, set

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/attributeType
-}
attributeType : AttributeTypeOption -> Attribute a
attributeType option =
    Attr.attributeType <|
        case option of
            AttributeTypeAuto ->
                "auto"

            AttributeTypeCss ->
                "CSS"

            AttributeTypeXml ->
                "XML"


type AttributeTypeOption
    = AttributeTypeAuto
    | AttributeTypeCss
    | AttributeTypeXml


{-|
    The azimuth attribute represents the direction angle of the light source on
    the XY plane (clockwise), in degrees from the x axis.

    If the attribute is not specified, then the effect is as if a value of 0
    were specified.

    Used by Elements: feDistantLight

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/azimuth
-}
azimuth : number -> Attribute a
azimuth angle =
    Attr.azimuth (toString angle)


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
baseFrequency : number -> number -> Attribute a
baseFrequency xFrequency yFrequency =
    Attr.baseFrequency <| (toString xFrequency) ++ " " ++ (toString yFrequency)


{-|
    This attribute defines when an animation should begin.

    Each individual value can be one of the BeginValue types.

    Used by Elements: animate, animateColor, animateMotion, animateTransform,
        discard, mpath, set

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/begin
    See: https://www.w3.org/TR/2001/REC-smil-animation-20010904/#Timing-EvaluationOfBeginEndTimeLists
-}
begin : List TimingValue -> Attribute a
begin timingValues =
    Attr.begin <| String.join ";" (List.map timingValueAsString timingValues)


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
bias : number -> Attribute a
bias rangeShift =
    Attr.bias (toString rangeShift)


{-|
    This attribute specifies the interpolation mode for an animation. The
    default mode is linear, however if the attribute does not support linear
    interpolation (e.g. for strings), the calcMode attribute is ignored and
    discrete interpolation is used.

    Used by Elements: animate, animateColor, animateMotion, animateTransform

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/calcMode
-}
calcMode : CalcModeOption -> Attribute a
calcMode option =
    Attr.calcMode <|
        case option of
            CalcModeDiscrete ->
                "discrete"

            CalcModeLinear ->
                "linear"

            CalcModePaced ->
                "paced"

            CalcModeSpline ->
                "spline"


type CalcModeOption
    = CalcModeDiscrete
    | CalcModeLinear
    | CalcModePaced
    | CalcModeSpline


{-|
    Assigns a class name or set of class names to an element. You can use this
    to style SVG content using CSS.

    An element's class name serves two key roles:

    - As a style sheet selector, for when an author assigns style information to a set of elements.
    - For general use by the browser.

    Used by Elements: a, altGlyph, circle, clipPath, defs, desc, ellipse,
        feBlend, feColorMatrix, feComponentTransfer, feComposite,
        feConvolveMatrix, feDiffuseLighting, feDisplacementMap, feFlood,
        feGaussianBlur, feImage, feMerge, feMorphology, feOffset,
        feSpecularLighting, feTile, feTurbulence, filter, font, foreignObject,
        g, glyph, glyphRef, image, line, linearGradient, marker, mask,
        missingGlyph, path, pattern, polygon, polyline, radialGradient, rect,
        stop, svg, switch, symbol, text, textPath, title, tref, tspan, use

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/class
-}
class : List String -> Attribute a
class names =
    Attr.class (String.join " " names)


{-|
    The clip attribute has the same parameter values as defined for the css clip
    property. Unitless values, which indicate current user coordinates, are
    permitted on the coordinate values on the <shape>. The value of auto defines
    a clipping path along the bounds of the viewport created by the given
    element.

    As a presentation attribute, it also can be used as a property directly
    inside a CSS stylesheet, see css clip for further information.

    Used by Elements: svg, symbol, image, foreignobject, pattern, marker

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/clip
-}
clip : ClipOption -> Attribute a
clip option =
    Attr.clip <|
        case option of
            ClipAuto ->
                "auto"

            ClipInherit ->
                "inherit"

            ClipShape top right bottom left ->
                "rect("
                    ++ (toString top)
                    ++ " "
                    ++ (toString right)
                    ++ " "
                    ++ (toString bottom)
                    ++ " "
                    ++ (toString left)
                    ++ ")"


type ClipOption
    = ClipAuto
    | ClipInherit
    | ClipShape Length Length Length Length


{-|
    The clipPathUnits attribute defines the coordinate system for the contents
    of the clipPath element.

    If the clipPathUnits attribute is not specified, then the effect is as if
    a value of userSpaceOnUse were specified.

    Note that values defined as a percentage inside the content of the clipPath
    are not affected by this attribute. It means that even if you set the value
    of maskContentUnits to objectBoundingBox, percentage values will be
    calculated as if the value of the attribute were userSpaceOnUse.

    Used by Elements: clipPath

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/clipPathUnits
-}
clipPathUnits : CoordinateSystem -> Attribute a
clipPathUnits coordinateSystem =
    Attr.clipPathUnits <| coordinateSystemToString coordinateSystem


{-|
    The contentScriptType attribute on the <svg> element specifies the default
    scripting language for the given document fragment.

    This attribute sets the default scripting language used to process the value
    strings in event attributes. This language must be used for all instances of
    scripts that do not specify their own scripting language. The value
    contentType specifies a media type, per MIME Part Two: Media Types
    [RFC2046]. The default value is application/ecmascript.

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/contentScriptType
-}
contentScriptType : String -> Attribute a
contentScriptType mimeType =
    Attr.contentScriptType mimeType


{-|
    This attribute specifies the style sheet language for the given document
    fragment. The contentStyleType is specified on the <svg> element. By
    default, if it's not defined, the value is "text/css"

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/contentStyleType
-}
contentStyleType : String -> Attribute a
contentStyleType styleSheetLanguage =
    Attr.contentStyleType styleSheetLanguage


{-|
    This attribute defines a path to follow.

    NOTE: You probably want to import the "folkertdev/svg-path-dsl" package for
        access to a more Elm-like way of expressing paths. For instance:

        [ path
            [ d (pathToString [
                subpath
                    (startAt (10, 10))
                    open
                    [ cubicTo
                        (10, 50)
                        (90, 50)
                        (90, 90)
                    ]
                ])
            , stroke Color.black
            , strokeWidth 3.5
            , noFill
            ]
            []

    Used by Elements: path

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/d
-}
d : String -> Attribute a
d =
    Attr.d


{-|
    The diffuseConstant attribute represant the kd value in the Phong lighting
    model. In SVG, this can be any non-negative number.

    If the attribute is not specified, then the effect is as if a value of 1
    were specified.

    Used by Elements: feDiffuseLighting

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/diffuseConstant
-}
diffuseConstant : number -> Attribute a
diffuseConstant kdValue =
    Attr.diffuseConstant kdValue


{-|
    After applying the kernelMatrix of the feConvolveMatrix element to the input
    image to yield a number, that number is divided by the value given to the
    divisor attribute to yield the final destination color value. A divisor that
    is the sum of all the matrix values tends to have an evening effect on the
    overall color intensity of the result.

    The default value is the sum of all values in kernelMatrix, with the
    exception that if the sum is zero, then the divisor is set to 1.

    It is an error to specify a divisor of zero.

    Used by Elements:

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/divisor
-}
divisor : number -> Attribute a
divisor value =
    Attr.divisor (toString value)


{-|
    This attribute indicates the simple duration of the animation.

    Used by Elements: animate, animateColor, animateMotion, animateTransform,
        discard, mpath, set

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/dur
-}
dur : DurationValue -> Attribute a
dur duration =
    Attr.dur <|
        case duration of
            Duration clockValue ->
                clockValue

            DurationIndefinite ->
                "indefinite"


type DurationValue
    = Duration ClockValue
    | DurationIndefinite


{-|
    The edgeMode attribute determines how to extend the input image as necessary
    with color values so that the matrix operations can be applied when the
    kernel is positioned at or near the edge of the input image.

    Used by Elements: feConvolveMatrix

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/edgeMode
-}
edgeMode : EdgeModeOption -> Attribute a
edgeMode option =
    Attr.edgeMode <|
        case option of
            EdgeModeDuplicate ->
                "duplicate"

            EdgeModeWrap ->
                "wrap"

            EdgeModeNone ->
                "none"


type EdgeModeOption
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
elevation : number -> Attribute a
elevation angle =
    Attr.elevation (toString angle)


{-|
    This attribute defines an end value for the animation that can constrain
    the active duration.

    Each value can be of the same type as the ones defined for the begin
    attribute.

    Used by Elements: animate, animateColor, animateMotion, animateTransform,
        discard, mpath, set

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/end
-}
end : List TimingValue -> Attribute a
end timingValues =
    Attr.end <| String.join ";" (List.map timingValueAsString timingValues)


{-|
    The externalResourcesRequired attribute is available on all container
    elements and to all elements which potentially can reference external
    resources. It specifies whether referenced resources that are not part of
    the current document are required for proper rendering of the given
    container element or graphics element.

    Used by Elements: a, altGlyph, altGlyphDef, altGlyphItem, animate,
        animateColor, animateMotion, animateTransform, circle, clipPath, cursor,
        discard, defs, ellipse, feImage, filter, font, foreignObject, g, glyph,
        glyphRef, image, line, linearGradient, mesh, meshGradient, marker, mask,
        mpath, path, pattern, polygon, polyline, radialGradient, rect, script,
        set, stop, svg, switch, symbol, text, textPath, tref, tspan, use, view

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/externalResourcesRequired
-}
externalResourcesRequired : Bool -> Attribute a
externalResourcesRequired bool =
    Attr.externalResourcesRequired <|
        case bool of
            True ->
                "true"

            False ->
                "false"


{-|
    A <filter> element can define a region to which a given filter effect
    applies and can provide a resolution for any intermediate continuous tone
    images used to process any raster-based filter primitives.

    NOTE: Obsolete.

    Used by Elements: filter

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/filterRes
-}
filterRes : number -> number -> Attribute a
filterRes xPixels yPixels =
    Attr.filterRes <| (toString xPixels) ++ " " (toString yPixels)


{-|
    The filterUnits attribute defines the coordinate system for attributes x, y,
    width and height.

    Used by Elements: filter

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/filterUnits
-}
filterUnits : CoordinateSystem -> Attribute a
filterUnits coordinateSystem =
    Attr.filterUnits <| coordinateSystemToString coordinateSystem


{-|
    This attribute indicates the initial value of the attribute that will be
    modified during the animation. When used with the `to` attribute, the
    animation will change the modified attribute from the from value to the to
    value.

    Used by Elements: animate, animateColor, animateMotion, animateTransform

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/from
-}
from : number -> Attribute a
from value =
    Attr.from (toString value)


{-|
    The gradientTransform attribute contains the definition of an optional
    additional transformation from the gradient coordinate system onto the
    target coordinate system (i.e., userSpaceOnUse or objectBoundingBox). This
    allows for things such as skewing the gradient. This additional
    transformation matrix is post-multiplied to (i.e., inserted to the right of)
    any previously defined transformations, including the implicit
    transformation necessary to convert from object bounding box units to user
    space.

    Used by Elements: linearGradient, radialGradient

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/gradientTransform
-}
gradientTransform : List Transform -> Attribute a
gradientTransform transforms =
    String.join " " (List.map transformToString transforms)


{-|
    The gradientUnits attribute defines the coordinate system for attributes
    x1, y1, x2 and y2 on the `linearGradient` element or for attributes cx, cy,
    r, fx, and fy on the `radialGradient`.

    If the `gradientUnits` attribute isn't specified, then the effect is as if a
    value of CoordinateSystemObjectBoundingBox were specified.

    Used by Elements: linearGradient, radialGradient

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/gradientUnits
-}
gradientUnits : CoordinateSystem -> Attribute a
gradientUnits coordinateSystem =
    Attr.gradientUnits <| coordinateSystemToString coordinateSystem


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
in_ : InValue -> Attribute a
in_ value =
    Attr.in_ <|
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


type InValue
    = InSourceGraphic
    | InSourceAlpha
    | InBackgroundAlpha
    | InFillPaint
    | InStrokePaint
    | InReference String


{-|
    The k1 attribute defines one of the values to be used within the arithmetic
    operation of the `feComposite` filter primitive.

    If this attribute is not set, its default value is 0.

    Used by Elements: feComposite

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/k1
-}
k1 : number -> Attribute a
k1 value =
    Attr.k1 (toString value)


{-|
    The k2 attribute defines one of the values to be used within the arithmetic
    operation of the `feComposite` filter primitive.

    If this attribute is not set, its default value is 0.

    Used by Elements: feComposite

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/k2
-}
k2 : number -> Attribute a
k2 value =
    Attr.k2 (toString value)


{-|
    The k3 attribute defines one of the values to be used within the arithmetic
    operation of the `feComposite` filter primitive.

    If this attribute is not set, its default value is 0.

    Used by Elements: feComposite

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/k3
-}
k3 : number -> Attribute a
k3 value =
    Attr.k3 (toString value)


{-|
    The k4 attribute defines one of the values to be used within the arithmetic
    operation of the `feComposite` filter primitive.

    If this attribute is not set, its default value is 0.

    Used by Elements: feComposite

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/k4
-}
k4 : number -> Attribute a
k4 value =
    Attr.k4 (toString value)


{-|
    The `order` attribute defines the list of numbers that makes up the kernel
    matrix for the `feConvolveMatrix` element.

    The number of entries in the list must be equal to `orderX` x `orderY`, as
    defined in the `order` attribute.

    Used by Elements: feConvolveMatrix

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/kernelMatrix
-}
kernelMatrix : List number -> Attribute a
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
kernelUnitLength : number -> number -> Attribute a
kernelUnitLength dx dy =
    Attr.kernelUnitLength <| (toString dx) ++ " " ++ (toString dy)


{-|
    The kerning attribute indicates whether the browser should adjust
    inter-glyph spacing based on kerning tables that are included in the
    relevant font (i.e., enable auto-kerning) or instead disable auto-kerning
    and instead set inter-character spacing to a specific length (typically,
    zero).

    The value of auto indicates that the user agent should adjust inter-glyph
    spacing based on kerning tables that are included in the font that will be
    used.

    If a <length> is provided, then auto-kerning is disabled. Instead,
    inter-character spacing is set to the given <length>. The most common
    scenario, other than auto, is to set kerning to a value of 0 so that
    auto-kerning is disabled.

    If a <length> is provided without a unit identifier (e.g., an unqualified
    number such as 128), the browser processes the <length> as a width value in
    the current user coordinate system.

    If a <length> is provided with a unit identifier (e.g., .25em or 1%), then
    the browser converts the <length> into a corresponding value in the current
    user coordinate system.

    When a <length> is provided, its value is added to the inter-character
    spacing value specified by the letter-spacing attribute.

    As a presentation attribute, it also can be used as a property directly
    inside a CSS stylesheet, see css kerning for further information.

    Used by Elements: altGlyph, altGlyphDef, glyph, glyphRef, textPath,
        text, tref, tspan

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/kerning
-}
kerning : KerningOption -> Attribute a
kerning option =
    Attr.kerning <|
        case option of
            KerningAuto ->
                "auto"

            KerningInherit ->
                "inherit"

            KerningLength length ->
                lengthToString length


type KerningOption
    = KerningAuto
    | KerningInherit
    | KerningLength Length


{-|
    Template

    Used by Elements:

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/
-}
svgBox : ( number, number ) -> List (Svg msg) -> Html msg
svgBox ( width, height ) =
    svg [ viewBox 0 0 800 600 ]


viewBox : number -> number -> number -> number -> Attribute a
viewBox minX minY width height =
    [ minX, minY, width, height ]
        |> List.map toString
        |> String.join " "
        |> Attr.viewBox


stroke : Color -> Attribute a
stroke color =
    Attr.stroke (colorToCssRgba color)


fill : Color -> Attribute a
fill color =
    Attr.fill (colorToCssRgba color)


noFill : Attribute a
noFill =
    fill (Color.rgba 0 0 0 0.0)


{-| An empty list will set `font-family: inherit`
-}
fontFamily : List String -> Attribute a
fontFamily families =
    case families of
        [] ->
            Attr.fontFamily "inherit"

        _ ->
            Attr.fontFamily (String.join ", " families)


type AnchorAlignment
    = AnchorInherit
    | AnchorStart
    | AnchorMiddle
    | AnchorEnd


textAnchor : AnchorAlignment -> Attribute a
textAnchor alignment =
    Attr.textAnchor <|
        case alignment of
            AnchorInherit ->
                "inherit"

            AnchorStart ->
                "start"

            AnchorMiddle ->
                "middle"

            AnchorEnd ->
                "end"



{- Attributes that express Lengths -}


cx : Length -> Attribute a
cx length =
    Attr.cx <| lengthToString length


cy : Length -> Attribute a
cy length =
    Attr.cy <| lengthToString length


dx : Length -> Attribute a
dx length =
    Attr.dx <| lengthToString length


dy : Length -> Attribute a
dy length =
    Attr.dy <| lengthToString length


fontSize : Length -> Attribute a
fontSize length =
    Attr.fontSize <| lengthToString length


{-|
    For the `radialGradient` element, this attribute defines the x-axis
    coordinate of the focal point for the radial gradient.

    If the attribute is not specified, it's assumed to be at the same place as
    the center point.

    Used by Elements: radialGradient

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/
-}
fx : Length -> Attribute a
fx length =
    Attr.fx <| lengthToString length


{-|
    For the `radialGradient` element, this attribute defines the y-axis
    coordinate of the focal point for the radial gradient.

    If the attribute is not specified, it's assumed to be at the same place as
    the center point.

    Used by Elements: radialGradient

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/
-}
fy : Length -> Attribute a
fy length =
    Attr.fy <| lengthToString length


rx : Length -> Attribute a
rx length =
    Attr.rx <| lengthToString length


ry : Length -> Attribute a
ry length =
    Attr.ry <| lengthToString length


r : Length -> Attribute a
r length =
    Attr.r <| lengthToString length


strokeWidth : Length -> Attribute a
strokeWidth length =
    Attr.strokeWidth <| lengthToString length


width : Length -> Attribute a
width length =
    Attr.width <| lengthToString length


height : Length -> Attribute a
height length =
    Attr.height <| lengthToString length


x : Length -> Attribute a
x length =
    Attr.x <| lengthToString length


y : Length -> Attribute a
y length =
    Attr.y <| lengthToString length
