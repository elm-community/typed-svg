module TypedSvg.Types exposing
    ( Accumulate(..), Additive(..), Align(..), AlignmentBaseline(..), AnchorAlignment(..), AnimateTransformType(..), AttributeType(..), BaselineShift(..), BezierAnchorPoint, CalcMode(..), Clip(..), ClipPath(..), ClipRule(..), ClockValue, ColorInterpolation(..), ColorMatrixType(..), ColorProfile(..), CompositeOperator(..), CoordinateSystem(..), Cursor(..), Direction(..), Display(..), DominantBaseline(..), Duration(..), EdgeMode(..), FillRule(..), Filter(..), FloodColor(..), FontSizeAdjust(..), FontStretch(..), FontStyle(..), FontVariant(..), FontWeight(..), FuncType(..), InValue(..), Kerning(..), Length(..), LengthAdjust(..), MarkerCoordinateSystem(..), MeetOrSlice(..), Mode(..), MorphologyOperator(..), Opacity(..), Rendering(..), RepeatCount(..), Restart(..), Scale(..), ShapeRendering(..), TimingValue(..), Transform(..), TurbulenceType(..), YesNo(..)
    , Fill(..), StrokeLinecap(..), StrokeLinejoin(..), TextRendering(..)
    , cm, em, ex, inch, mm, num, pc, percent, pt, px
    -- Lengths
    )

{-| The Types module defines all of the types used by TypedSvg.


# Types

@docs Accumulate, Additive, Align, AlignmentBaseline, AnchorAlignment, AnimateTransformType, AttributeType, BaselineShift, BezierAnchorPoint, CalcMode, Clip, ClipPath, ClipRule, ClockValue, ColorInterpolation, ColorMatrixType, ColorProfile, CompositeOperator, CoordinateSystem, Cursor, Direction, Display, DominantBaseline, Duration, EdgeMode, FillRule, Filter, FloodColor, FontSizeAdjust, FontStretch, FontStyle, FontVariant, FontWeight, FuncType, InValue, Kerning, Length, LengthAdjust, MarkerCoordinateSystem, MeetOrSlice, Mode, MorphologyOperator, Opacity, Rendering, RepeatCount, Restart, Scale, ShapeRendering, TimingValue, Transform, TurbulenceType, YesNo
@docs Fill, StrokeLinecap, StrokeLinejoin, TextRendering

@docs cm, em, ex, inch, mm, num, pc, percent, pt, px

-}

import TypedSvg.Color exposing (Color)


{-| -}
type Accumulate
    = AccumulateNone
    | AccumulateSum


{-| -}
type Additive
    = AdditiveNone
    | AdditiveReplace


{-| -}
type Align
    = Align Scale Scale
    | AlignNone


{-| -}
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


{-| -}
type AnchorAlignment
    = AnchorInherit
    | AnchorStart
    | AnchorMiddle
    | AnchorEnd


{-| -}
type AnimateTransformType
    = AnimateTransformTypeTranslate
    | AnimateTransformTypeScale
    | AnimateTransformTypeRotate
    | AnimateTransformTypeSkewX
    | AnimateTransformTypeSkewY


{-| -}
type AttributeType
    = AttributeTypeAuto
    | AttributeTypeCss
    | AttributeTypeXml


{-| -}
type BaselineShift
    = ShiftAuto
    | ShiftBaseline
    | ShiftSuper
    | ShiftSub
    | ShiftPercentage Float
    | ShiftLength Length
    | ShiftInherit


{-| -}
type alias BezierAnchorPoint =
    { x1 : Float, y1 : Float, x2 : Float, y2 : Float }


{-| -}
type CalcMode
    = CalcModeDiscrete
    | CalcModeLinear
    | CalcModePaced
    | CalcModeSpline


{-| -}
type Clip
    = ClipAuto
    | ClipInherit
    | ClipShape Length Length Length Length


{-| -}
type ClipPath
    = ClipPathNone
    | ClipPathInherit
    | ClipPathFunc String


{-| -}
type ClipRule
    = ClipRuleNonZero
    | ClipRuleEvenOdd
    | ClipRuleInherit


{-| In a future version of TypedSvg, this may be turned into a DSL
-}
type alias ClockValue =
    String


{-| -}
type ColorInterpolation
    = ColorInterpolationAuto
    | ColorInterpolationSRGB
    | ColorInterpolationLinearRGB
    | ColorInterpolationInherit


{-| -}
type ColorMatrixType
    = ColorMatrixTypeMatrix
    | ColorMatrixTypeSaturate
    | ColorMatrixTypeHueRotate
    | ColorMatrixTypeLuminanceToAlpha


{-| -}
type ColorProfile
    = ColorProfileAuto
    | ColorProfileSRGB
    | ColorProfile String
    | ColorProfileInherit


{-| -}
type CompositeOperator
    = CompositeOperatorOver
    | CompositeOperatorIn
    | CompositeOperatorOut
    | CompositeOperatorAtop
    | CompositeOperatorXor
    | CompositeOperatorArithmetic


{-| -}
type CoordinateSystem
    = CoordinateSystemUserSpaceOnUse
    | CoordinateSystemObjectBoundingBox


{-| -}
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


{-| -}
type Direction
    = DirectionLTR
    | DirectionRTL
    | DirectionInherit


{-| -}
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


{-| -}
type DominantBaseline
    = DominantBaselineAuto
    | DominantBaselineUseScript
    | DominantBaselineNoChange
    | DominantBaselineResetSize
    | DominantBaselineIdeographic
    | DominantBaselineAlphabetic
    | DominantBaselineHanging
    | DominantBaselineMathematical
    | DominantBaselineCentral
    | DominantBaselineMiddle
    | DominantBaselineTextAfterEdge
    | DominantBaselineTextBeforeEdge
    | DominantBaselineInherit


{-| -}
type Duration
    = Duration ClockValue
    | DurationIndefinite


{-| -}
type EdgeMode
    = EdgeModeDuplicate
    | EdgeModeWrap
    | EdgeModeNone


{-| -}
type FillRule
    = FillRuleNonZero
    | FillRuleEvenOdd


{-| -}
type Fill
    = Fill Color
    | FillNone


{-| -}
type Filter
    = FilterNone
    | FilterInherit
    | Filter String


{-| -}
type FloodColor
    = FloodInherit
    | FloodCurrentColor
    | Flood Color
    | FloodICC String


{-| -}
type FontSizeAdjust
    = FontSizeAdjustNone
    | FontSizeAdjustInherit
    | FontSizeAdjust Float


{-| -}
type FontStretch
    = FontStretchNormal
    | FontStretchWider
    | FontStretchNarrower
    | FontStretchUltraCondensed
    | FontStretchExtraCondensed
    | FontStretchCondensed
    | FontStretchSemiCondensed
    | FontStretchSemiExpanded
    | FontStretchExpanded
    | FontStretchExtraExpanded
    | FontStretchUltraExpanded
    | FontStretchInherit


{-| -}
type FontStyle
    = FontStyleNormal
    | FontStyleItalic
    | FontStyleOblique
    | FontStyleInherit


{-| -}
type FontVariant
    = FontVariantNormal
    | FontVariantSmallCaps
    | FontVariantInherit


{-| -}
type FontWeight
    = FontWeightNormal
    | FontWeightBold
    | FontWeightBolder
    | FontWeightLighter
    | FontWeightInherit
    | FontWeight Int


{-| -}
type FuncType
    = FuncTypeIdentity
    | FuncTypeTable
    | FuncTypeDiscrete
    | FuncTypeLinear
    | FuncTypeGamma


{-| -}
type InValue
    = InSourceGraphic
    | InSourceAlpha
    | InBackgroundAlpha
    | InFillPaint
    | InStrokePaint
    | InReference String


{-| -}
type Kerning
    = KerningAuto
    | KerningInherit
    | KerningLength Length


{-| The Length type is an important type in the TypedSvg package--it is used
wherever CSS needs to measure a length or distance in a certain unit (px,
em, etc.)
-}
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


{-| Length expressed as a centimeter
-}
cm : Float -> Length
cm =
    Cm


{-| Length expressed as an `em`
-}
em : Float -> Length
em =
    Em


{-| Length expressed as a `ex`
-}
ex : Float -> Length
ex =
    Ex


{-| Length expressed as an inch
-}
inch : Float -> Length
inch =
    In


{-| Length expressed as a millimeter
-}
mm : Float -> Length
mm =
    Mm


{-| Length expressed as a raw number
-}
num : Float -> Length
num =
    Num


{-| Length expressed as a `pc`
-}
pc : Float -> Length
pc =
    Pc


{-| Length expressed as a percentage
-}
percent : Float -> Length
percent =
    Percent


{-| Length expressed in points
-}
pt : Float -> Length
pt =
    Pt


{-| Length expressed in pixels
-}
px : Float -> Length
px =
    Px


{-| -}
type LengthAdjust
    = LengthAdjustSpacing
    | LengthAdjustSpacingAndGlyphs


{-| -}
type MarkerCoordinateSystem
    = MarkerCoordinateSystemUserSpaceOnUse
    | MarkerCoordinateSystemStrokeWidth


{-| -}
type MeetOrSlice
    = Meet
    | Slice


{-| -}
type Mode
    = ModeNormal
    | ModeMultiply
    | ModeScreen
    | ModeDarken
    | ModeLighten


{-| -}
type MorphologyOperator
    = MorphologyOperatorErode
    | MorphologyOperatorDilate


{-| -}
type Opacity
    = Opacity Float
    | OpacityInherit


{-| -}
type Rendering
    = RenderingAuto
    | RenderingOptimizeSpeed
    | RenderingOptimizeQuality
    | RenderingInherit


{-| -}
type RepeatCount
    = RepeatCount Float
    | RepeatIndefinite


{-| -}
type Restart
    = RestartAlways
    | RestartWhenNotActive
    | RestartNever


{-| -}
type Scale
    = ScaleMin
    | ScaleMid
    | ScaleMax


{-| -}
type ShapeRendering
    = RenderAuto
    | RenderOptimizeSpeed
    | RenderCrispEdges
    | RenderGeometricPrecision
    | RenderInherit


{-| The stroke-linecap attribute specifies the shape to be used at the end of open subpaths when they are
stroked.
-}
type StrokeLinecap
    = StrokeLinecapButt
    | StrokeLinecapRound
    | StrokeLinecapSquare
    | StrokeLinecapInherit


{-| The stroke-linejoin attribute specifies the shape to be used at the corners of paths or basic shapes
when they are stroked.

As a presentation attribute, it also can be used as a property directly inside a CSS stylesheet.

Note: the final appearence of the miter option is also influenced by the stroke-miterlimit attribute.

-}
type StrokeLinejoin
    = StrokeLinejoinMiter
    | StrokeLinejoinRound
    | StrokeLinejoinBevel
    | StrokeLinejoinInherit


{-| The Transform type is used by `transform` and `gradientTransform`
-}
type Transform
    = Matrix Float Float Float Float Float Float
    | Rotate Float Float Float
    | Scale Float Float
    | SkewX Float
    | SkewY Float
    | Translate Float Float


{-| The creator of SVG content might want to provide a hint about what tradeoffs to make as the browser
renders text. The text-rendering attribute provides these hints.

As a presentation attribute, it also can be used as a property directly inside a CSS stylesheet, see css text-rendering for further information

-}
type TextRendering
    = TextRenderingAuto
    | TextRenderingOptimizeSpeed
    | TextRenderingOptimizeLegibility
    | TextRenderingGeometricPrecision
    | TextRenderingInherit


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


{-| -}
type TurbulenceType
    = TurbulenceTypeFractalNoise
    | TurbulenceTypeTurbulence


{-| Used by allowReorder
-}
type YesNo
    = Yes
    | No
