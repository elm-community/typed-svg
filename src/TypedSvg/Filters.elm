module TypedSvg.Filters exposing (..)

{-| SVG Filter Elements

    Typical usage:

        import TypedSvg.Filters as Fe
        import TypedSvg.Filters.Attributes exposing (..)

        Fe.filter []
            [ Fe.blend [in InSourceGraphic, in2 InFillPaint, mode ModeMultiply] []
            ]
-}

import TypedSvg.Core exposing (Attribute, Svg, node)


{-|
    The `Filters.blend` SVG filter primitive composes two objects together
    ruled by a certain blending mode. This is similar to what is known from
    image editing software when blending two layers. The mode is defined by the
    `mode` attribute.

    Specific Attributes: in, in2, mode

    Global Attributes: id, class, height, result, style, tabindex, width, x, y

    Presentation Attributes (dasherize for CSS stylesheets): alignmentBaseline,
        baselineShift, clip, clipPath, clipRule, color, colorInterpolation,
        colorInterpolationFilters, colorProfile, colorRendering, cursor,
        direction, display, dominantBaseline, enableBackground, fill,
        fillOpacity, fillRule, filter, floodColor, floodOpacity, fontFamily,
        fontSize, fontSizeAdjust, fontStretch, fontStyle, fontVariant,
        fontWeight, glyphOrientationHorizontal, glyphOrientationVertical,
        imageRendering, kerning, letterSpacing, lightingColor, markerEnd,
        markerMid, markerStart, mask, opacity, overflow, pointerEvents,
        shapeRendering, stopColor, stopOpacity, stroke, strokeDasharray,
        strokeDashoffset, strokeLinecap, strokeLinejoin, strokeMiterlimit,
        strokeOpacity, strokeWidth, textAnchor, textDecoration, textRendering,
        unicodeBidi, visibility, wordSpacing, writingMode

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feBlend
-}
blend : List (Attribute msg) -> List (Svg msg) -> Svg msg
blend =
    node "feBlend"
