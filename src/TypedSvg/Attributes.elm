module TypedSvg.Attributes
    exposing
        ( AccumulateOption(..)
        , AdditiveOption(..)
        , AttributeTypeOption(..)
        , BezierAnchorPoint
        , CalcModeOption(..)
        , ClipOption(..)
        , ColorInterpolation(..)
        , CoordinateSystem(..)
        , Cursor(..)
        , Direction(..)
        , DurationValue(..)
        , EdgeModeOption(..)
        , LengthAdjustOption(..)
        , MarkerCoordinateSystem(..)
        , ModeOption(..)
        , ShapeRenderingOption(..)
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
        , compositeOperator
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
          -- , local
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
        , morphologyOperator
        , numOctaves
          -- , offset
          -- , operator -- see compositeOperator, morphologyOperator
        , order
          -- , orient
          -- , orientation
          -- , origin
        , overlinePosition
        , overlineThickness
          -- , panose1
          -- , path
        , pathLength
        , patternContentUnits
        , patternTransform
        , patternUnits
          -- , pointOrder
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
          -- , specularConstant
          -- , specularExponent
          -- , speed
          -- , spreadMethod
          -- , startOffset
          -- , stdDeviation
          -- , stemh
          -- , stemv
          -- , stitchTiles
          -- , strikethroughPosition
          -- , strikethroughThickness
          -- , string
        , style
        , surfaceScale
          -- , systemLanguage
          -- , tableValues
          -- , target
        , targetX
        , targetY
        , textLength
          -- , title
        , to
        , transform
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
        , version
          -- , vertAdvY
          -- , vertOriginX
          -- , vertOriginY
        , viewBox
          -- , viewTarget
          -- , widths
          -- , xChannelSelector
          -- , xlinkActuate
          -- , xlinkArcrole
          -- , xlinkRole
        , xlinkShow
        , xlinkTitle
          -- , xlinkType
          -- , xmlBase
          -- , yChannelSelector
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
        , x1
        , y1
        , x2
        , y2
          --
          {--Presentation Attributes-}
        , alignmentBaseline
        , baselineShift
        , clipPath
        , clipRule
        , clip
        , colorInterpolationFilters
        , colorInterpolation
        , colorProfile
        , colorRendering
        , color
        , cursor
        , direction
        , display
        , dominantBaseline
        , enableBackground
        , fillOpacity
        , fillRule
        , fill
        , filter
        , floodColor
        , floodOpacity
        , fontFamily
        , fontSizeAdjust
        , fontSize
        , fontStretch
        , fontStyle
        , fontVariant
        , fontWeight
        , glyphOrientationHorizontal
        , glyphOrientationVertical
        , imageRendering
        , kerning
        , letterSpacing
        , lightingColor
        , markerEnd
        , markerMid
        , markerStart
        , mask
        , opacity
        , overflow
        , pointerEvents
        , shapeRendering
        , stopColor
        , stopOpacity
        , strokeDasharray
        , strokeDashoffset
        , strokeLinecap
        , strokeLinejoin
        , strokeMiterlimit
        , strokeOpacity
        , strokeWidth
        , stroke
        , textAnchor
        , textDecoration
        , textRendering
        , unicodeBidi
        , visibility
        , wordSpacing
        , writingMode
        )

import Color exposing (Color)
import Color.Convert exposing (colorToCssRgba)
import Html exposing (Html)
import Html.Attributes exposing (name)
import Svg exposing (Attribute, Svg)
import Svg.Attributes as Attr exposing (colorInterpolationFilters)
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
                tr "matrix" [ a, b, c, d, e, f ]

            Rotate a x y ->
                tr "rotate" [ a, x, y ]

            Scale x y ->
                tr "scale" [ x, y ]

            SkewX x ->
                tr "skewX" [ x ]

            SkewY y ->
                tr "skewY" [ y ]

            Translate x y ->
                tr "translate" [ x, y ]


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


boolToString : Bool -> String
boolToString bool =
    case bool of
        True ->
            "true"

        False ->
            "false"


{-| Defines the distance from the origin to the top of accent characters,
    measured by a distance within the font coordinate system.

    Used by Elements: fontFace

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/accent-height
-}
accentHeight : number -> Attribute a
accentHeight height =
    Attr.accentHeight <| toString height


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
    Attr.accelerate <| toString rate


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


{-|
    The alignmentBaseline attribute specifies how an object is aligned with
    respect to its parent. This property specifies which baseline of this
    element is to be aligned with the corresponding baseline of the parent. For
    example, this allows alphabetic baselines in Roman text to stay aligned
    across font size changes.

    It defaults to the baseline with the same name as the computed value of the
    alignmentBaseline property.

    As a presentation attribute, it also can be used as a property directly
    inside a CSS stylesheet, see css alignmentBaseline for further information.

    Used by Elements: altGlyph, tspan, tref, textPath

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/alignmentBaseline
-}
alignmentBaseline : AlignmentBaseline -> Attribute a
alignmentBaseline alignmentBaseline =
    Attr.alignmentBaseline <|
        case alignmentBaseline of
            AlignmentAuto ->
                "auto"

            AlignmentBaseline ->
                "baseline"

            AlignmentBeforeEdge ->
                "before-edge"

            AlignmentTextBeforeEdge ->
                "text-before-edge"

            AlignmentMiddle ->
                "middle"

            AlignmentCentral ->
                "central"

            AlignmentAfterEdge ->
                "after-edge"

            AlignmentTextAfterEdge ->
                "text-after-edge"

            AlignmentIdeographic ->
                "ideographic"

            AlignmentAlphabetic ->
                "alphabetic"

            AlignmentHanging ->
                "hanging"

            AlignmentMathematical ->
                "mathematical"

            AlignmentInherit ->
                "inherit"


type AlignmentBaseline
    = AlignmentAuto
    | AlignmentBaseline
    | AlignmentBeforeEdge
    | AlignmentTextBeforeEdge
    | AlignmentMiddle
    | AlignmentCentral
    | AlignmentAfterEdge
    | AlignmentTextAfterEdge
    | AlignmentIdeographic
    | AlignmentAlphabetic
    | AlignmentHanging
    | AlignmentMathematical
    | AlignmentInherit


{-| This attribute defines the maximum unaccented depth of the font within the
    font coordinate system.

    If the attribute is not specified, the effect is as if the attribute were
    set to the vert-origin-y value for the corresponding font.

    Used by Elements: fontFace

    See https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/ascent
-}
ascent : number -> Attribute a
ascent maxDepth =
    Attr.ascent <| toString maxDepth


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
    The baselineShift attribute allows repositioning of the dominant-baseline
    relative to the dominant-baseline of the parent text content element. The
    shifted object might be a sub- or superscript.

    As a presentation attribute, it also can be used as a property directly
    inside a CSS stylesheet, see css baseline-shift for further information.

    Used by Elements: altGlyph, tref, tspan, textPath

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/baselineShift
-}
baselineShift : BaselineShift -> Attribute a
baselineShift baselineShift =
    Attr.baselineShift <|
        case baselineShift of
            ShiftAuto ->
                "auto"

            ShiftBaseline ->
                "baseline"

            ShiftSuper ->
                "super"

            ShiftSub ->
                "sub"

            ShiftPercentage value ->
                (toString value) ++ "%"

            ShiftLength length ->
                (lengthToString length)

            ShiftInherit ->
                "inherit"


type BaselineShift
    = ShiftAuto
    | ShiftBaseline
    | ShiftSuper
    | ShiftSub
    | ShiftPercentage Float
    | ShiftLength Length
    | ShiftInherit


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

    - As a style sheet selector, for when an author assigns style information
      to a set of elements.
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
    The `clipPath` attribute binds the element it is applied to with a given
    `clipPath` element.

    As a presentation attribute, it also can be used as a property directly
    inside a CSS stylesheet.

    Used by Elements: a, circle, defs, ellipse, g, image, line, marker, mask,
        mesh, missing-glyph, path, pattern, polygon, polyline, rect, svg,
        switch, symbol, text, use

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/clip-path
-}
clipPath : ClipPath -> Attribute a
clipPath clipPath =
    Attr.clipPath <|
        case clipPath of
            ClipPathNone ->
                "none"

            ClipPathInherit ->
                "inherit"

            ClipPathFunc value ->
                value


type ClipPath
    = ClipPathNone
    | ClipPathInherit
    | ClipPathFunc String


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
    The `clipRule` attribute only applies to graphics elements that are
    contained within a `clipPath` element. The `clipRule` attribute basically
    works as the `fillRule` attribute, except that it applies to `clipPath`
    definitions.

    Used by Elements: circle, ellipse, image, line, mesh, path, polygon,
        polyline, rect, text, use

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/clip-rule
-}
clipRule : ClipRule -> Attribute a
clipRule clipRule =
    Attr.clipRule <|
        case clipRule of
            ClipRuleNonZero ->
                "nonzero"

            ClipRuleEvenOdd ->
                "evenodd"

            ClipRuleInherit ->
                "inherit"


type ClipRule
    = ClipRuleNonZero
    | ClipRuleEvenOdd
    | ClipRuleInherit


{-|
    The `colorInterpolation` attribute specifies the color space for gradient
    interpolations, color animations, and alpha compositing.

    When a child element is blended into a background, the value of the
    `colorInterpolation` attribute on the child determines the type of blending,
    not the value of the `colorInterpolation` on the parent.

    For gradients which make use of the `xlinkHref` attribute to reference
    another gradient, the gradient uses the `colorInterpolation` attribute value
    from the gradient element which is directly referenced by the fill or stroke
    attribute.

    When animating colors, color interpolation is performed according to the
    value of the `colorInterpolation` attribute on the element being animated.

    As a presentation attribute, it also can be used as a property directly
    inside a CSS stylesheet.

    Used by Elements: a, animage, animateColor, circle, defs, ellipse, g, image,
        line, marker, mask, mesh, missing-glyph, path, pattern, polygon,
        polyline, rect, svg, switch, symbol, text, use

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/color-interpolation
-}
colorInterpolation : ColorInterpolation -> Attribute a
colorInterpolation colorInterpolation =
    Attr.colorInterpolation <| colorInterpolationToString colorInterpolation


type ColorInterpolation
    = ColorInterpolationAuto
    | ColorInterpolationSRGB
    | ColorInterpolationLinearRGB
    | ColorInterpolationInherit


colorInterpolationToString : ColorInterpolation -> String
colorInterpolationToString colorInterpolation =
    case colorInterpolation of
        ColorInterpolationAuto ->
            "auto"

        ColorInterpolationSRGB ->
            "sRGB"

        ColorInterpolationLinearRGB ->
            "linearRGB"

        ColorInterpolationInherit ->
            "inherit"


{-|
    The `colorProfile` attribute is used to define which color profile a raster
    image included through the `image` element should use.

    As a presentation attribute, it also can be used as a property directly
    inside a CSS stylesheet.

    Used by Elements: image

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/color-profile
-}
colorProfile : ColorProfile -> Attribute a
colorProfile colorProfile =
    Attr.colorProfile <|
        case colorProfile of
            ColorProfileAuto ->
                "auto"

            ColorProfileSRGB ->
                "sRGB"

            ColorProfile name ->
                name

            ColorProfileInherit ->
                "inherit"


type ColorProfile
    = ColorProfileAuto
    | ColorProfileSRGB
    | ColorProfile String
    | ColorProfileInherit


{-|
    The colorRendering attribute provides a hint to the SVG user agent about
    how to optimize its color interpolation and compositing operations.

    `colorRendering` takes precedence over `colorInterpolationFilters`. For
    example, assume `colorRendering` is set to `optimizeSpeed`, and
    `ColorInterpolationFilters` is set to `linearRGB`. In this case, the SVG
    user agent should perform color operations in a way that optimizes
    performance, which might mean sacrificing the color interpolation precision
    as specified by `colorInterpolationFilters`.

    As a presentation attribute, it also can be used as a property directly
    inside a CSS stylesheet.

    Used by Elements: a, animate, animateColor, circle, defs, ellipse, g, image,
        line, marker, mask, mesh, missing-glyph, path, pattern, polygon,
        polyline, rect, svg, switch, symbol, text, use

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/color-rendering
-}
colorRendering : ColorRendering -> Attribute a
colorRendering colorRendering =
    Attr.colorRendering <|
        case colorRendering of
            ColorRenderingAuto ->
                "auto"

            ColorRenderingOptimizeSpeed ->
                "optimizeSpeed"

            ColorRenderingOptimizeQuality ->
                "optimizeQuality"

            ColorRenderingInherit ->
                "inherit"


type ColorRendering
    = ColorRenderingAuto
    | ColorRenderingOptimizeSpeed
    | ColorRenderingOptimizeQuality
    | ColorRenderingInherit


{-|
    The `color` attribute is used to provide a potential indirect value
    (currentColor) for the fill, stroke, stopColor, floodColor and
    lightingColor attributes.

    As a presentation attribute, it can also be used as a property directly
    inside a CSS stylesheet.

    Used by Elements: altGlyph, altGlyphDef, altGlyphItem, circle, ellipse,
        feDiffuseLighting, feFlood, feSpecularLighting, glyph, glyphRef, line,
        mesh, path, polygon, polyline, rect, stop, text, textPath, tref, tspan

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/color
-}
color : Color -> Attribute a
color c =
    Attr.color <| colorToCssRgba c


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
    The `cursor` attribute specifies the mouse cursor displayed when the mouse
    pointer is over an element.

    This attribute behaves exactly like the css cursor property except that if
    the browser supports the `cursor` element, you should be able to use it
    with the `funcIRI` notation.

    As a presentation attribute, it also can be used as a property directly
    inside a CSS stylesheet.

    Used by Elements: a, circle, defs, ellipse, g, image, line, marker, mask,
        mesh, missing-glyph, path, pattern, polygon, polyline, rect, svg,
        switch, symbol, text, use

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/cursor
-}
cursor : Cursor -> Attribute a
cursor c =
    Attr.cursor <|
        case c of
            CursorAuto ->
                "auto"

            CursorDefault ->
                "default"

            CursorCrosshair ->
                "crosshair"

            CursorPointer ->
                "pointer"

            CursorMove ->
                "move"

            CursorEResize ->
                "e-resize"

            CursorNEResize ->
                "ne-resize"

            CursorNWResize ->
                "nw-resize"

            CursorNResize ->
                "n-resize"

            CursorSEResize ->
                "se-resize"

            CursorSWResize ->
                "sw-resize"

            CursorWResize ->
                "w-resize"

            CursorText ->
                "text"

            CursorWait ->
                "wait"

            CursorHelp ->
                "help"

            CursorInherit ->
                "inherit"

            Cursor funcIRI ->
                funcIRI


type Cursor
    = CursorAuto
    | CursorDefault
    | CursorCrosshair
    | CursorPointer
    | CursorMove
    | CursorEResize
    | CursorNEResize
    | CursorNWResize
    | CursorNResize
    | CursorSEResize
    | CursorSWResize
    | CursorWResize
    | CursorText
    | CursorWait
    | CursorHelp
    | CursorInherit
    | Cursor String


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
    The `direction` attribute specifies the base writing direction of text and
    the direction of embeddings and overrides for the Unicode bidirectional
    algorithm.

    For the direction attribute to have any effect on an element that does not
    by itself establish a new text chunk (such as a `tspan` element without
    absolute position adjustments due to `x` or `y` attributes), the
    unicode-bidi property's value must be `embed` or `bidiOverride`.

    The `direction` attribute applies only to glyphs oriented perpendicular to
    the `inlineProgressionDirection`, which includes the usual case of
    horizontally-oriented Latin or Arabic text and the case of narrow-cell
    Latin or Arabic characters rotated 90 degrees clockwise relative to a
    top-to-bottom inline-progression-direction.

    As a presentation attribute, it also can be used as a property directly
    inside a CSS stylesheet.

    Used by Elements: altGlyph, altGlyphDef, altGlyphItem, glyph, glyphRef,
        text, textPath, tref, tspan

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/direction
-}
direction : Direction -> Attribute a
direction dir =
    Attr.direction <|
        case dir of
            DirectionLTR ->
                "ltr"

            DirectionRTL ->
                "rtl"

            DirectionInherit ->
                "inherit"


type Direction
    = DirectionLTR
    | DirectionRTL
    | DirectionInherit


{-|
    The `display` attribute lets you control the rendering of graphical or
    container elements. It is similar to the CSS "display" attribute (e.g.
    display: "none", "block", etc.)

    As a presentation attribute, it also can be used as a property directly
    inside a CSS stylesheet.

    Used by Elements: a, altGlyph, altGlyphDef, altGlyphItem, circle, ellipse,
        foreignobject, g, glyph, glyphRef, image, line, mesh, path, polygon,
        polyline, rect, svg, switch, text, text, textPath, tref, tspan, use

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/display
-}
display : Display -> Attribute a
display d =
    Attr.display <|
        case d of
            DisplayInline ->
                "inline"

            DisplayBlock ->
                "block"

            DisplayListItem ->
                "list-item"

            DisplayRunIn ->
                "run-in"

            DisplayCompact ->
                "compact"

            DisplayMarker ->
                "marker"

            DisplayTable ->
                "table"

            DisplayInlineTable ->
                "inline-table"

            DisplayTableRowGroup ->
                "table-row-group"

            DisplayTableHeaderGroup ->
                "table-header-group"

            DisplayTableFooterGroup ->
                "table-footer-group"

            DisplayTableRow ->
                "table-row"

            DisplayTableColumnGroup ->
                "table-column-group"

            DisplayTableColumn ->
                "table-column"

            DisplayTableCell ->
                "table-cell"

            DisplayTableCaption ->
                "table-caption"

            DisplayNone ->
                "none"

            DisplayInherit ->
                "inherit"


type Display
    = DisplayInline
    | DisplayBlock
    | DisplayListItem
    | DisplayRunIn
    | DisplayCompact
    | DisplayMarker
    | DisplayTable
    | DisplayInlineTable
    | DisplayTableRowGroup
    | DisplayTableHeaderGroup
    | DisplayTableFooterGroup
    | DisplayTableRow
    | DisplayTableColumnGroup
    | DisplayTableColumn
    | DisplayTableCell
    | DisplayTableCaption
    | DisplayNone
    | DisplayInherit


{-|
    This attribute indicates the simple duration of the animation.

    Used by Elements: animate, animateColor, animateMotion, animateTransform,
        discard, mpath, set

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/dur
-}
dur : DurationValue -> Attribute a
dur duration =
    Attr.dur <| durationToString duration


type DurationValue
    = Duration ClockValue
    | DurationIndefinite


durationToString : DurationValue -> String
durationToString duration =
    case duration of
        Duration clockValue ->
            clockValue

        DurationIndefinite ->
            "indefinite"


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
    Attr.externalResourcesRequired <| boolToString bool


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
    Attr.from <| toString value


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
    Attr.gradientTransform <| String.join " " (List.map transformToString transforms)


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
    The keySplines attribute define a set of Bézier control points associated
    with the keyTimes list, defining a cubic Bézier function that controls
    interval pacing.

    Used by Elements: animate, animateColor, animateMotion, animateTransform

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/keySplines
-}
keySplines : List BezierAnchorPoint -> Attribute a
keySplines bezierAnchorPointList =
    Attr.keySplines <| (List.map bezierAnchorPointToString bezierAnchorPointList |> String.join ";")


type alias BezierAnchorPoint =
    ( Float, Float, Float, Float )


bezierAnchorPointToString : ( number, number, number, number ) -> String
bezierAnchorPointToString ( x1, y1, x2, y2 ) =
    List.map toString [ x1, y1, x2, y2 ] |> String.join " "


{-|
    The keyTimes attribute is a semicolon-separated list of time `values` used
    to control the pacing of the animation. Each time in the list corresponds to
    a value in the values attribute list, and defines when the value is used in
    the animation. Each time value in the keyTimes list is specified as a
    floating point value between 0 and 1 (inclusive), representing a
    proportional offset into the duration of the animation element.

    If a list of keyTimes is specified, there must be exactly as many values in
    the keyTimes list as in the values list.

    Each successive time value must be greater than or equal to the preceding
    time value.

    Used by Elements: animate, animateColor, animateMotion, animateTransform

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/keyTimes
-}
keyTimes : List Float -> Attribute a
keyTimes floatList =
    Attr.keyTimes <| (List.map toString floatList |> String.join ";")


{-|
    When an SVG `text` or `tspan` element has a specific length set using the
    textLength attribute, the lengthAdjust attribute controls how the text is
    stretched or compressed into that length.

    The two possible values for the attribute are:

    - LengthAdjustSpacing
    - LengthAdjustSpacingAndGlyphs

    Using LengthAdjustSpacing (the default), the letter forms are preserved,
    but the space between them grows or shrinks.

    Using LengthAdjustSpacingAndGlyphs, the entire text element is stretched in
    the direction of the text.

    Used by Elements: text, tspan

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/lengthAdjust
-}
lengthAdjust : LengthAdjustOption -> Attribute a
lengthAdjust option =
    Attr.lengthAdjust <|
        case option of
            LengthAdjustSpacing ->
                "spacing"

            LengthAdjustSpacingAndGlyphs ->
                "spacingAndGlyphs"


type LengthAdjustOption
    = LengthAdjustSpacing
    | LengthAdjustSpacingAndGlyphs


{-|
    The markerHeight represents the height of the viewport into which the
    `marker` is to be fitted when it is rendered.

    A value of zero disables rendering of the element.

    If the attribute is not specified, the effect is as if a value of 3 were
    specified.

    Used by Elements: marker

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/markerHeight
-}
markerHeight : Length -> Attribute a
markerHeight height =
    Attr.markerHeight <| lengthToString height


{-|
    The `markerUnits` attribute defines the coordinate system for the attributes
    `markerWidth`, `markerHeight` and the contents of the `marker`.

    If the `markerUnits` attribute is not specified, then the effect is as if a
    value of `strokeWidth` were specified.

    Used by Elements: marker

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/markerUnits
-}
markerUnits : MarkerCoordinateSystem -> Attribute a
markerUnits markerCoordinateSystem =
    Attr.markerUnits <|
        case markerCoordinateSystem of
            MarkerCoordinateSystemUserSpaceOnUse ->
                "userSpaceOnUse"

            MarkerCoordinateSystemStrokeWidth ->
                "strokeWidth"


type MarkerCoordinateSystem
    = MarkerCoordinateSystemUserSpaceOnUse
    | MarkerCoordinateSystemStrokeWidth


{-|
    The markerWidth represents the width of the viewport into which the
    `marker` is to be fitted when it is rendered.

    A value of zero disables rendering of the element.

    If the attribute is not specified, the effect is as if a value of 3 were
    specified.

    Used by Elements: marker

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/markerWidth
-}
markerWidth : Length -> Attribute a
markerWidth width =
    Attr.markerWidth <| lengthToString width


{-|
    The maskContentUnits attribute defines the coordinate system for the
    contents of the `mask`.

    If the `maskContentUnits` attribute isn't specified, then the effect is as
    if a value of CoordinateSystemUserSpaceOnUse were specified.

    Note that values defined as a percentage inside the content of the `mask`
    are not affected by this attribute. It means that even if you set the value
    of `maskContentUnits` to CoordinateSystemObjectBoundingBox, percentage
    values will be calculated as if the value of the attribute were
    CoordinateSystemUserSpaceOnUse.

    Used by Elements: mask

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/maskContentUnits
-}
maskContentUnits : CoordinateSystem -> Attribute a
maskContentUnits coordinateSystem =
    Attr.maskContentUnits <| coordinateSystemToString coordinateSystem


{-|
    The `maskUnits` attribute defines the coordinate system for attributes x, y,
    width and height.

    If the `maskUnits` attribute isn't specified, then the effect is as if a
    value of CoordinateSystemObjectBoundingBox were specified.

    Used by Elements: mask

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/maskUnits
-}
maskUnits : CoordinateSystem -> Attribute a
maskUnits coordinateSystem =
    Attr.maskUnits <| coordinateSystemToString coordinateSystem


{-|
    This attribute specifies the maximum value of the active duration.

    The default value for max is 0. This does not constrain the active duration
    at all.

    Used by Elements: animate, animateColor, animateMotion, animateTransform,
        discard, mpath, set

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/max
-}
max : ClockValue -> Attribute a
max clockValue =
    Attr.max <| clockValue


{-|
    This attribute specifies the minimum value of the active duration.

    The default value for max is 0. This does not constrain the active duration
    at all.

    Used by Elements: animate, animateColor, animateMotion, animateTransform,
        discard, mpath, set

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/min
-}
min : ClockValue -> Attribute a
min clockValue =
    Attr.min <| clockValue


{-|
    The `overlinePosition` attribute represents the ideal vertical position of
    the overline. The overline position is expressed in the font's coordinate
    system.

    Used by Elements: fontFace

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/overlinePosition
-}
overlinePosition : number -> Attribute a
overlinePosition position =
    Attr.overlinePosition <| toString position


{-|
    The `overlineThickness` attribute represents the ideal thickness of
    the overline. The overline position is expressed in the font's coordinate
    system.

    Used by Elements: fontFace

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/overlineThickness
-}
overlineThickness : number -> Attribute a
overlineThickness thickness =
    Attr.overlineThickness <| toString thickness


{-|
    This attribute lets the author specify a total length for the path, in user
    units. This value is then used to calibrate the browser's distance
    calculations with those of the author, by scaling all distance computations
    using the ratio pathLength / (computed value of path length).

    Used by Elements: path

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/path
-}
pathLength : number -> Attribute a
pathLength length =
    Attr.pathLength <| toString length


{-|
    The `patternContentUnits` attribute defines the coordinate system for the
    contents of the `pattern`. Note that this attribute has no effect if
    attribute viewBox is specified on the `pattern` element.

    If the `patternContentUnits` attribute isn't specified, then the effect is
    as if a value of CoordinateSystemUserSpaceOnUse were specified.

    Used by Elements: pattern

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/patternContentUnits
-}
patternContentUnits : CoordinateSystem -> Attribute a
patternContentUnits coordinateSystem =
    Attr.patternContentUnits <| coordinateSystemToString coordinateSystem


{-|
    The `patternTransform` attribute contains the definition of an optional
    additional transformation from the pattern coordinate system onto the target
    coordinate system. This allows for things such as skewing the pattern tiles.
    This additional transformation matrix is post-multiplied to (i.e., inserted
    to the right of) any previously defined transformations, including the
    implicit transformation necessary to convert from object bounding box units
    to user space.

    If attribute `patternTransform` is not specified, then the effect is as if
    an identity transform were specified.

    Used by Elements: pattern

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/patternTransform
-}
patternTransform : List Transform -> Attribute a
patternTransform transforms =
    Attr.patternTransform <| String.join " " (List.map transformToString transforms)


{-|
    The `patternUnits` attribute defines the coordinate system for attributes
    x, y, width and height.

    If the `patternUnits` attribute isn't specified, then the effect is as if a
    value of CoordinateSystemObjectBoundingBox were specified.

    Used by Elements: pattern

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/patternUnits
-}
patternUnits : CoordinateSystem -> Attribute a
patternUnits coordinateSystem =
    Attr.patternUnits <| coordinateSystemToString coordinateSystem


{-|
    The points attribute defines a list of points required to draw a `polyline`
    or `polygon` element.

    Each point is defined by an X and a Y coordinate (pair) in the user
    coordinate system.

    Used by Elements: polyline, polygon

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/points
-}
points : List ( number, number ) -> Attribute a
points pts =
    let
        pointToString ( x, y ) =
            (toString x) ++ ", " ++ (toString y)
    in
        Attr.points <| String.join " " (List.map pointToString pts)


{-|
    In some cases, typically when using the `viewBox` attribute, it is desirable
    that the graphics stretch to fit non-uniformly to take up the entire
    viewport. In other cases, it is desirable that uniform scaling be used for
    the purposes of preserving the aspect ratio of the graphics.

    Used by Elements: svg, symbol, image, feImage, marker, pattern, view

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/preserveAspectRatio
-}
preserveAspectRatio : AlignOption -> MeetOrSliceOption -> Attribute a
preserveAspectRatio alignOption meetOrSliceOption =
    let
        a =
            case alignOption of
                AlignNone ->
                    "none"

                Align x y ->
                    "x" ++ (scaleToString x) ++ "y" ++ (scaleToString y)

        b =
            case meetOrSliceOption of
                Meet ->
                    "meet"

                Slice ->
                    "slice"
    in
        Attr.preserveAspectRatio <| String.join " " [ a, b ]


type AlignOption
    = Align ScaleOption ScaleOption
    | AlignNone


type ScaleOption
    = ScaleMin
    | ScaleMid
    | ScaleMax


scaleToString : ScaleOption -> String
scaleToString scaleOption =
    case scaleOption of
        ScaleMin ->
            "min"

        ScaleMid ->
            "mid"

        ScaleMax ->
            "max"


type MeetOrSliceOption
    = Meet
    | Slice


{-|
    The `primitiveUnits` attribute specifies the coordinate system for the
    various length values within the `filter` primitives and for the attributes
    that define the filter primitive subregion.

    If the `primitiveUnits` attribute isn't specified, then the effect is as if
    a value of CoordinateSystemUserSpaceOnUse were specified.

    Used by Elements: filter

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/primitiveUnits
-}
primitiveUnits : CoordinateSystem -> Attribute a
primitiveUnits coordinateSystem =
    Attr.primitiveUnits <| coordinateSystemToString coordinateSystem


{-|
    This attribute indicates the number of times the animation will take place.

    The number can be a partial iteration, expressed as a fraction. Its value
    must be greater than 0.

    Used by Elements: animate, animateColor, animateMotion, animateTransform,
        discard, mpath, set

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/repeatCount
-}
repeatCount : RepeatCount -> Attribute a
repeatCount repeatCount =
    Attr.repeatCount <|
        case repeatCount of
            RepeatCount count ->
                toString count

            RepeatIndefinite ->
                "indefinite"


type RepeatCount
    = RepeatCount Float
    | RepeatIndefinite


{-|
    This attribute specifies the total duration for repeat.

    Used by Elements: animate, animateColor, animateMotion, animateTransform,
        discard, mpath, set

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/repeatDur
-}
repeatDur : DurationValue -> Attribute a
repeatDur duration =
    Attr.repeatDur <| durationToString duration


{-|
    This attribute takes a list of feature strings. It determines whether or not
    all of the named features are supported by the browser; if all of them are
    supported, the attribute evaluates to true end the element is rendered;
    otherwise, the attribute evaluates to false and the current element and its
    children are skipped and thus will not be rendered. This provides a way to
    design SVG that gracefully falls back when features aren't available.

    If the attribute is not present, then its implicit evaluated value is true.
    If a null string or empty string value is given to attribute
    `requiredFeatures`, the attribute is evaluate to false.

    `requiredFeatures` is often used in conjunction with the `switch` element.
    If `requiredFeatures` is used in other situations, it represents a simple
    switch on the given element whether to render the element or not.

    Used by Elements: a, altGlyph, animate, animateColor, animateMotion,
        animateTransform, circle, clipPath, cursor, defs, discard, ellipse,
        foreignObject, g, image, line, mask, mesh, mpath, path, pattern,
        polygon, polyline, rect, set, svg, switch, text, textPath, tref,
        tspan, use

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/requiredFeatures
-}
requiredFeatures : List String -> Attribute a
requiredFeatures features =
    Attr.requiredFeatures <| String.join " " features


{-|
    This attribute indicates when animation can or can not restart.

    Used by Elements: animate, animateColor, animateMotion, animateTransform,
        discard, mpath, set

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/restart
-}
restart : RestartOption -> Attribute a
restart option =
    Attr.restart <|
        case option of
            RestartAlways ->
                "always"

            RestartWhenNotActive ->
                "whenNotActive"

            RestartNever ->
                "never"


type RestartOption
    = RestartAlways
    | RestartWhenNotActive
    | RestartNever


{-|
    The creator of SVG content might want to provide a hint about what tradeoffs
    to make as the browser renders `path` element or basic shapes. The
    shape-rendering attribute provides these hints.

    Used by Elements: circle, ellipse, line, mesh, path, polygon, polyline,
        rect, svg

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/shapeRendering
-}
shapeRendering : ShapeRenderingOption -> Attribute a
shapeRendering option =
    Attr.shapeRendering <|
        case option of
            RenderAuto ->
                "auto"

            RenderOptimizeSpeed ->
                "optimizeSpeed"

            RenderCrispEdges ->
                "crispEdges"

            RenderGeometricPrecision ->
                "geometricPrecision"

            RenderInherit ->
                "inherit"


type ShapeRenderingOption
    = RenderAuto
    | RenderOptimizeSpeed
    | RenderCrispEdges
    | RenderGeometricPrecision
    | RenderInherit


{-|
    The style attribute specifies style information for its element. It
    functions identically to the style attribute in HTML.

    Used by Elements: a, altGlyph, altGlyphDef, altGlyphItem, circle, clipPath,
        defs, defs, ellipse, feBlend, feColorMatrix, feComponentTransfer,
        feComposite, feConvolveMatrix, feDiffuseLighting, feDisplacementMap,
        feDropShadow, feFlood, feFuncA, feFuncB, feFuncG, feFuncR,
        feGaussianBlur, feImage, feMerge, feMergeNode, feMorphology, feOffset,
        feSpecularLighting, feTile, feTurbulence, filter, font, foreignObject,
        g, glyph, glyph, glyphRef, glyphRef, image, line, linearGradient,
        marker, mask, mesh, meshGradient, missingGlyph, path, pattern, polygon,
        polyline, radialGradient, rect, stop, svg, svg, switch, symbol,
        text, text, textPath, tref, tspan, use, use

    TODO: easy use of a typed CSS library?

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/style
-}
style : String -> Attribute a
style value =
    Attr.style <| value


{-|
    The `textLength` attribute is intended to preserve a span of SVG text's
    display width across a variety of conditions, such as webfonts not loading.

    Used by Elements: text, tspan

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/textLength
-}
textLength : Length -> Attribute a
textLength length =
    Attr.textLength <| lengthToString length


{-|
    This attribute indicates the final value of the attribute that will be
    modified during the animation. The value of the attribute will change
    between the from attribute value and this value. By default the change will
    be linear.

    When this attribute is used with the `set` element, it specifies the value
    for the attribute during the duration of the `set` element.

    Used by Elements: animate, animateColor, animateMotion, animateTransform

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/to
-}
to : number -> Attribute a
to value =
    Attr.to <| toString value


{-|
    The transform attribute defines a list of transform definitions that are
    applied to an element and the element's children. The items in the transform
    list are applied from right to left.

    Used by Elements: a, circle, clipPath, defs, ellipse, foreignObject, g,
        image, line, mesh, path, polygon, polyline, rect, switch, text, use,
        svg

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/transform
-}
transform : List Transform -> Attribute a
transform transforms =
    Attr.transform <| String.join " " (List.map transformToString transforms)


{-|
    Defines the type of transformation, whose values change over time.

    Used by Elements: animateTransform

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/type_
-}
animateTransformType : AnimateTransformType -> Attribute a
animateTransformType t =
    Attr.type_ <|
        case t of
            TypeTranslate ->
                "translate"

            TypeScale ->
                "scale"

            TypeRotate ->
                "rotate"

            TypeSkewX ->
                "skewX"

            TypeSkewY ->
                "skewY"


type AnimateTransformType
    = TypeTranslate
    | TypeScale
    | TypeRotate
    | TypeSkewX
    | TypeSkewY


{-|
    Defines the content type of the element.

    Used by Elements: script, style

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/type_
-}
contentType : String -> Attribute a
contentType t =
    Attr.type_ t


{-|
    The underlinePosition attribute represents the ideal vertical position of
    the underline. The underline position is expressed in the font's
    coordinate system.

    Used by Elements: fontFace

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/underline-position
-}
underlinePosition : number -> Attribute a
underlinePosition position =
    Attr.underlinePosition <| toString position


{-|
    The underlineThickness attribute represents the ideal thickness of the
    underline. The underline thickness is expressed in the font's coordinate
    system.

    Used by Elements: fontFace

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/underline-thickness
-}
underlineThickness : number -> Attribute a
underlineThickness thickness =
    Attr.underlineThickness <| toString thickness


{-|
    Values will be applied in order over the course of the animation. If a list
    of values is specified, any `from`, `to` and `by` attribute values are
    ignored.

    Used by Elements: animate, animateColor, animateMotion, animateTransform,
        discard, mpath, set

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/values
-}
animationValues : List number -> Attribute a
animationValues values =
    Attr.values <| String.join ";" (List.map toString values)


{-|
    The version attribute is used to indicate what specification a SVG document
    conforms to. It is only allowed on the root <svg> element. It is purely
    advisory and has no influence on rendering or processing.

    While it is specified to accept any number, the only two valid choices are
    currently 1.0 and 1.1.

    Used by Elements: svg

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/version
-}
version : Float -> Attribute a
version number =
    Attr.version <| toString number


{-|
    This attribute is provided for backwards compatibility with SVG 1.1. It
    provides documentation to XLink-aware processors. In case of a conflict,
    the target attribute has priority, since it can express a wider range of
    values.

    Used by Elements: a, altGlyph, animate, animateColor, animateMotion,
        animateTransform, colorProfile, cursor, feImage, filter, fontFaceUri,
        glyphRef, image, linearGradient, mpath, pattern, radialGradient,
        script, set, textPath, tref, use

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/xlinkShow
-}
xlinkShow : String -> Attribute a
xlinkShow str =
    Attr.xlinkShow str


{-|
    The xlinkTitle attribute is used to describe the meaning of a link or
    resource in a human-readable fashion, along the same lines as the xlinkRole
    or xlinkArcrole attribute. It is a string that describes the resource.
    In general it is preferable to use a `title` child element rather than a
    xlinkTitle attribute.

    Used by Elements: a, altGlyph, animate, animateColor, animateMotion,
        animateTransform, colorProfile, cursor, feImage, filter, fontFaceUri,
        glyphRef, image, linearGradient, mpath, pattern, radialGradient,
        script, set, textPath, tref, use

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/xlinkTitle
-}
xlinkTitle : String -> Attribute a
xlinkTitle str =
    Attr.xlinkTitle str


{-|
    This attribute defines the x-axis coordinate of the start of a line or
    linearGradient.

    If the attribute is not specified, the effect is as if a value of 0
    (or 0%, in the case of a linearGradient) were specified.

    Used by Elements: line, linearGradient

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/x1
-}
x1 : Length -> Attribute a
x1 position =
    Attr.x1 <| lengthToString position


{-|
    This attribute defines the y-axis coordinate of the start of a line or
    linearGradient.

    If the attribute is not specified, the effect is as if a value of 0
    (or 0%, in the case of a linearGradient) were specified.

    Used by Elements: line, linearGradient

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/y1
-}
y1 : Length -> Attribute a
y1 position =
    Attr.y1 <| lengthToString position


{-|
    This attribute defines the x-axis coordinate of the end of a line or
    linearGradient.

    If the attribute is not specified, the effect is as if a value of 0
    (or 0%, in the case of a linearGradient) were specified.

    Used by Elements: line, linearGradient

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/x1
-}
x2 : Length -> Attribute a
x2 position =
    Attr.x2 <| lengthToString position


{-|
    This attribute defines the y-axis coordinate of the end of a line or
    linearGradient.

    If the attribute is not specified, the effect is as if a value of 0
    (or 0%, in the case of a linearGradient) were specified.

    Used by Elements: line, linearGradient

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/y1
-}
y2 : Length -> Attribute a
y2 position =
    Attr.y2 <| lengthToString position


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
