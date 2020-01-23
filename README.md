  # TypedSvg

TypedSvg is an Elm package that makes it more pleasant to work with SVG (Scalable Vector Graphics). It is based on [nphollon's](https://github.com/nphollon/typed-svg) original work.

## Status

TypedSvg is a work-in-progress. It intends to replace `elm-lang/svg` with a fully typed and documented equivalent. However, as it stands now, there is still work to be done in covering documentation for the entire (very large) SVG spec, as well as potential re-organization work in how the public modules are presented as an API.

TL;DR this package will change

## Modules

- `TypedSvg` contains SVG elements like `circle` and `rect`.
- `TypedSvg.Core` contains basic building blocks like `node` and `attribute`, as well as the `Svg` and `Attribute` types.
- `TypedSvg.Types` contains all of the types, as well as some length type helpers like `px` and `em`.
- `TypedSvg.Attributes` contains typed attributes like `fill`, `strokeWidth` and `svgBox`
- `TypedSvg.Filters` contains filter elements.
- `TypedSvg.Filters.Attributes` contains filter element attributes.
- `TypedSvg.Events` contains SVG event attributes like `onLoad`, `onClick` and `onMouseOver`.

## Usage

```elm
import Color
import Html exposing (Html)
import TypedSvg exposing (circle, svg)
import TypedSvg.Attributes exposing (cx, cy, fill, r, stroke, strokeWidth, viewBox)
import TypedSvg.Types exposing (Paint(..), px)
import TypedSvg.Core exposing (Svg)


myCircle : Svg msg
myCircle =
    circle
        [ cx (px 100)
        , cy (px 100)
        , r (px 30)
        , fill <| Paint Color.blue
        , strokeWidth (px 2)
        , stroke <| Paint <| Color.rgba 0.8 0 0 0.5
        ]
        []

main : Html msg
main =
    svg [ viewBox 0 0 800 600 ] [ myCircle ]
```

## Sister Packages

TypedSvg works well in conjunction with `folkertdev/svg-path-dsl` if you need a typed path domain-specific language.

## License

Apache 2.0
