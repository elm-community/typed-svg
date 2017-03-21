module TypedSvg.Types exposing (..)

import Color exposing (Color)
import Color.Convert exposing (colorToCssRgba)


boolToString : Bool -> String
boolToString bool =
    case bool of
        True ->
            "true"

        False ->
            "false"


type Accumulate
    = AccumulateNone
    | AccumulateSum


accumulateToString : Accumulate -> String
accumulateToString accumulate =
    case accumulate of
        AccumulateNone ->
            "none"

        AccumulateSum ->
            "sum"


type Additive
    = AdditiveNone
    | AdditiveReplace


additiveToString : Additive -> String
additiveToString additive =
    case additive of
        AdditiveNone ->
            "none"

        AdditiveReplace ->
            "replace"


type Align
    = Align Scale Scale
    | AlignNone


alignToString : Align -> String
alignToString align =
    case align of
        AlignNone ->
            "none"

        Align x y ->
            "x" ++ (scaleToString x) ++ "y" ++ (scaleToString y)


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


alignmentBaselineToString : AlignmentBaseline -> String
alignmentBaselineToString alignmentBaseline =
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


type AnchorAlignment
    = AnchorInherit
    | AnchorStart
    | AnchorMiddle
    | AnchorEnd


anchorAlignmentToString : AnchorAlignment -> String
anchorAlignmentToString anchorAlignment =
    case anchorAlignment of
        AnchorInherit ->
            "inherit"

        AnchorStart ->
            "start"

        AnchorMiddle ->
            "middle"

        AnchorEnd ->
            "end"


type AnimateTransformType
    = AnimateTransformTypeTranslate
    | AnimateTransformTypeScale
    | AnimateTransformTypeRotate
    | AnimateTransformTypeSkewX
    | AnimateTransformTypeSkewY


animateTransformTypeToString : AnimateTransformType -> String
animateTransformTypeToString animateTransformType =
    case animateTransformType of
        AnimateTransformTypeTranslate ->
            "translate"

        AnimateTransformTypeScale ->
            "scale"

        AnimateTransformTypeRotate ->
            "rotate"

        AnimateTransformTypeSkewX ->
            "skewX"

        AnimateTransformTypeSkewY ->
            "skewY"


type AttributeType
    = AttributeTypeAuto
    | AttributeTypeCss
    | AttributeTypeXml


attributeTypeToString : AttributeType -> String
attributeTypeToString attributeType =
    case attributeType of
        AttributeTypeAuto ->
            "auto"

        AttributeTypeCss ->
            "CSS"

        AttributeTypeXml ->
            "XML"


type BaselineShift
    = ShiftAuto
    | ShiftBaseline
    | ShiftSuper
    | ShiftSub
    | ShiftPercentage Float
    | ShiftLength Length
    | ShiftInherit


baselineShiftToString : BaselineShift -> String
baselineShiftToString baselineShift =
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


type alias BezierAnchorPoint =
    ( Float, Float, Float, Float )


type CalcMode
    = CalcModeDiscrete
    | CalcModeLinear
    | CalcModePaced
    | CalcModeSpline


calcModeToString : CalcMode -> String
calcModeToString calcMode =
    case calcMode of
        CalcModeDiscrete ->
            "discrete"

        CalcModeLinear ->
            "linear"

        CalcModePaced ->
            "paced"

        CalcModeSpline ->
            "spline"


type Clip
    = ClipAuto
    | ClipInherit
    | ClipShape Length Length Length Length


clipToString : Clip -> String
clipToString clip =
    case clip of
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


type ClipPath
    = ClipPathNone
    | ClipPathInherit
    | ClipPathFunc String


clipPathToString : ClipPath -> String
clipPathToString clipPath =
    case clipPath of
        ClipPathNone ->
            "none"

        ClipPathInherit ->
            "inherit"

        ClipPathFunc value ->
            value


type ClipRule
    = ClipRuleNonZero
    | ClipRuleEvenOdd
    | ClipRuleInherit


clipRuleToString : ClipRule -> String
clipRuleToString clipRule =
    case clipRule of
        ClipRuleNonZero ->
            "nonzero"

        ClipRuleEvenOdd ->
            "evenodd"

        ClipRuleInherit ->
            "inherit"


{-| In a future version of TypedSvg, this may be turned into a DSL
-}
type alias ClockValue =
    String


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


type ColorMatrixType
    = ColorMatrixTypeMatrix
    | ColorMatrixTypeSaturate
    | ColorMatrixTypeHueRotate
    | ColorMatrixTypeLuminanceToAlpha


colorMatrixTypeToString : ColorMatrixType -> String
colorMatrixTypeToString colorMatrixType =
    case colorMatrixType of
        ColorMatrixTypeMatrix ->
            "matrix"

        ColorMatrixTypeSaturate ->
            "saturate"

        ColorMatrixTypeHueRotate ->
            "hueRotate"

        ColorMatrixTypeLuminanceToAlpha ->
            "luminanceToAlpha"


type ColorProfile
    = ColorProfileAuto
    | ColorProfileSRGB
    | ColorProfile String
    | ColorProfileInherit


colorProfileToString : ColorProfile -> String
colorProfileToString colorProfile =
    case colorProfile of
        ColorProfileAuto ->
            "auto"

        ColorProfileSRGB ->
            "sRGB"

        ColorProfile name ->
            name

        ColorProfileInherit ->
            "inherit"


type ColorRendering
    = ColorRenderingAuto
    | ColorRenderingOptimizeSpeed
    | ColorRenderingOptimizeQuality
    | ColorRenderingInherit


colorRenderingToString : ColorRendering -> String
colorRenderingToString colorRendering =
    case colorRendering of
        ColorRenderingAuto ->
            "auto"

        ColorRenderingOptimizeSpeed ->
            "optimizeSpeed"

        ColorRenderingOptimizeQuality ->
            "optimizeQuality"

        ColorRenderingInherit ->
            "inherit"


type CompositeOperator
    = CompositeOperatorOver
    | CompositeOperatorIn
    | CompositeOperatorOut
    | CompositeOperatorAtop
    | CompositeOperatorXor
    | CompositeOperatorArithmetic


compositeOperatorToString : CompositeOperator -> String
compositeOperatorToString compositeOperator =
    case compositeOperator of
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


type CoordinateSystem
    = CoordinateSystemUserSpaceOnUse
    | CoordinateSystemObjectBoundingBox


{-| CoordinateSystem is used by filter and clip
-}
coordinateSystemToString : CoordinateSystem -> String
coordinateSystemToString coordinateSystem =
    case coordinateSystem of
        CoordinateSystemUserSpaceOnUse ->
            "userSpaceOnUse"

        CoordinateSystemObjectBoundingBox ->
            "objectBoundingBox"


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


cursorToString : Cursor -> String
cursorToString cursor =
    case cursor of
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


type Direction
    = DirectionLTR
    | DirectionRTL
    | DirectionInherit


directionToString : Direction -> String
directionToString direction =
    case direction of
        DirectionLTR ->
            "ltr"

        DirectionRTL ->
            "rtl"

        DirectionInherit ->
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


displayToString : Display -> String
displayToString display =
    case display of
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


dominantBaselineToString : DominantBaseline -> String
dominantBaselineToString dominantBaseline =
    case dominantBaseline of
        DominantBaselineAuto ->
            "auto"

        DominantBaselineUseScript ->
            "use-script"

        DominantBaselineNoChange ->
            "no-change"

        DominantBaselineResetSize ->
            "reset-size"

        DominantBaselineIdeographic ->
            "ideographic"

        DominantBaselineAlphabetic ->
            "alphabetic"

        DominantBaselineHanging ->
            "hanging"

        DominantBaselineMathematical ->
            "mathematical"

        DominantBaselineCentral ->
            "central"

        DominantBaselineMiddle ->
            "middle"

        DominantBaselineTextAfterEdge ->
            "text-after-edge"

        DominantBaselineTextBeforeEdge ->
            "text-before-edge"

        DominantBaselineInherit ->
            "inherit"


type Duration
    = Duration ClockValue
    | DurationIndefinite


durationToString : Duration -> String
durationToString duration =
    case duration of
        Duration clockValue ->
            clockValue

        DurationIndefinite ->
            "indefinite"


type EdgeMode
    = EdgeModeDuplicate
    | EdgeModeWrap
    | EdgeModeNone


edgeModeToString : EdgeMode -> String
edgeModeToString edgeMode =
    case edgeMode of
        EdgeModeDuplicate ->
            "duplicate"

        EdgeModeWrap ->
            "wrap"

        EdgeModeNone ->
            "none"


type FillRule
    = FillRuleNonZero
    | FillRuleEvenOdd


fillRuleToString : FillRule -> String
fillRuleToString fillRule =
    case fillRule of
        FillRuleNonZero ->
            "nonzero"

        FillRuleEvenOdd ->
            "evenodd"


type Filter
    = FilterNone
    | FilterInherit
    | Filter String


filterToString : Filter -> String
filterToString f =
    case f of
        FilterNone ->
            "none"

        FilterInherit ->
            "inherit"

        Filter funcIRI ->
            funcIRI


type FloodColor
    = FloodInherit
    | FloodCurrentColor
    | Flood Color
    | FloodICC String


floodColorToString : FloodColor -> String
floodColorToString floodColor =
    case floodColor of
        FloodInherit ->
            "inherit"

        FloodCurrentColor ->
            "currentColor"

        Flood color ->
            colorToCssRgba color

        FloodICC iccColor ->
            iccColor


type FontSizeAdjust
    = FontSizeAdjustNone
    | FontSizeAdjustInherit
    | FontSizeAdjust Float


fontSizeAdjustToString : FontSizeAdjust -> String
fontSizeAdjustToString fontSizeAdjust =
    case fontSizeAdjust of
        FontSizeAdjustNone ->
            "none"

        FontSizeAdjustInherit ->
            "inherit"

        FontSizeAdjust aspect ->
            toString aspect


type FuncType
    = FuncTypeIdentity
    | FuncTypeTable
    | FuncTypeDiscrete
    | FuncTypeLinear
    | FuncTypeGamma


funcTypeToString : FuncType -> String
funcTypeToString funcType =
    case funcType of
        FuncTypeIdentity ->
            "identity"

        FuncTypeTable ->
            "table"

        FuncTypeDiscrete ->
            "discrete"

        FuncTypeLinear ->
            "linear"

        FuncTypeGamma ->
            "gamma"


type InValue
    = InSourceGraphic
    | InSourceAlpha
    | InBackgroundAlpha
    | InFillPaint
    | InStrokePaint
    | InReference String


inValueToString : InValue -> String
inValueToString inValue =
    case inValue of
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


type Kerning
    = KerningAuto
    | KerningInherit
    | KerningLength Length


kerningToString : Kerning -> String
kerningToString kerning =
    case kerning of
        KerningAuto ->
            "auto"

        KerningInherit ->
            "inherit"

        KerningLength length ->
            lengthToString length


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


cm : Float -> Length
cm =
    Cm


em : Float -> Length
em =
    Em


ex : Float -> Length
ex =
    Ex


inch : Float -> Length
inch =
    In


mm : Float -> Length
mm =
    Mm


num : Float -> Length
num =
    Num


pc : Float -> Length
pc =
    Pc


percent : Float -> Length
percent =
    Percent


pt : Float -> Length
pt =
    Pt


px : Float -> Length
px =
    Px


lengthToString : Length -> String
lengthToString length =
    case length of
        Cm x ->
            toString x ++ "cm"

        Em x ->
            toString x ++ "em"

        Ex x ->
            toString x ++ "ex"

        In x ->
            toString x ++ "in"

        Mm x ->
            toString x ++ "mm"

        Num x ->
            toString x

        Pc x ->
            toString x ++ "pc"

        Percent x ->
            toString x ++ "%"

        Pt x ->
            toString x ++ "pt"

        Px x ->
            toString x ++ "px"


type LengthAdjust
    = LengthAdjustSpacing
    | LengthAdjustSpacingAndGlyphs


lengthAdjustToString : LengthAdjust -> String
lengthAdjustToString lengthAdjust =
    case lengthAdjust of
        LengthAdjustSpacing ->
            "spacing"

        LengthAdjustSpacingAndGlyphs ->
            "spacingAndGlyphs"


type MarkerCoordinateSystem
    = MarkerCoordinateSystemUserSpaceOnUse
    | MarkerCoordinateSystemStrokeWidth


markerCoordinateSystemToString : MarkerCoordinateSystem -> String
markerCoordinateSystemToString markerCoordinateSystem =
    case markerCoordinateSystem of
        MarkerCoordinateSystemUserSpaceOnUse ->
            "userSpaceOnUse"

        MarkerCoordinateSystemStrokeWidth ->
            "strokeWidth"


type MeetOrSlice
    = Meet
    | Slice


meetOrSliceToString : MeetOrSlice -> String
meetOrSliceToString meetOrSlice =
    case meetOrSlice of
        Meet ->
            "meet"

        Slice ->
            "slice"


type Mode
    = ModeNormal
    | ModeMultiply
    | ModeScreen
    | ModeDarken
    | ModeLighten


modeToString : Mode -> String
modeToString mode =
    case mode of
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


type MorphologyOperator
    = MorphologyOperatorErode
    | MorphologyOperatorDilate


morphologyOperatorToString : MorphologyOperator -> String
morphologyOperatorToString morphologyOperator =
    case morphologyOperator of
        MorphologyOperatorErode ->
            "erode"

        MorphologyOperatorDilate ->
            "dilate"


type Opacity
    = Opacity Float
    | OpacityInherit


opacityToString : Opacity -> String
opacityToString opacity =
    case opacity of
        Opacity n ->
            (toString n)

        OpacityInherit ->
            "inherit"


type RepeatCount
    = RepeatCount Float
    | RepeatIndefinite


repeatCountToString : RepeatCount -> String
repeatCountToString repeatCount =
    case repeatCount of
        RepeatCount count ->
            toString count

        RepeatIndefinite ->
            "indefinite"


type Restart
    = RestartAlways
    | RestartWhenNotActive
    | RestartNever


restartToString : Restart -> String
restartToString restart =
    case restart of
        RestartAlways ->
            "always"

        RestartWhenNotActive ->
            "whenNotActive"

        RestartNever ->
            "never"


type Scale
    = ScaleMin
    | ScaleMid
    | ScaleMax


scaleToString : Scale -> String
scaleToString scale =
    case scale of
        ScaleMin ->
            "min"

        ScaleMid ->
            "mid"

        ScaleMax ->
            "max"


type ShapeRendering
    = RenderAuto
    | RenderOptimizeSpeed
    | RenderCrispEdges
    | RenderGeometricPrecision
    | RenderInherit


shapeRenderingToString : ShapeRendering -> String
shapeRenderingToString shapeRendering =
    case shapeRendering of
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


type TurbulenceType
    = TurbulenceTypeFractalNoise
    | TurbulenceTypeTurbulence


turbulenceTypeToString : TurbulenceType -> String
turbulenceTypeToString turbulenceType =
    case turbulenceType of
        TurbulenceTypeFractalNoise ->
            "fractalNoise"

        TurbulenceTypeTurbulence ->
            "turbulence"
