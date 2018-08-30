module TypedSvg.Filters exposing
    ( blend, colorMatrix, componentTransfer, composite, convolveMatrix, diffuseLighting, displacementMap, flood, funcA, funcB, funcG, funcR, gaussianBlur, image, merge, mergeNode, morphology, offset, specularLighting, tile, turbulence
    , distantLight, pointLight, spotLight
    )

{-| SVG Filter Elements

    Typical usage:

        import TypedSvg.Filters as Fe
        import TypedSvg.Filters.Attributes exposing (..)

        Fe.filter []
            [ Fe.blend [in InSourceGraphic, in2 InFillPaint, mode ModeMultiply] []
            ]

@docs blend, colorMatrix, componentTransfer, composite, convolveMatrix, diffuseLighting, displacementMap, flood, funcA, funcB, funcG, funcR, gaussianBlur, image, merge, mergeNode, morphology, offset, specularLighting, tile, turbulence


# Light source elements

@docs distantLight, pointLight, spotLight

-}

import TypedSvg.Core exposing (Attribute, Svg, node)


{-|

    The `Filters.blend` SVG filter primitive composes two objects together
    ruled by a certain blending mode. This is similar to what is known from
    image editing software when blending two layers. The mode is defined by the
    `mode` attribute.

    Attributes: in, in2, mode

    Global Attributes: id, class, height, result, style, tabindex, width, x, y

    Presentation Attributes

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feBlend

-}
blend : List (Attribute msg) -> List (Svg msg) -> Svg msg
blend =
    node "feBlend"


{-|

    The `colorMatrix` SVG filter element changes colors based on a
    transformation matrix. Every pixel's color value (represented by an
    [R,G,B,A] vector) is matrix multiplied to create a new color.

    Specific Attributes: in, colorMatrixType, colorMatrixValues

    Global Attributes: id, class, height, result, style, tabindex, width, x, y

    Presentation Attributes

-}
colorMatrix : List (Attribute msg) -> List (Svg msg) -> Svg msg
colorMatrix =
    node "feColorMatrix"


{-|

    The `componentTransfer` SVG filter primitive performs color-component-wise
    remapping of data for each pixel. It allows operations like brightness
    adjustment, contrast adjustment, color balance or thresholding.

    The calculations are performed on non-premultiplied color values. The colors
    are modified by changing each channel (R, G, B, and A) to the result of what
    the children `funcR`, `funcB`, `funcG`, and `funcA` return.

    Specific Attributes: in

    Global Attributes: id, class, height, result, style, tabindex, width, x, y

    Presentation Attributes

-}
componentTransfer : List (Attribute msg) -> List (Svg msg) -> Svg msg
componentTransfer =
    node "feComponentTransfer"


{-|

    This filter primitive performs the combination of two input images
    pixel-wise in image space using one of the Porter-Duff compositing
    operations:

        over, in, atop, out, xor, and lighter

    Additionally, a component-wise arithmetic operation (with the result clamped
    between [0..1]) can be applied.

    The arithmetic operation is useful for combining the output from the
    `diffuseLighting` and `specularLighting` filters with texture data. If the
    arithmetic operation is chosen, each result pixel is computed using the
    following formula:

        result = k1*i1*i2 + k2*i1 + k3*i2 + k4

    where:

    `i1` and `i2` indicate the corresponding pixel channel values of the input
    image, which map to `in` and `in2` respectively.

    `k1`, `k2`, `k3` and `k4` indicate the values of the attributes with the
    same name.

    Specific Attributes: in, in2, compositeOperator, k1, k2, k3, k4

    Global Attributes: id, class, height, result, style, tabindex, width, x, y

    Presentation Attributes

-}
composite : List (Attribute msg) -> List (Svg msg) -> Svg msg
composite =
    node "feComposite"


{-|

    The `convolveMatrix` SVG filter primitive applies a matrix convolution
    filter effect. A convolution combines pixels in the input image with
    neighboring pixels to produce a resulting image. A wide variety of imaging
    operations can be achieved through convolutions, including blurring, edge
    detection, sharpening, embossing and beveling.

    Specific Attributes: in, order, kernelMatrix, divisor, bias, targetX,
        targetY, edgeMode, kernelUnitLength, preserveAlpha

    Global Attributes: id, class, height, result, style, tabindex, width, x, y

    Presentation Attributes

-}
convolveMatrix : List (Attribute msg) -> List (Svg msg) -> Svg msg
convolveMatrix =
    node "feConvolveMatrix"


{-| -}
diffuseLighting : List (Attribute msg) -> List (Svg msg) -> Svg msg
diffuseLighting =
    node "feDiffuseLighting"


{-| -}
displacementMap : List (Attribute msg) -> List (Svg msg) -> Svg msg
displacementMap =
    node "feDisplacementMap"


{-| -}
flood : List (Attribute msg) -> List (Svg msg) -> Svg msg
flood =
    node "feFlood"


{-| -}
funcA : List (Attribute msg) -> List (Svg msg) -> Svg msg
funcA =
    node "feFuncA"


{-| -}
funcB : List (Attribute msg) -> List (Svg msg) -> Svg msg
funcB =
    node "feFuncB"


{-| -}
funcG : List (Attribute msg) -> List (Svg msg) -> Svg msg
funcG =
    node "feFuncG"


{-| -}
funcR : List (Attribute msg) -> List (Svg msg) -> Svg msg
funcR =
    node "feFuncR"


{-| -}
gaussianBlur : List (Attribute msg) -> List (Svg msg) -> Svg msg
gaussianBlur =
    node "feGaussianBlur"


{-| -}
image : List (Attribute msg) -> List (Svg msg) -> Svg msg
image =
    node "feImage"


{-| -}
merge : List (Attribute msg) -> List (Svg msg) -> Svg msg
merge =
    node "feMerge"


{-| -}
mergeNode : List (Attribute msg) -> List (Svg msg) -> Svg msg
mergeNode =
    node "feMergeNode"


{-| -}
morphology : List (Attribute msg) -> List (Svg msg) -> Svg msg
morphology =
    node "feMorphology"


{-| -}
offset : List (Attribute msg) -> List (Svg msg) -> Svg msg
offset =
    node "feOffset"


{-| -}
specularLighting : List (Attribute msg) -> List (Svg msg) -> Svg msg
specularLighting =
    node "feSpecularLighting"


{-| -}
tile : List (Attribute msg) -> List (Svg msg) -> Svg msg
tile =
    node "feTile"


{-| -}
turbulence : List (Attribute msg) -> List (Svg msg) -> Svg msg
turbulence =
    node "feTurbulence"



-- Light source elements


{-| -}
distantLight : List (Attribute msg) -> List (Svg msg) -> Svg msg
distantLight =
    node "feDistantLight"


{-| -}
pointLight : List (Attribute msg) -> List (Svg msg) -> Svg msg
pointLight =
    node "fePointLight"


{-| -}
spotLight : List (Attribute msg) -> List (Svg msg) -> Svg msg
spotLight =
    node "feSpotLight"
