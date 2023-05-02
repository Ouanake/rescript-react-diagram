module NodeType = {
  let element = 1
  let document = 9
}

type element = Dom.element

type domRect = {width: float, height: float, top: float, left: float, bottom: float, right: float}

module Document = {
  @val @scope("document")
  external getElementById: string => Js.nullable<Dom.element> = "getElementById"
  @val @scope("document")
  external createElementNS: (string, string) => Dom.element = "createElementNS"
  @val @scope("document")
  external createElement: string => Dom.element = "createElement"
  @val @scope("document")
  external createTextNode: string => Dom.element = "createTextNode"
  @val @scope("document")
  external getBody: Js.nullable<Dom.element> = "body"
}

module Window = {
  @val @scope("window") external hasOwnProperty: string => bool = "hasOwnProperty"
}

@send external hasOwnProperty: (Dom.element, string) => bool = "hasOwnProperty"
@send external appendChild: (Dom.element, Dom.element) => unit = "appendChild"
@send external insertBefore: (Dom.element, Dom.element, Dom.element) => unit = "insertBefore"
@send external removeChild: (Dom.element, Dom.element) => unit = "removeChild"
@send external setAttribute: (Dom.element, string, string) => unit = "setAttribute"
@send external removeAttribute: (Dom.element, string) => unit = "removeAttribute"
@send external addEventListener: (Dom.element, string, 'a) => unit = "addEventListener"
@send
external addEventListenerWithOptions: (Dom.element, string, 'a, 'b) => unit = "addEventListener"
@send external removeEventListener: (Dom.element, string, 'a) => unit = "removeEventListener"
@send external getBoundingClientRect: Dom.element => domRect = "getBoundingClientRect"
@send external closest: (Dom.element, string) => Js.nullable<Dom.element> = "closest"
@send external querySelectorAll: (Dom.element, string) => array<Dom.element> = "querySelectorAll"
@send external setPointerCapture: (Dom.element, string) => unit = "setPointerCapture"
@send external releasePointerCapture: (Dom.element, string) => unit = "releasePointerCapture"

@get external id: Dom.element => string = "id"
@get external nodeType: Dom.element => int = "nodeType"
@get external parentNode: Dom.element => Js.nullable<Dom.element> = "parentNode"
@get external previousSibling: Dom.element => Js.nullable<Dom.element> = "previousSibling"
@get external nextSibling: Dom.element => Js.nullable<Dom.element> = "nextSibling"
@get external children: Dom.element => array<Dom.element> = "children"
@get external firstChild: Dom.element => Js.nullable<Dom.element> = "firstChild"
@get external lastChild: Dom.element => Js.nullable<Dom.element> = "lastChild"
@get external style: Dom.element => Js.Dict.t<'a> = "style"
@get external offsetLeft: Dom.element => float = "offsetLeft"
@get external offsetTop: Dom.element => float = "offsetTop"
@get external dataset: Dom.element => Js.Dict.t<'a> = "dataset"

let forFirstChild = (node, fn) => node->firstChild->Js.toOption->Belt.Option.forEach(fn)

@set external setId: (Dom.element, string) => unit = "id"
@set external setNodeValue: (Dom.element, string) => unit = "nodeValue"
@set external setTextContent: (Dom.element, string) => unit = "textContent"
@set external setDocument: (Dom.element, Dom.element) => unit = "document"

@get @scope("style") external getStyleWidth: Dom.element => string = "width"
@get @scope("style") external getStyleHeight: Dom.element => string = "height"
@set @scope("style") external setStyleDisplay: (Dom.element, string) => unit = "display"
@set @scope("style") external setStyleWidth: (Dom.element, string) => unit = "width"
@set @scope("style") external setStyleHeight: (Dom.element, string) => unit = "height"
@set @scope("style") external setStyleTransform: (Dom.element, string) => unit = "transform"

let setTranslate3d = (node, x, y) =>
  node->setStyleTransform(
    "translate3d(" ++ Js.Float.toString(x) ++ "px," ++ Js.Float.toString(y) ++ "px,0px)",
  )
let setTransform = (node, x, y, scale) =>
  node->setStyleTransform(
    "translate3d(" ++
    Js.Float.toString(x) ++
    "px," ++
    Js.Float.toString(y) ++
    "px,0px) scale3d(" ++
    Js.Float.toString(scale) ++
    "," ++
    Js.Float.toString(scale) ++ ",1)",
  )

@send external stopPropagation: (ReactEvent.Mouse.t, unit) => unit = "stopPropagation"
@send external preventDefault: (ReactEvent.Mouse.t, unit) => unit = "preventDefault"
@get external mouseEventTarget: ReactEvent.Mouse.t => Dom.element = "target"
@get external mouseEventButton: ReactEvent.Mouse.t => int = "button"
@get external mousePointerId: ReactEvent.Mouse.t => string = "pointerId"
@get external clientX: ReactEvent.Mouse.t => float = "clientX"
@get external clientY: ReactEvent.Mouse.t => float = "clientY"
@get external movementX: ReactEvent.Mouse.t => float = "movementX"
@get external movementY: ReactEvent.Mouse.t => float = "movementY"
external asMouseEvent: ReactEvent.Wheel.t => ReactEvent.Mouse.t = "%identity"
