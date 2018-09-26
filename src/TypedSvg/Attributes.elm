module TypedSvg.Attributes exposing
    ( accelerate, accentHeight, accumulate, additive, alignmentBaseline, allowReorder, alphabetic, amplitude, animateTransformType, animationValues, arabicForm, ascent, attributeName, attributeType, autoReverse, baseProfile, baselineShift, bbox, begin, by, calcMode, capHeight, class, clip, clipPath, clipPathUnits, clipRule, color, colorInterpolation, colorProfile, colorRendering, contentScriptType, contentStyleType, contentType, cursor, cx, cy, d, decelerate, descent, direction, display, dominantBaseline, dur, dx, dy, enableBackground, end, exponent, externalResourcesRequired, fill, fillOpacity, fillRule, filter, fontFamily, fontSize, fontSizeAdjust
    , fontStretch, fontStyle, fontVariant, fontWeight, format, from, from2, from3, fx, fy, g1, g2, glyphName, glyphOrientationHorizontal, glyphOrientationVertical, glyphRef, gradientTransform, gradientUnits, hanging, height, horizAdvX, horizOriginX, horizOriginY, ideographic, imageRendering, intercept, k, kerning, keySplines, keyTimes, lang, lengthAdjust, letterSpacing, lightingColor, local, markerEnd, markerHeight, markerMid, markerStart, markerUnits, markerWidth, mask, maskContentUnits, maskUnits, max, media
    , method, min, name, noFill, offset, opacity, orient, orientation, origin, overflow, overlinePosition, overlineThickness, panose1, path, pathLength, patternContentUnits, patternTransform, patternUnits, pointOrder, pointerEvents, points, preserveAspectRatio, primitiveUnits, r, refX, refY, renderingIntent, repeatCount, repeatDur, requiredExtensions, requiredFeatures, restart, rotate, rx, ry, shapeRendering, slope, spacing, specularConstant, specularExponent, speed, spreadMethod, startOffset
    , stdDeviation, stemh, stemv, stitchTiles, stopColor, stopOpacity, strikethroughPosition, strikethroughThickness, string, stroke, strokeDasharray, strokeDashoffset, strokeLinecap, strokeLinejoin, strokeMiterlimit, strokeOpacity, strokeWidth, style, systemLanguage, tableValues, target, textAnchor, textDecoration, textLength, textRendering, title, to, to2, to3, transform, u1, u2, underlinePosition, underlineThickness, unicode, unicodeBidi, unicodeRange, unitsPerEm, vAlphabetic, vHanging, vIdeographic
    , vMathematical, version, vertAdvY, vertOriginX, vertOriginY, viewBox, viewTarget, visibility, width, widths, wordSpacing, writingMode, x, x1, x2, xChannelSelector, xHeight, xlinkActuate, xlinkArcrole, xlinkHref, xlinkRole, xlinkShow, xlinkTitle, xlinkType, xmlBase, xmlLang, xmlSpace, y, y1, y2, yChannelSelector, zoomAndPan
    )

{-| Typed SVG Attributes

NOTE: For attributes pertaining to SVG filters, see Filters.Attributes


# Other attributes

@docs accelerate, accentHeight, accumulate, additive, alignmentBaseline, allowReorder, alphabetic, amplitude, animateTransformType, animationValues, arabicForm, ascent, attributeName, attributeType, autoReverse, baseProfile, baselineShift, bbox, begin, by, calcMode, capHeight, class, clip, clipPath, clipPathUnits, clipRule, color, colorInterpolation, colorProfile, colorRendering, contentScriptType, contentStyleType, contentType, cursor, cx, cy, d, decelerate, descent, direction, display, dominantBaseline, dur, dx, dy, enableBackground, end, exponent, externalResourcesRequired, fill, fillOpacity, fillRule, filter, fontFamily, fontSize, fontSizeAdjust
@docs fontStretch, fontStyle, fontVariant, fontWeight, format, from, from2, from3, fx, fy, g1, g2, glyphName, glyphOrientationHorizontal, glyphOrientationVertical, glyphRef, gradientTransform, gradientUnits, hanging, height, horizAdvX, horizOriginX, horizOriginY, ideographic, imageRendering, intercept, k, kerning, keySplines, keyTimes, lang, lengthAdjust, letterSpacing, lightingColor, local, markerEnd, markerHeight, markerMid, markerStart, markerUnits, markerWidth, mask, maskContentUnits, maskUnits, max, media
@docs method, min, name, noFill, offset, opacity, orient, orientation, origin, overflow, overlinePosition, overlineThickness, panose1, path, pathLength, patternContentUnits, patternTransform, patternUnits, pointOrder, pointerEvents, points, preserveAspectRatio, primitiveUnits, r, refX, refY, renderingIntent, repeatCount, repeatDur, requiredExtensions, requiredFeatures, restart, rotate, rx, ry, shapeRendering, slope, spacing, specularConstant, specularExponent, speed, spreadMethod, startOffset
@docs stdDeviation, stemh, stemv, stitchTiles, stopColor, stopOpacity, strikethroughPosition, strikethroughThickness, string, stroke, strokeDasharray, strokeDashoffset, strokeLinecap, strokeLinejoin, strokeMiterlimit, strokeOpacity, strokeWidth, style, systemLanguage, tableValues, target, textAnchor, textDecoration, textLength, textRendering, title, to, to2, to3, transform, u1, u2, underlinePosition, underlineThickness, unicode, unicodeBidi, unicodeRange, unitsPerEm, vAlphabetic, vHanging, vIdeographic
@docs vMathematical, version, vertAdvY, vertOriginX, vertOriginY, viewBox, viewTarget, visibility, width, widths, wordSpacing, writingMode, x, x1, x2, xChannelSelector, xHeight, xlinkActuate, xlinkArcrole, xlinkHref, xlinkRole, xlinkShow, xlinkTitle, xlinkType, xmlBase, xmlLang, xmlSpace, y, y1, y2, yChannelSelector, zoomAndPan

-}

import Color exposing (Color, toCssString)
import TypedSvg.Core exposing (..)
import TypedSvg.Types exposing (..)
import TypedSvg.TypesToStrings exposing (..)


{-| Defines the distance from the origin to the top of accent characters,
measured by a distance within the font coordinate system.

Used by Elements: fontFace

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/accent-height>

-}
accentHeight : Float -> Attribute msg
accentHeight h =
    attribute "accent-height" <| String.fromFloat h


{-| Defines a simple acceleration of time for the element. Element time will
accelerate from a rate of 0 at the beginning up to a run rate, over the course
of the specified proportion of the simple duration.

The default value is 0 (no acceleration).

Legal values for `rate` are floating point values between 0 and 1 (inclusive).

Used by Elements: animate, animateMotion

See <https://www.w3.org/TR/smil/smil-timemanip.html#TimeManip-accelerateSyntax>

-}
accelerate : Float -> Attribute msg
accelerate rate =
    attribute "accelerate" <| String.fromFloat rate


{-| This attribute controls whether or not the animation is cumulative.

It is useful for repeated animations to build upon the previous results,
accumulating with each iteration.

Used by Elements: animate, animateColor, animateMotion, animateTransform

See <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/accumulate>

-}
accumulate : Accumulate -> Attribute msg
accumulate option =
    attribute "accumulate" <| accumulateToString option


{-| This attribute controls whether or not the animation is additive.

It is frequently useful to define animation as an offset or delta to an
attribute's value, rather than as absolute values.

Used by Elements: animate, animateColor, animateMotion, animateTransform

See <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/additive>

-}
additive : Additive -> Attribute msg
additive option =
    attribute "additive" <| additiveToString option


{-| -}
alphabetic : String -> Attribute msg
alphabetic =
    attribute "alphabetic"


{-| The `alignmentBaseline` attribute specifies how an object is aligned with
respect to its parent. This property specifies which baseline of this element is
to be aligned with the corresponding baseline of the parent. For example, this
allows alphabetic baselines in Roman text to stay aligned across font size
changes.

It defaults to the baseline with the same name as the computed value of the
`alignmentBaseline` property.

As a presentation attribute, it also can be used as a property directly inside a
CSS stylesheet.

Used by Elements: altGlyph, tspan, tref, textPath

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/alignment-baseline>

-}
alignmentBaseline : AlignmentBaseline -> Attribute msg
alignmentBaseline baseline =
    attribute "alignment-baseline" <| alignmentBaselineToString baseline


{-| The allowReorder attribute signals whether a user agent may reorder the direct
descendents of the switch element, based on user preferences, if it thinks this
could lead to a better user experience.

The possible values are `no`, the default, disallowing reordering and `yes`,
allowing reordering.

See: <https://www.w3.org/TR/smil/smil-content.html#adef-allowReorder>

-}
allowReorder : YesNo -> Attribute msg
allowReorder allow =
    attribute "allowReorder" <| yesNoToString allow


{-| -}
amplitude : String -> Attribute msg
amplitude =
    attribute "amplitude"


{-| Defines the type of transformation, whose values change over time.

Used by Elements: animateTransform

NOTE: this is called `type_` in `elm-lang/svg` but is different here in order to
distinguish it from `contentType`

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/type>

-}
animateTransformType : AnimateTransformType -> Attribute msg
animateTransformType transformType =
    attribute "type" <| animateTransformTypeToString transformType


{-| Values will be applied in order over the course of the animation. If a list
of values is specified, any `from`, `to` and `by` attribute values are
ignored.

Used by Elements: animate, animateColor, animateMotion, animateTransform,
discard, mpath, set

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/values>

-}
animationValues : List Float -> Attribute msg
animationValues values =
    attribute "values" <| String.join ";" (List.map String.fromFloat values)


{-| -}
arabicForm : String -> Attribute msg
arabicForm =
    attribute "arabic-form"


{-| This attribute defines the maximum unaccented depth of the font within the
font coordinate system.

If the attribute is not specified, the effect is as if the attribute were set to
the `vertOriginY` value for the corresponding font.

Used by Elements: fontFace

See <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/ascent>

-}
ascent : Float -> Attribute msg
ascent maxDepth =
    attribute "ascent" <| String.fromFloat maxDepth


{-| This attribute indicates the name of the attribute in the parent element
that is going to be changed during an animation.

Used by Elements: animate, animateColor, animateTransform, set

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/attributeName>

-}
attributeName : String -> Attribute msg
attributeName nm =
    attribute "attributeName" nm


{-| This attribute specifies the namespace in which the target attribute and its
associated values are defined.

Used by Elements: animate, animateColor, animateTransform, set

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/attributeType>

-}
attributeType : AttributeType -> Attribute msg
attributeType attType =
    attribute "attributeType" <| attributeTypeToString attType


{-| -}
autoReverse : String -> Attribute msg
autoReverse =
    attribute "autoReverse"



-- azimuth is in Filters.Attributes
-- baseFrequency is in Filters.Attributes


{-| The baselineShift attribute allows repositioning of the dominant-baseline
relative to the dominant-baseline of the parent text content element. The
shifted object might be a sub- or superscript.

As a presentation attribute, it also can be used as a property directly inside a
CSS stylesheet, see css baseline-shift for further information.

Used by Elements: altGlyph, tref, tspan, textPath

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/baseline-shift>

-}
baselineShift : BaselineShift -> Attribute msg
baselineShift shift =
    attribute "baseline-shift" <| baselineShiftToString shift


{-| -}
baseProfile : String -> Attribute msg
baseProfile =
    attribute "baseProfile"


{-| -}
bbox : String -> Attribute msg
bbox =
    attribute "bbox"


{-| This attribute defines when an animation should begin.

Each individual value can be one of the BeginValue types.

Used by Elements: animate, animateColor, animateMotion, animateTransform,
discard, mpath, set

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/begin>
See: <https://www.w3.org/TR/2001/REC-smil-animation-20010904/#Timing-EvaluationOfBeginEndTimeLists>

-}
begin : List TimingValue -> Attribute msg
begin timingValues =
    attribute "begin" <| String.join ";" (List.map timingValueAsString timingValues)



-- bias is in Filters.Attributes


{-| -}
by : String -> Attribute msg
by =
    attribute "by"


{-| This attribute specifies the interpolation mode for an animation. The
default mode is linear, however if the attribute does not support linear
interpolation (e.g. for strings), the calcMode attribute is ignored and
discrete interpolation is used.

Used by Elements: animate, animateColor, animateMotion, animateTransform

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/calcMode>

-}
calcMode : CalcMode -> Attribute msg
calcMode mode =
    attribute "calcMode" <| calcModeToString mode


{-| -}
capHeight : String -> Attribute msg
capHeight =
    attribute "cap-height"


{-| Assigns a class name or set of class names to an element. You can use this
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

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/class>

-}
class : List String -> Attribute msg
class names =
    attribute "class" (String.join " " names)


{-| The clip attribute has the same parameter values as defined for the css clip
property. Unitless values, which indicate current user coordinates, are
permitted on the coordinate values on the <shape>. The value of auto defines
a clipping path along the bounds of the viewport created by the given
element.

As a presentation attribute, it also can be used as a property directly
inside a CSS stylesheet.

Used by Elements: svg, symbol, image, foreignobject, pattern, marker

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/clip>

-}
clip : Clip -> Attribute msg
clip clp =
    attribute "clip" <| clipToString clp


{-| The `clipPath` attribute binds the element it is applied to with a given
`clipPath` element.

As a presentation attribute, it also can be used as a property directly inside a
CSS stylesheet.

Used by Elements: a, circle, defs, ellipse, g, image, line, marker, mask,
mesh, missing-glyph, path, pattern, polygon, polyline, rect, svg,
switch, symbol, text, use

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/clip-path>

-}
clipPath : ClipPath -> Attribute msg
clipPath cPath =
    attribute "clip-path" <| clipPathToString cPath


{-| The `clipPathUnits` attribute defines the coordinate system for the contents
of the `clipPath` element.

If the `clipPathUnits` attribute is not specified, then the effect is as if a
value of `userSpaceOnUse` were specified.

Note that values defined as a percentage inside the content of the `clipPath`
are not affected by this attribute. It means that even if you set the value
of `maskContentUnits` to `CoordinateSystemObjectBoundingBox`, percentage values
will be calculated as if the value of the attribute were userSpaceOnUse.

Used by Elements: clipPath

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/clipPathUnits>

-}
clipPathUnits : CoordinateSystem -> Attribute msg
clipPathUnits coordinateSystem =
    attribute "clipPathUnits" <| coordinateSystemToString coordinateSystem


{-| The `clipRule` attribute only applies to graphics elements that are
contained within a `clipPath` element. The `clipRule` attribute basically
works as the `fillRule` attribute, except that it applies to `clipPath`
definitions.

Used by Elements: circle, ellipse, image, line, mesh, path, polygon, polyline,
rect, text, use

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/clip-rule>

-}
clipRule : ClipRule -> Attribute msg
clipRule rule =
    attribute "clip-rule" <| clipRuleToString rule


{-| The `colorInterpolation` attribute specifies the color space for gradient
interpolations, color animations, and alpha compositing.

When a child element is blended into a background, the value of the
`colorInterpolation` attribute on the child determines the type of blending,
not the value of the `colorInterpolation` on the parent.

For gradients which make use of the `xlinkHref` attribute to reference another
gradient, the gradient uses the `colorInterpolation` attribute value from the
gradient element which is directly referenced by the fill or stroke attribute.

When animating colors, color interpolation is performed according to the value
of the `colorInterpolation` attribute on the element being animated.

As a presentation attribute, it also can be used as a property directly inside a
CSS stylesheet.

Used by Elements: a, animage, animateColor, circle, defs, ellipse, g, image,
line, marker, mask, mesh, missing-glyph, path, pattern, polygon,
polyline, rect, svg, switch, symbol, text, use

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/color-interpolation>

-}
colorInterpolation : ColorInterpolation -> Attribute msg
colorInterpolation interpolation =
    attribute "color-interpolation" <| colorInterpolationToString interpolation



-- colorInterpolationFilters: see Filters.colorInterpolationFilters


{-| The `colorProfile` attribute is used to define which color profile a raster
image included through the `image` element should use.

As a presentation attribute, it also can be used as a property directly inside a
CSS stylesheet.

Used by Elements: image

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/color-profile>

-}
colorProfile : ColorProfile -> Attribute msg
colorProfile profile =
    attribute "color-profile" <| colorProfileToString profile


{-| The colorRendering attribute provides a hint to the SVG user agent about
how to optimize its color interpolation and compositing operations.

`colorRendering` takes precedence over `colorInterpolationFilters`. For
example, assume `colorRendering` is set to `optimizeSpeed`, and
`ColorInterpolationFilters` is set to `linearRGB`. In this case, the SVG
user agent should perform color operations in a way that optimizes
performance, which might mean sacrificing the color interpolation precision
as specified by `colorInterpolationFilters`.

As a presentation attribute, it also can be used as a property directly inside a
CSS stylesheet.

Used by Elements: a, animate, animateColor, circle, defs, ellipse, g, image,
line, marker, mask, mesh, missing-glyph, path, pattern, polygon,
polyline, rect, svg, switch, symbol, text, use

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/color-rendering>

-}
colorRendering : Rendering -> Attribute msg
colorRendering rendering =
    attribute "color-rendering" <| renderingToString rendering


{-| The `color` attribute is used to provide a potential indirect value
(currentColor) for the `fill`, `stroke`, `stopColor`, `floodColor` and
`lightingColor` attributes.

As a presentation attribute, it can also be used as a property directly inside a
CSS stylesheet.

Used by Elements: altGlyph, altGlyphDef, altGlyphItem, circle, ellipse,
feDiffuseLighting, feFlood, feSpecularLighting, glyph, glyphRef, line,
mesh, path, polygon, polyline, rect, stop, text, textPath, tref, tspan

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/color>

-}
color : Color -> Attribute msg
color c =
    attribute "color" <| toCssString c


{-| The contentScriptType attribute on the <svg> element specifies the default
scripting language for the given document fragment.

This attribute sets the default scripting language used to process the value
strings in event attributes. This language must be used for all instances of
scripts that do not specify their own scripting language. The value
contentType specifies a media type, per MIME Part Two: Media Types
[RFC2046]. The default value is application/ecmascript.

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/contentScriptType>

-}
contentScriptType : String -> Attribute msg
contentScriptType mimeType =
    attribute "contentScriptType" mimeType


{-| This attribute specifies the style sheet language for the given document
fragment. The contentStyleType is specified on the `svg` element. By default,
if it's not defined, the value is "text/css"

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/contentStyleType>

-}
contentStyleType : String -> Attribute msg
contentStyleType styleSheetLanguage =
    attribute "contentStyleType" styleSheetLanguage


{-| Defines the content type of the element.

Used by Elements: script, style

NOTE: this is called `type_` in `elm-lang/svg` but is different here in order to
distinguish it from `animateTransformType`

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/type>

-}
contentType : String -> Attribute msg
contentType t =
    attribute "type" t


{-| The `cursor` attribute specifies the mouse cursor displayed when the mouse
pointer is over an element.

This attribute behaves exactly like the css cursor property except that if the
browser supports the `cursor` element, you should be able to use it with the
`funcIRI` notation.

As a presentation attribute, it also can be used as a property directly inside a
CSS stylesheet.

Used by Elements: a, circle, defs, ellipse, g, image, line, marker, mask,
mesh, missing-glyph, path, pattern, polygon, polyline, rect, svg,
switch, symbol, text, use

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/cursor>

-}
cursor : Cursor -> Attribute msg
cursor csor =
    attribute "cursor" <| cursorToString csor


{-| -}
cx : Length -> Attribute msg
cx length =
    attribute "cx" <| lengthToString length


{-| -}
cy : Length -> Attribute msg
cy length =
    attribute "cy" <| lengthToString length


{-| This attribute defines a path to follow.

NOTE: You probably want to import the `folkertdev/svg-path-dsl` package for
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

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/d>

-}
d : String -> Attribute msg
d =
    attribute "d"


{-| -}
decelerate : String -> Attribute msg
decelerate =
    attribute "decelerate"


{-| -}
descent : String -> Attribute msg
descent =
    attribute "descent"


{-| The `direction` attribute specifies the base writing direction of text and
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

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/direction>

-}
direction : Direction -> Attribute msg
direction dir =
    attribute "direction" <| directionToString dir


{-| The `display` attribute lets you control the rendering of graphical or
container elements. It is similar to the CSS "display" attribute (e.g.
display: "none", "block", etc.)

As a presentation attribute, it also can be used as a property directly
inside a CSS stylesheet.

Used by Elements: a, altGlyph, altGlyphDef, altGlyphItem, circle, ellipse,
foreignobject, g, glyph, glyphRef, image, line, mesh, path, polygon,
polyline, rect, svg, switch, text, text, textPath, tref, tspan, use

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/display>

-}
display : Display -> Attribute msg
display disp =
    attribute "display" <| displayToString disp


{-| The `dominantBaseline` attribute is used to determine or re-determine a
scaled-baseline-table. A scaled-baseline-table is a compound value with
three components: a baseline-identifier for the `dominantBaseline`, a
baseline-table and a baseline-table font-size.

Some values of the property re-determine all three values; other only
re-establish the baseline-table font-size. When the initial value, auto,
would give an undesired result, this property can be used to explicitly
set the desire scaled-baseline-table.

If there is no baseline table in the nominal font or if the baseline table
lacks an entry for the desired baseline, then the browser may use heuristics
to determine the position of the desired baseline.

As a presentation attribute, it also can be used as a property directly
inside a CSS stylesheet.

Used by Elements: altGlyph, altGlyphDef, altGlyphItem, glyph, glyphRef,
textPath, text, tref, tspan

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/dominant-baseline>

-}
dominantBaseline : DominantBaseline -> Attribute msg
dominantBaseline baseline =
    attribute "dominant-baseline" <| dominantBaselineToString baseline


{-| This attribute indicates the simple duration of the animation.

Used by Elements: animate, animateColor, animateMotion, animateTransform,
discard, mpath, set

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/dur>

-}
dur : Duration -> Attribute msg
dur duration =
    attribute "dur" <| durationToString duration


{-| -}
dx : Length -> Attribute msg
dx length =
    attribute "dx" <| lengthToString length


{-| -}
dy : Length -> Attribute msg
dy length =
    attribute "dy" <| lengthToString length


{-| -}
enableBackground : String -> Attribute msg
enableBackground =
    attribute "enable-background"


{-| This attribute defines an end value for the animation that can constrain
the active duration.

Each value can be of the same type as the ones defined for the begin
attribute.

Used by Elements: animate, animateColor, animateMotion, animateTransform,
discard, mpath, set

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/end>

-}
end : List TimingValue -> Attribute msg
end timingValues =
    attribute "end" <| String.join ";" (List.map timingValueAsString timingValues)


{-| -}
exponent : String -> Attribute msg
exponent =
    attribute "exponent"


{-| The externalResourcesRequired attribute is available on all container
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

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/externalResourcesRequired>

-}
externalResourcesRequired : Bool -> Attribute msg
externalResourcesRequired bool =
    attribute "externalResourcesRequired" <| boolToString bool


{-| -}
fill : Fill -> Attribute msg
fill =
    attribute "fill" << fillToString


{-| -}
noFill : Attribute msg
noFill =
    fill FillNone


{-| This attribute specifies the opacity of the color or the content the current
object is filled with.

Used by Elements: altGlyph, altGlyphDef, altGlyphItem, circle, ellipse,
glyph, glyphRef, line, mesh, path, polygon, polyline, rect, text,
textPath, tref, tspan

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/fill-opacity>

-}
fillOpacity : Opacity -> Attribute msg
fillOpacity opa =
    attribute "fill-opacity" <| opacityToString opa


{-| The fillRule attribute indicates how to determine what side of a path is
inside a shape, to determine how the fill property paints the shape. For a
simple, non-intersecting path, it is intuitively clear what region lies
"inside"; however, for a more complex path, such as a path that intersects
itself or where one subpath encloses another, the interpretation of
"inside" is not so obvious.

As a presentation attribute, it also can be used as a property directly
inside a CSS stylesheet

Used by Elements: altGlyph, altGlyphDef, altGlyphItem, circle, ellipse,
glyph, glyphRef, line, mesh, path, polygon, polyline, rect, text,
textPath, tref, tspan

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/fill-rule>

-}
fillRule : FillRule -> Attribute msg
fillRule rule =
    attribute "fill-rule" <| fillRuleToString rule


{-| The filter attribute defines the filter effects define by the `filter`
element that shall be applied to its element.

NOTE: See Filters and Filters.Attributes modules.

As a presentation attribute, it also can be used as a property directly
inside a CSS stylesheet.

Used by Elements: a, circle, defs, ellipse, g, glyph, image, line, marker,
mesh, missing-glyph, path, pattern, polygon, polyline, rect, svg,
switch, symbol, text, use

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/filter>

-}
filter : Filter -> Attribute msg
filter f =
    attribute "filter" <| filterToString f



-- floodColor: see Filters.floodColor
-- floodOpacity: see Filters.floodOpacity


{-| An empty list will set `font-family: inherit`
-}
fontFamily : List String -> Attribute msg
fontFamily families =
    case families of
        [] ->
            attribute "font-family" "inherit"

        _ ->
            attribute "font-family" (String.join ", " families)


{-| -}
fontSize : Length -> Attribute msg
fontSize length =
    attribute "font-size" <| lengthToString length


{-| The `fontSizeAdjust` attribute allows authors to specify an aspect value
for an element that will preserve the X height of the first choice font in
a substitute font.

As a presentation attribute, it also can be used as a property directly
inside a CSS stylesheet.

Used by Elements: altGlyph, altGlyphDef, altGlyphItem, glyph, glyphRef,
text, textPath, tref, tspan

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/font-size-adjust>

-}
fontSizeAdjust : FontSizeAdjust -> Attribute msg
fontSizeAdjust adjust =
    attribute "font-size-adjust" <| fontSizeAdjustToString adjust


{-| The `fontStretch` attribute indicates the desired amount of condensing or
expansion in the glyphs used to render the text.

As a presentation attribute, it also can be used as a property directly
inside a CSS stylesheet.

Used by Elements: altGlyph, altGlyphDef, altGlyphItem, glyph, glyphRef,
text, textPath, tref, tspan

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/font-stretch>

-}
fontStretch : FontStretch -> Attribute msg
fontStretch stretch =
    attribute "font-stretch" <| fontStretchToString stretch


{-| The `fontStyle` attribute specifies whether the text is to be rendered using
a normal, italic or oblique face.

As a presentation attribute, it also can be used as a property directly
inside a CSS stylesheet.

Used by Elements: altGlyph, altGlyphDef, altGlyphItem, glyph, glyphRef,
text, textPath, tref, tspan

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/font-style>

-}
fontStyle : FontStyle -> Attribute msg
fontStyle fStyle =
    attribute "font-style" <| fontStyleToString fStyle


{-| The `fontVariant` attribute indicates whether the text is to be rendered
using the normal glyphs for lowercase characters or using small-caps glyphs
for lowercase characters.

As a presentation attribute, it also can be used as a property directly
inside a CSS stylesheet.

Used by Elements: altGlyph, altGlyphDef, altGlyphItem, glyph, glyphRef,
text, textPath, tref, tspan

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/font-variant>

-}
fontVariant : FontVariant -> Attribute msg
fontVariant variant =
    attribute "font-variant" <| fontVariantToString variant


{-| The `fontWeight` attribute refers to the boldness or lightness of the glyphs
used to render the text, relative to other fonts in the same font family.

As a presentation attribute, it also can be used as a property directly
inside a CSS stylesheet.

Used by Elements: altGlyph, altGlyphDef, altGlyphItem, glyph, glyphRef,
text, textPath, tref, tspan

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/font-weight>

-}
fontWeight : FontWeight -> Attribute msg
fontWeight fWeight =
    attribute "font-weight" <| fontWeightToString fWeight


{-| -}
format : String -> Attribute msg
format =
    attribute "format"


{-| This attribute indicates the initial value of the attribute that will be
modified during the animation. When used with the `to` attribute, the
animation will change the modified attribute from the from value to the to
value.

Used by Elements: animate, animateColor, animateMotion, animateTransform

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/from>

-}
from : Float -> Attribute msg
from value =
    attribute "from" <| String.fromFloat value


{-| This attribute indicates the initial values of 2 attributes that will be
modified during the animation. When used with the `to2` attribute, the
animation will change the modified attribute sfrom the from values to the to
value.

Used by Elements: animate, animateColor, animateMotion, animateTransform

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/from>

-}
from2 : Float -> Float -> Attribute msg
from2 a b =
    attribute "from" <| floatsToString [ a, b ]


{-| This attribute indicates the initial values of 3 attributes that will be
modified during the animation. When used with the `to3` attribute, the
animation will change the modified attributes from the from values to the to
value.

Used by Elements: animate, animateColor, animateMotion, animateTransform

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/from>

-}
from3 : Float -> Float -> Float -> Attribute msg
from3 a b c =
    attribute "from" <| floatsToString [ a, b, c ]


{-| For the `radialGradient` element, this attribute defines the x-axis
coordinate of the focal point for the radial gradient.

If the attribute is not specified, it's assumed to be at the same place as
the center point.

Used by Elements: radialGradient

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/>

-}
fx : Length -> Attribute msg
fx length =
    attribute "fx" <| lengthToString length


{-| For the `radialGradient` element, this attribute defines the y-axis
coordinate of the focal point for the radial gradient.

If the attribute is not specified, it's assumed to be at the same place as
the center point.

Used by Elements: radialGradient

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/>

-}
fy : Length -> Attribute msg
fy length =
    attribute "fy" <| lengthToString length


{-| -}
g1 : String -> Attribute msg
g1 =
    attribute "g1"


{-| -}
g2 : String -> Attribute msg
g2 =
    attribute "g2"


{-| -}
glyphName : String -> Attribute msg
glyphName =
    attribute "glyph-name"


{-| -}
glyphOrientationHorizontal : String -> Attribute msg
glyphOrientationHorizontal =
    attribute "glyph-orientation-horizontal"


{-| -}
glyphOrientationVertical : String -> Attribute msg
glyphOrientationVertical =
    attribute "glyph-orientation-vertical"


{-| -}
glyphRef : String -> Attribute msg
glyphRef =
    attribute "glyphRef"


{-| The gradientTransform attribute contains the definition of an optional
additional transformation from the gradient coordinate system onto the
target coordinate system (i.e., userSpaceOnUse or objectBoundingBox). This
allows for things such as skewing the gradient. This additional
transformation matrix is post-multiplied to (i.e., inserted to the right of)
any previously defined transformations, including the implicit
transformation necessary to convert from object bounding box units to user
space.

Used by Elements: linearGradient, radialGradient

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/gradientTransform>

-}
gradientTransform : List Transform -> Attribute msg
gradientTransform transforms =
    attribute "gradientTransform" <| String.join " " (List.map transformToString transforms)


{-| The gradientUnits attribute defines the coordinate system for attributes
x1, y1, x2 and y2 on the `linearGradient` element or for attributes cx, cy,
r, fx, and fy on the `radialGradient`.

If the `gradientUnits` attribute isn't specified, then the effect is as if a
value of CoordinateSystemObjectBoundingBox were specified.

Used by Elements: linearGradient, radialGradient

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/gradientUnits>

-}
gradientUnits : CoordinateSystem -> Attribute msg
gradientUnits coordinateSystem =
    attribute "gradientUnits" <| coordinateSystemToString coordinateSystem


{-| -}
hanging : String -> Attribute msg
hanging =
    attribute "hanging"


{-| This attribute indicates a vertical length in the user coordinate system.
The exact effect of this coordinate depends on each element. Most of the
time, it represents the height of the rectangular region of the reference
element (see each individual element's documentation for exceptions).

This attribute must be specified except for the `svg` element where the
default value is 100% and the `filter` and `mask` elements where the default
value is 120%.

-}
height : Length -> Attribute msg
height length =
    attribute "height" <| lengthToString length


{-| -}
horizAdvX : String -> Attribute msg
horizAdvX =
    attribute "horiz-adv-x"


{-| -}
horizOriginX : String -> Attribute msg
horizOriginX =
    attribute "horiz-origin-x"


{-| -}
horizOriginY : String -> Attribute msg
horizOriginY =
    attribute "horiz-origin-y"


{-| -}
ideographic : String -> Attribute msg
ideographic =
    attribute "ideographic"


{-| The `imageRendering` attribute provides a hint to the browser about how to
make speed vs. quality tradeoffs as it performs image processing.

As a presentation attribute, it also can be used as a property directly
inside a CSS stylesheet.

Used by Elements: image

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/image-rendering>

-}
imageRendering : Rendering -> Attribute msg
imageRendering rendering =
    attribute "image-rendering" <| renderingToString rendering


{-| -}
intercept : String -> Attribute msg
intercept =
    attribute "intercept"


{-| -}
k : String -> Attribute msg
k =
    attribute "k"


{-| The kerning attribute indicates whether the browser should adjust
inter-glyph spacing based on kerning tables that are included in the
relevant font (i.e., enable auto-kerning) or instead disable auto-kerning
and instead set inter-character spacing to a specific length (typically,
zero).

The value of auto indicates that the user agent should adjust inter-glyph
spacing based on kerning tables that are included in the font that will be
used.

If a `length` is provided, then auto-kerning is disabled. Instead,
inter-character spacing is set to the given <length>. The most common
scenario, other than auto, is to set kerning to a value of 0 so that
auto-kerning is disabled.

If a `length` is provided without a unit identifier (e.g., an unqualified
number such as 128), the browser processes the `length` as a width value in
the current user coordinate system.

If a `length` is provided with a unit identifier (e.g., .25em or 1%), then
the browser converts the `length` into a corresponding value in the current
user coordinate system.

When a `length` is provided, its value is added to the inter-character
spacing value specified by the letter-spacing attribute.

As a presentation attribute, it also can be used as a property directly
inside a CSS stylesheet, see css kerning for further information.

Used by Elements: altGlyph, altGlyphDef, glyph, glyphRef, textPath,
text, tref, tspan

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/kerning>

-}
kerning : Kerning -> Attribute msg
kerning kning =
    attribute "kerning" <| kerningToString kning


{-| The keySplines attribute define a set of Bézier control points associated
with the keyTimes list, defining a cubic Bézier function that controls
interval pacing.

Used by Elements: animate, animateColor, animateMotion, animateTransform

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/keySplines>

-}
keySplines : List BezierAnchorPoint -> Attribute msg
keySplines bezierAnchorPointList =
    attribute "keySplines" <| (List.map bezierAnchorPointToString bezierAnchorPointList |> String.join ";")


{-| The keyTimes attribute is a semicolon-separated list of time `values` used
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

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/keyTimes>

-}
keyTimes : List Float -> Attribute msg
keyTimes floatList =
    attribute "keyTimes" <| (List.map String.fromFloat floatList |> String.join ";")


{-| -}
lang : String -> Attribute msg
lang =
    attribute "lang"


{-| When an SVG `text` or `tspan` element has a specific length set using the
textLength attribute, the lengthAdjust attribute controls how the text is
stretched or compressed into that length.

The two possible values for the attribute are `LengthAdjustSpacing` and
`LengthAdjustSpacingAndGlyphs`.

Using `LengthAdjustSpacing` (the default), the letter forms are preserved,
but the space between them grows or shrinks.

Using `LengthAdjustSpacingAndGlyphs`, the entire text element is stretched in
the direction of the text.

Used by Elements: text, tspan

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/lengthAdjust>

-}
lengthAdjust : LengthAdjust -> Attribute msg
lengthAdjust option =
    attribute "lengthAdjust" <| lengthAdjustToString option


{-| -}
letterSpacing : String -> Attribute msg
letterSpacing =
    attribute "letter-spacing"


{-| -}
lightingColor : String -> Attribute msg
lightingColor =
    attribute "lighting-color"


{-| -}
local : String -> Attribute msg
local =
    attribute "local"


{-| -}
markerEnd : String -> Attribute msg
markerEnd =
    attribute "marker-end"


{-| The markerHeight represents the height of the viewport into which the
`marker` is to be fitted when it is rendered.

A value of zero disables rendering of the element.

If the attribute is not specified, the effect is as if a value of 3 were
specified.

Used by Elements: marker

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/markerHeight>

-}
markerHeight : Length -> Attribute msg
markerHeight mHeight =
    attribute "markerHeight" <| lengthToString mHeight


{-| -}
markerMid : String -> Attribute msg
markerMid =
    attribute "marker-mid"


{-| -}
markerStart : String -> Attribute msg
markerStart =
    attribute "marker-start"


{-| The `markerUnits` attribute defines the coordinate system for the attributes
`markerWidth`, `markerHeight` and the contents of the `marker`.

If the `markerUnits` attribute is not specified, then the effect is as if a
value of `strokeWidth` were specified.

Used by Elements: marker

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/markerUnits>

-}
markerUnits : MarkerCoordinateSystem -> Attribute msg
markerUnits markerCoordinateSystem =
    attribute "markerUnits" <| markerCoordinateSystemToString markerCoordinateSystem


{-| The markerWidth represents the width of the viewport into which the
`marker` is to be fitted when it is rendered.

A value of zero disables rendering of the element.

If the attribute is not specified, the effect is as if a value of 3 were
specified.

Used by Elements: marker

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/markerWidth>

-}
markerWidth : Length -> Attribute msg
markerWidth mWidth =
    attribute "markerWidth" <| lengthToString mWidth


{-| -}
mask : String -> Attribute msg
mask =
    attribute "mask"


{-| The maskContentUnits attribute defines the coordinate system for the
contents of the `mask`.

If the `maskContentUnits` attribute isn't specified, then the effect is as
if a value of CoordinateSystemUserSpaceOnUse were specified.

Note that values defined as a percentage inside the content of the `mask`
are not affected by this attribute. It means that even if you set the value
of `maskContentUnits` to CoordinateSystemObjectBoundingBox, percentage
values will be calculated as if the value of the attribute were
CoordinateSystemUserSpaceOnUse.

Used by Elements: mask

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/maskContentUnits>

-}
maskContentUnits : CoordinateSystem -> Attribute msg
maskContentUnits coordinateSystem =
    attribute "maskContentUnits" <| coordinateSystemToString coordinateSystem


{-| The `maskUnits` attribute defines the coordinate system for attributes x, y,
width and height.

If the `maskUnits` attribute isn't specified, then the effect is as if a
value of CoordinateSystemObjectBoundingBox were specified.

Used by Elements: mask

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/maskUnits>

-}
maskUnits : CoordinateSystem -> Attribute msg
maskUnits coordinateSystem =
    attribute "maskUnits" <| coordinateSystemToString coordinateSystem


{-| This attribute specifies the maximum value of the active duration.

The default value for max is 0. This does not constrain the active duration
at all.

Used by Elements: animate, animateColor, animateMotion, animateTransform,
discard, mpath, set

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/max>

-}
max : ClockValue -> Attribute msg
max clockValue =
    attribute "max" <| clockValue


{-| -}
media : String -> Attribute msg
media =
    attribute "media"


{-| -}
method : String -> Attribute msg
method =
    attribute "method"


{-| This attribute specifies the minimum value of the active duration.

The default value for max is 0. This does not constrain the active duration
at all.

Used by Elements: animate, animateColor, animateMotion, animateTransform,
discard, mpath, set

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/min>

-}
min : ClockValue -> Attribute msg
min clockValue =
    attribute "min" <| clockValue


{-| -}
name : String -> Attribute msg
name =
    attribute "name"


{-| -}
offset : String -> Attribute msg
offset =
    attribute "offset"


{-| -}
opacity : Opacity -> Attribute msg
opacity =
    attribute "opacity" << opacityToString



-- operator: see compositeOperator and Filters.morphologyOperator


{-| -}
orient : String -> Attribute msg
orient =
    attribute "orient"


{-| -}
orientation : String -> Attribute msg
orientation =
    attribute "orientation"


{-| -}
origin : String -> Attribute msg
origin =
    attribute "origin"


{-| -}
overflow : String -> Attribute msg
overflow =
    attribute "overflow"


{-| The `overlinePosition` attribute represents the ideal vertical position of
the overline. The overline position is expressed in the font's coordinate
system.

Used by Elements: fontFace

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/overlinePosition>

-}
overlinePosition : Float -> Attribute msg
overlinePosition position =
    attribute "overline-position" <| String.fromFloat position


{-| The `overlineThickness` attribute represents the ideal thickness of
the overline. The overline position is expressed in the font's coordinate
system.

Used by Elements: fontFace

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/overlineThickness>

-}
overlineThickness : Float -> Attribute msg
overlineThickness thickness =
    attribute "overline-thickness" <| String.fromFloat thickness


{-| -}
panose1 : String -> Attribute msg
panose1 =
    attribute "panose-1"


{-| NOTE: is this used as an attribute? `elm-lang/svg` seems to think so.
-}
path : String -> Attribute msg
path =
    attribute "path"


{-| This attribute lets the author specify a total length for the path, in user
units. This value is then used to calibrate the browser's distance
calculations with those of the author, by scaling all distance computations
using the ratio pathLength / (computed value of path length).

Used by Elements: path

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/pathLength>

-}
pathLength : Float -> Attribute msg
pathLength length =
    attribute "pathLength" <| String.fromFloat length


{-| The `patternContentUnits` attribute defines the coordinate system for the
contents of the `pattern`. Note that this attribute has no effect if
attribute viewBox is specified on the `pattern` element.

If the `patternContentUnits` attribute isn't specified, then the effect is
as if a value of CoordinateSystemUserSpaceOnUse were specified.

Used by Elements: pattern

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/patternContentUnits>

-}
patternContentUnits : CoordinateSystem -> Attribute msg
patternContentUnits coordinateSystem =
    attribute "patternContentUnits" <| coordinateSystemToString coordinateSystem


{-| The `patternTransform` attribute contains the definition of an optional
additional transformation from the pattern coordinate system onto the target
coordinate system. This allows for things such as skewing the pattern tiles.
This additional transformation matrix is post-multiplied to (i.e., inserted
to the right of) any previously defined transformations, including the
implicit transformation necessary to convert from object bounding box units
to user space.

If attribute `patternTransform` is not specified, then the effect is as if
an identity transform were specified.

Used by Elements: pattern

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/patternTransform>

-}
patternTransform : List Transform -> Attribute msg
patternTransform transforms =
    attribute "patternTransform" <| String.join " " (List.map transformToString transforms)


{-| The `patternUnits` attribute defines the coordinate system for attributes
x, y, width and height.

If the `patternUnits` attribute isn't specified, then the effect is as if a
value of CoordinateSystemObjectBoundingBox were specified.

Used by Elements: pattern

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/patternUnits>

-}
patternUnits : CoordinateSystem -> Attribute msg
patternUnits coordinateSystem =
    attribute "patternUnits" <| coordinateSystemToString coordinateSystem


{-| -}
pointerEvents : String -> Attribute msg
pointerEvents =
    attribute "pointer-events"


{-| -}
pointOrder : String -> Attribute msg
pointOrder =
    attribute "point-order"


{-| The points attribute defines a list of points required to draw a `polyline`
or `polygon` element.

Each point is defined by an X and a Y coordinate (pair) in the user coordinate
system.

Used by Elements: polyline, polygon

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/points>

-}
points : List ( Float, Float ) -> Attribute msg
points pts =
    let
        pointToString ( xx, yy ) =
            String.fromFloat xx ++ ", " ++ String.fromFloat yy
    in
    attribute "points" <| String.join " " (List.map pointToString pts)


{-| In some cases, typically when using the `viewBox` attribute, it is desirable
that the graphics stretch to fit non-uniformly to take up the entire
viewport. In other cases, it is desirable that uniform scaling be used for
the purposes of preserving the aspect ratio of the graphics.

Used by Elements: svg, symbol, image, feImage, marker, pattern, view

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/preserveAspectRatio>

-}
preserveAspectRatio : Align -> MeetOrSlice -> Attribute msg
preserveAspectRatio align meetOrSlice =
    attribute "preserveAspectRatio" <|
        String.join " "
            [ alignToString align
            , meetOrSliceToString meetOrSlice
            ]


{-| The `primitiveUnits` attribute specifies the coordinate system for the
various length values within the `filter` primitives and for the attributes
that define the filter primitive subregion.

If the `primitiveUnits` attribute isn't specified, then the effect is as if
a value of CoordinateSystemUserSpaceOnUse were specified.

Used by Elements: filter

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/primitiveUnits>

-}
primitiveUnits : CoordinateSystem -> Attribute msg
primitiveUnits coordinateSystem =
    attribute "primitiveUnits" <| coordinateSystemToString coordinateSystem


{-| -}
r : Length -> Attribute msg
r length =
    attribute "r" <| lengthToString length



-- radius: see Filters.radius


{-| -}
refX : String -> Attribute msg
refX =
    attribute "refX"


{-| -}
refY : String -> Attribute msg
refY =
    attribute "refY"


{-| -}
renderingIntent : String -> Attribute msg
renderingIntent =
    attribute "rendering-intent"


{-| This attribute indicates the Float of times the animation will take place.

The Float can be a partial iteration, expressed as a fraction. Its value
must be greater than 0.

Used by Elements: animate, animateColor, animateMotion, animateTransform,
discard, mpath, set

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/repeatCount>

-}
repeatCount : RepeatCount -> Attribute msg
repeatCount count =
    attribute "repeatCount" <| repeatCountToString count


{-| This attribute specifies the total duration for repeat.

Used by Elements: animate, animateColor, animateMotion, animateTransform,
discard, mpath, set

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/repeatDur>

-}
repeatDur : Duration -> Attribute msg
repeatDur duration =
    attribute "repeatDur" <| durationToString duration


{-| -}
requiredExtensions : String -> Attribute msg
requiredExtensions =
    attribute "requiredExtensions"


{-| This attribute takes a list of feature strings. It determines whether or not
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

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/requiredFeatures>

-}
requiredFeatures : List String -> Attribute msg
requiredFeatures features =
    attribute "requiredFeatures" <| String.join " " features


{-| This attribute indicates when animation can or can not restart.

Used by Elements: animate, animateColor, animateMotion, animateTransform,
discard, mpath, set

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/restart>

-}
restart : Restart -> Attribute msg
restart rstart =
    attribute "restart" <| restartToString rstart



-- result: see Filters.result


{-| -}
rotate : String -> Attribute msg
rotate =
    attribute "rotate"


{-| -}
rx : Length -> Attribute msg
rx length =
    attribute "rx" <| lengthToString length


{-| -}
ry : Length -> Attribute msg
ry length =
    attribute "ry" <| lengthToString length



-- scale: see Filters.scale
-- seed: see Filters.seed


{-| The creator of SVG content might want to provide a hint about what tradeoffs
to make as the browser renders `path` element or basic shapes. The
shape-rendering attribute provides these hints.

Used by Elements: circle, ellipse, line, mesh, path, polygon, polyline,
rect, svg

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/shapeRendering>

-}
shapeRendering : ShapeRendering -> Attribute msg
shapeRendering rendering =
    attribute "shape-rendering" <| shapeRenderingToString rendering


{-| -}
slope : String -> Attribute msg
slope =
    attribute "slope"


{-| -}
spacing : String -> Attribute msg
spacing =
    attribute "spacing"


{-| -}
specularConstant : String -> Attribute msg
specularConstant =
    attribute "specularConstant"


{-| -}
specularExponent : String -> Attribute msg
specularExponent =
    attribute "specularExponent"


{-| -}
speed : String -> Attribute msg
speed =
    attribute "speed"


{-| -}
spreadMethod : String -> Attribute msg
spreadMethod =
    attribute "spreadMethod"


{-| -}
startOffset : String -> Attribute msg
startOffset =
    attribute "startOffset"


{-| -}
stdDeviation : String -> Attribute msg
stdDeviation =
    attribute "stdDeviation"


{-| -}
stemh : String -> Attribute msg
stemh =
    attribute "stemh"


{-| -}
stemv : String -> Attribute msg
stemv =
    attribute "stemv"


{-| -}
stitchTiles : String -> Attribute msg
stitchTiles =
    attribute "stitchTiles"


{-| -}
stopColor : String -> Attribute msg
stopColor =
    attribute "stop-color"


{-| -}
stopOpacity : Opacity -> Attribute msg
stopOpacity =
    attribute "stop-opacity" << opacityToString


{-| -}
strikethroughPosition : String -> Attribute msg
strikethroughPosition =
    attribute "strikethrough-position"


{-| -}
strikethroughThickness : String -> Attribute msg
strikethroughThickness =
    attribute "strikethrough-thickness"


{-| -}
string : String -> Attribute msg
string =
    attribute "string"


{-| -}
stroke : Color -> Attribute msg
stroke col =
    attribute "stroke" (toCssString col)


{-| -}
strokeDasharray : String -> Attribute msg
strokeDasharray =
    attribute "stroke-dasharray"


{-| -}
strokeDashoffset : String -> Attribute msg
strokeDashoffset =
    attribute "stroke-dashoffset"


{-| -}
strokeLinecap : StrokeLinecap -> Attribute msg
strokeLinecap =
    attribute "stroke-linecap" << strokeLinecapToString


{-| -}
strokeLinejoin : StrokeLinejoin -> Attribute msg
strokeLinejoin =
    attribute "stroke-linejoin" << strokeLinejoinToString


{-| -}
strokeMiterlimit : String -> Attribute msg
strokeMiterlimit =
    attribute "stroke-miterlimit"


{-| -}
strokeOpacity : Opacity -> Attribute msg
strokeOpacity =
    attribute "stroke-opacity" << opacityToString


{-| -}
strokeWidth : Length -> Attribute msg
strokeWidth length =
    attribute "stroke-width" <| lengthToString length


{-| The style attribute specifies style information for its element. It
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

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/style>

-}
style : String -> Attribute msg
style value =
    attribute "style" <| value


{-| -}
systemLanguage : String -> Attribute msg
systemLanguage =
    attribute "systemLanguage"


{-| -}
tableValues : String -> Attribute msg
tableValues =
    attribute "tableValues"


{-| -}
target : String -> Attribute msg
target =
    attribute "target"


{-| -}
textAnchor : AnchorAlignment -> Attribute msg
textAnchor anchorAlignment =
    attribute "text-anchor" <| anchorAlignmentToString anchorAlignment


{-| -}
textDecoration : String -> Attribute msg
textDecoration =
    attribute "text-decoration"


{-| The `textLength` attribute is intended to preserve a span of SVG text's
display width across a variety of conditions, such as webfonts not loading.

Used by Elements: text, tspan

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/textLength>

-}
textLength : Length -> Attribute msg
textLength length =
    attribute "textLength" <| lengthToString length


{-| -}
textRendering : TextRendering -> Attribute msg
textRendering =
    attribute "text-rendering" << textRenderingToString


{-| -}
title : String -> Attribute msg
title =
    attribute "title"


{-| This attribute indicates the final value of the attribute that will be
modified during the animation. The value of the attribute will change
between the from attribute value and this value. By default the change will
be linear.

When this attribute is used with the `set` element, it specifies the value
for the attribute during the duration of the `set` element.

Used by Elements: animate, animateColor, animateMotion, animateTransform

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/to>

-}
to : Float -> Attribute msg
to value =
    attribute "to" <| String.fromFloat value


{-| This attribute indicates the final values of 2 attributes that will be
modified during the animation. The values of the attributes will change
between the from2 attribute values and these values. By default the change will
be linear.

When this attribute is used with the `set` element, it specifies the value
for the attribute during the duration of the `set` element.

Used by Elements: animate, animateColor, animateMotion, animateTransform

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/to>

-}
to2 : Float -> Float -> Attribute msg
to2 a b =
    attribute "to" <| floatsToString [ a, b ]


{-| This attribute indicates the final values of 3 attributes that will be
modified during the animation. The values of the attributes will change
between the from3 attribute values and these value. By default the change will
be linear.

When this attribute is used with the `set` element, it specifies the value
for the attribute during the duration of the `set` element.

Used by Elements: animate, animateColor, animateMotion, animateTransform

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/to>

-}
to3 : Float -> Float -> Float -> Attribute msg
to3 a b c =
    attribute "to" <| floatsToString [ a, b, c ]


{-| The transform attribute defines a list of transform definitions that are
applied to an element and the element's children. The items in the transform
list are applied from right to left.

Used by Elements: a, circle, clipPath, defs, ellipse, foreignObject, g,
image, line, mesh, path, polygon, polyline, rect, switch, text, use, svg

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/transform>

-}
transform : List Transform -> Attribute msg
transform transforms =
    attribute "transform" <| String.join " " (List.map transformToString transforms)



-- type: see animateTransformType and contentType


{-| -}
u1 : String -> Attribute msg
u1 =
    attribute "u1"


{-| -}
u2 : String -> Attribute msg
u2 =
    attribute "u2"


{-| The underlinePosition attribute represents the ideal vertical position of
the underline. The underline position is expressed in the font's
coordinate system.

Used by Elements: fontFace

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/underline-position>

-}
underlinePosition : Float -> Attribute msg
underlinePosition position =
    attribute "underline-position" <| String.fromFloat position


{-| The underlineThickness attribute represents the ideal thickness of the
underline. The underline thickness is expressed in the font's coordinate
system.

Used by Elements: fontFace

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/underline-thickness>

-}
underlineThickness : Float -> Attribute msg
underlineThickness thickness =
    attribute "underline-thickness" <| String.fromFloat thickness


{-| -}
unicode : String -> Attribute msg
unicode =
    attribute "unicode"


{-| -}
unicodeBidi : String -> Attribute msg
unicodeBidi =
    attribute "unicode-bidi"


{-| -}
unicodeRange : String -> Attribute msg
unicodeRange =
    attribute "unicode-range"


{-| -}
unitsPerEm : String -> Attribute msg
unitsPerEm =
    attribute "units-per-em"


{-| -}
vAlphabetic : String -> Attribute msg
vAlphabetic =
    attribute "v-alphabetic"


{-| -}
vHanging : String -> Attribute msg
vHanging =
    attribute "v-hanging"


{-| -}
vIdeographic : String -> Attribute msg
vIdeographic =
    attribute "v-ideographic"


{-| -}
vMathematical : String -> Attribute msg
vMathematical =
    attribute "v-mathematical"



-- values: see animationValues and Filters.colorMatrixValues


{-| The version attribute is used to indicate what specification a SVG document
conforms to. It is only allowed on the root `svg` element. It is purely
advisory and has no influence on rendering or processing.

While it is specified to accept any number, the only two valid choices are
currently 1.0 and 1.1.

Used by Elements: svg

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/version>

-}
version : String -> Attribute msg
version versionNumber =
    attribute "version" versionNumber


{-| -}
vertAdvY : String -> Attribute msg
vertAdvY =
    attribute "vert-adv-y"


{-| -}
vertOriginX : String -> Attribute msg
vertOriginX =
    attribute "vert-origin-x"


{-| -}
vertOriginY : String -> Attribute msg
vertOriginY =
    attribute "vert-origin-y"


{-| The `viewBox` attribute allows you to specify that a given set of graphics
stretch to fit a particular container element.

`minX`, `minY`, `width` and `height` specify a rectangle in user space
which should be mapped to the bounds of the viewport established by the
given element, taking into account attribute `preserveAspectRatio`.

Negative values for `width` or `height` are not permitted, and a value of
zero disables rendering of the element.

Used by Elements: svg, symbol, image, marker, pattern, view

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/viewBox>

-}
viewBox : Float -> Float -> Float -> Float -> Attribute a
viewBox minX minY vWidth vHeight =
    [ minX, minY, vWidth, vHeight ]
        |> List.map String.fromFloat
        |> String.join " "
        |> attribute "viewBox"


{-| -}
viewTarget : String -> Attribute msg
viewTarget =
    attribute "viewTarget"


{-| -}
visibility : String -> Attribute msg
visibility =
    attribute "visibility"


{-| -}
width : Length -> Attribute msg
width length =
    attribute "width" <| lengthToString length


{-| -}
widths : String -> Attribute msg
widths =
    attribute "widths"


{-| -}
wordSpacing : String -> Attribute msg
wordSpacing =
    attribute "word-spacing"


{-| -}
writingMode : String -> Attribute msg
writingMode =
    attribute "writing-mode"


{-| -}
x : Length -> Attribute msg
x length =
    attribute "x" <| lengthToString length


{-| -}
xHeight : String -> Attribute msg
xHeight =
    attribute "x-height"


{-| This attribute defines the x-axis coordinate of the start of a line or
linearGradient.

If the attribute is not specified, the effect is as if a value of 0
(or 0%, in the case of a linearGradient) were specified.

Used by Elements: line, linearGradient

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/x1>

-}
x1 : Length -> Attribute msg
x1 position =
    attribute "x1" <| lengthToString position


{-| This attribute defines the x-axis coordinate of the end of a line or
linearGradient.

If the attribute is not specified, the effect is as if a value of 0
(or 0%, in the case of a linearGradient) were specified.

Used by Elements: line, linearGradient

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/x1>

-}
x2 : Length -> Attribute msg
x2 position =
    attribute "x2" <| lengthToString position


{-| -}
xChannelSelector : String -> Attribute msg
xChannelSelector =
    attribute "xChannelSelector"


{-| -}
xlinkActuate : String -> Attribute msg
xlinkActuate =
    attributeNS "http://www.w3.org/1999/xlink" "xlink:actuate"


{-| -}
xlinkArcrole : String -> Attribute msg
xlinkArcrole =
    attributeNS "http://www.w3.org/1999/xlink" "xlink:arcrole"


{-| -}
xlinkHref : String -> Attribute msg
xlinkHref =
    attributeNS "http://www.w3.org/1999/xlink" "xlink:href"


{-| -}
xlinkRole : String -> Attribute msg
xlinkRole =
    attributeNS "http://www.w3.org/1999/xlink" "xlink:role"


{-| This attribute is provided for backwards compatibility with SVG 1.1. It
provides documentation to XLink-aware processors. In case of a conflict,
the target attribute has priority, since it can express a wider range of
values.

Used by Elements: a, altGlyph, animate, animateColor, animateMotion,
animateTransform, colorProfile, cursor, feImage, filter, fontFaceUri, glyphRef,
image, linearGradient, mpath, pattern, radialGradient, script, set, textPath,
tref, use

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/xlinkShow>

-}
xlinkShow : String -> Attribute msg
xlinkShow str =
    attribute "xlinkShow" str


{-| The xlinkTitle attribute is used to describe the meaning of a link or
resource in a human-readable fashion, along the same lines as the xlinkRole
or xlinkArcrole attribute. It is a string that describes the resource.
In general it is preferable to use a `title` child element rather than a
xlinkTitle attribute.

Used by Elements: a, altGlyph, animate, animateColor, animateMotion,
animateTransform, colorProfile, cursor, feImage, filter, fontFaceUri, glyphRef,
image, linearGradient, mpath, pattern, radialGradient, script, set, textPath,
tref, use

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/xlinkTitle>

-}
xlinkTitle : String -> Attribute msg
xlinkTitle str =
    attribute "xlinkTitle" str


{-| -}
xlinkType : String -> Attribute msg
xlinkType =
    attributeNS "http://www.w3.org/1999/xlink" "xlink:type"


{-| -}
xmlBase : String -> Attribute msg
xmlBase =
    attributeNS "http://www.w3.org/XML/1998/namespace" "xml:base"


{-| -}
xmlLang : String -> Attribute msg
xmlLang =
    attributeNS "http://www.w3.org/XML/1998/namespace" "xml:lang"


{-| -}
xmlSpace : String -> Attribute msg
xmlSpace =
    attributeNS "http://www.w3.org/XML/1998/namespace" "xml:space"


{-| -}
y : Length -> Attribute msg
y length =
    attribute "y" <| lengthToString length


{-| This attribute defines the y-axis coordinate of the start of a line or
linearGradient.

If the attribute is not specified, the effect is as if a value of 0
(or 0%, in the case of a linearGradient) were specified.

Used by Elements: line, linearGradient

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/y1>

-}
y1 : Length -> Attribute msg
y1 position =
    attribute "y1" <| lengthToString position


{-| This attribute defines the y-axis coordinate of the end of a line or
linearGradient.

If the attribute is not specified, the effect is as if a value of 0
(or 0%, in the case of a linearGradient) were specified.

Used by Elements: line, linearGradient

See: <https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/y1>

-}
y2 : Length -> Attribute msg
y2 position =
    attribute "y2" <| lengthToString position


{-| -}
yChannelSelector : String -> Attribute msg
yChannelSelector =
    attribute "yChannelSelector"



-- z: see Filters.z


{-| -}
zoomAndPan : String -> Attribute msg
zoomAndPan =
    attribute "zoomAndPan"



-- Helpers - not exposed


floatsToString : List Float -> String
floatsToString floatsList =
    floatsList
        |> List.map String.fromFloat
        |> String.join " "



-- Misc Additions
-- svgBox : ( number, Float ) -> List (Svg msg) -> Html msg
-- svgBox ( width, height ) =
--     svg [ viewBox 0 0 800 600 ]
