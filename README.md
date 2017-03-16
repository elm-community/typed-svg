# TypedSvg

TypedSvg is an Elm package that makes it more pleasant to work with SVG (Scalable Vector Graphics) in Elm. It is based on [nphollon's](https://github.com/nphollon/typed-svg) original work.

## Usage

```
import TypedSvg.InPx exposing (circle)
import TypedSvg.Attributes.InPx exposing (cx, cy, r, fill, strokeWidth, stroke)

view : Model -> Html msg
view model =
    svg
        [ viewBox 0 0 800 600
        ]
        [ circle
              [ cx 150
              , cy 150
              , r 30
              , fill Color.black
              , strokeWidth 2
              , stroke Color.rgba(90, 60, 60, 0.5)
              ]
              []
        ]
```


```
rect
  [ x (x_ - bgWidth / 2)
  , y (y_ + labelShift - bgHeight / 2 - 4.5)
  , width bgWidth
  , height bgHeight
  , fill Colors.translucentWhite
  , rx 10
  , ry 10
  ]
  []
```

```
text_
  [ x x_
  , y (y_ + labelShift)
  , textAnchor AnchorMiddle
  , fontFamily [ "Avenir Next", "Helvetica Neue", "Verdana" ]
  , fontSize 14
  ]
  [ text svc.label ]
```
