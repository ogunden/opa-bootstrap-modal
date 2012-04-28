##extern-type Dom.private.element

##register show_modal: Dom.private.element -> void
##args(dom)
{
  dom.modal('show');
  return js_void;
}

##register hide_modal: Dom.private.element -> void
##args(dom)
{
  dom.modal('hide');
  return js_void;
}
