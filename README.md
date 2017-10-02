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
import Html exposing (Html)
import Color
import TypedSvg exposing (svg, circle)
import TypedSvg.Attributes exposing (viewBox, cx, cy, r, fill, strokeWidth, stroke)
import TypedSvg.Types exposing (Fill(..), px)


type Msg
    = NoOp


type alias Model =
    Int


view : Model -> Html Msg
view model =
    svg
        [ viewBox 0 0 800 600
        ]
        [ circle
            [ cx (px 150)
            , cy (px 150)
            , r (px 30)
            , fill <| Fill Color.black
            , strokeWidth (px 2)
            , stroke <| Color.rgba 90 60 60 0.5
            ]
            []
        ]
```

## Sister Packages

TypedSvg works well in conjunction with `folkertdev/svg-path-dsl` if you need a typed path domain-specific language.

## License

Apache 2.0
