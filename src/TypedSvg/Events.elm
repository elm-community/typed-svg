module TypedSvg.Events exposing
    ( onBegin, onEnd, onRepeat
    , onAbort, onError, onResize, onScroll, onLoad, onUnload, onZoom
    , onActivate, onAuxClick, onClick, onContextMenu, onDblClick, onFocusIn, onFocusOut, onMouseDown, onMouseEnter, onMouseLeave, onMouseMove, onMouseOut, onMouseOver, onMouseUp
    , on
    )

{-|


# Animation event attributes

@docs onBegin, onEnd, onRepeat


# Document event attributes

@docs onAbort, onError, onResize, onScroll, onLoad, onUnload, onZoom


# Graphical event attributes

@docs onActivate, onAuxClick, onClick, onContextMenu, onDblClick, onFocusIn, onFocusOut, onMouseDown, onMouseEnter, onMouseLeave, onMouseMove, onMouseOut, onMouseOver, onMouseUp


# Custom Events

@docs on

-}

import Json.Decode as Json
import TypedSvg.Core exposing (Attribute)
import VirtualDom


{-| Create a custom event listener.
import Json.Decode as Json
onClick : msg -> Attribute msg
onClick msg =
on "click" (Json.succeed msg)

You first specify the name of the event in the same format as with JavaScript’s
`addEventListener`. Next you give a JSON decoder, which lets you pull
information out of the event object. If the decoder succeeds, it will produce
a message and route it to your `update` function.

-}
on : String -> VirtualDom.Handler msg -> VirtualDom.Attribute msg
on =
    VirtualDom.on


simpleOn : String -> msg -> Attribute msg
simpleOn name =
    \msg -> on name (VirtualDom.Normal (Json.succeed msg))



-- ANIMATION


{-| -}
onBegin : msg -> Attribute msg
onBegin =
    simpleOn "begin"


{-| -}
onEnd : msg -> Attribute msg
onEnd =
    simpleOn "end"


{-| -}
onRepeat : msg -> Attribute msg
onRepeat =
    simpleOn "repeat"



-- DOCUMENT


{-| -}
onAbort : msg -> Attribute msg
onAbort =
    simpleOn "abort"


{-| -}
onError : msg -> Attribute msg
onError =
    simpleOn "error"


{-| -}
onResize : msg -> Attribute msg
onResize =
    simpleOn "resize"


{-| -}
onScroll : msg -> Attribute msg
onScroll =
    simpleOn "scroll"


{-| -}
onLoad : msg -> Attribute msg
onLoad =
    simpleOn "load"


{-| -}
onUnload : msg -> Attribute msg
onUnload =
    simpleOn "unload"


{-| -}
onZoom : msg -> Attribute msg
onZoom =
    simpleOn "zoom"



-- GRAPHICAL


{-| -}
onActivate : msg -> Attribute msg
onActivate =
    simpleOn "activate"


{-| -}
onAuxClick : msg -> Attribute msg
onAuxClick =
    simpleOn "auxclick"


{-| -}
onClick : msg -> Attribute msg
onClick =
    simpleOn "click"


{-| -}
onContextMenu : msg -> Attribute msg
onContextMenu =
    simpleOn "contextmenu"


{-| -}
onDblClick : msg -> Attribute msg
onDblClick =
    simpleOn "dblclick"


{-| -}
onFocusIn : msg -> Attribute msg
onFocusIn =
    simpleOn "focusin"


{-| -}
onFocusOut : msg -> Attribute msg
onFocusOut =
    simpleOn "focusout"


{-| -}
onMouseDown : msg -> Attribute msg
onMouseDown =
    simpleOn "mousedown"


{-| -}
onMouseEnter : msg -> Attribute msg
onMouseEnter =
    simpleOn "mouseenter"


{-| -}
onMouseLeave : msg -> Attribute msg
onMouseLeave =
    simpleOn "mouseleave"


{-| -}
onMouseMove : msg -> Attribute msg
onMouseMove =
    simpleOn "mousemove"


{-| -}
onMouseOut : msg -> Attribute msg
onMouseOut =
    simpleOn "mouseout"


{-| -}
onMouseOver : msg -> Attribute msg
onMouseOver =
    simpleOn "mouseover"


{-| -}
onMouseUp : msg -> Attribute msg
onMouseUp =
    simpleOn "mouseup"
