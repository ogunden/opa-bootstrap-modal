/**
 * @externType Dom.private.element
 */

/**
 * @register {Dom.private.element -> void}
 */
function show_modal(dom) {
  dom.modal('show');
  return js_void;
}

/**
 * @register {Dom.private.element -> void}
 */
function hide_modal(dom) {
  dom.modal('hide');
  return js_void;
}
