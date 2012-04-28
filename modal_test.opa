
@client hide_modal(dom) =
  elt = Dom.of_selection(dom)
  %%modal.hide_modal%%(elt)
@client show_modal(dom) =
  elt = Dom.of_selection(dom)
  %%modal.show_modal%%(elt)

testmodal() =
  rockit() = (
    do #foo <- <>rockit has been called</>
    // but this part doesn't work:
    hide_modal(#mymodal)
  )
  html =
    <>
      <div class="modal hide fade" id=#mymodal>
        <div class="modal-header">
          <!-- this button works -->
          <button class="close" data-dismiss="modal">×</button>
          <h3>Modal header</h3>
        </div>
        <div class="modal-body">
          <p>One fine body…</p>
        </div>
        <div class="modal-footer">
          <!-- this button works: -->
          <a href="#" data-dismiss="modal" class="btn">Cancel using data-dismiss</a>
          <!-- this one does not: -->
          <a href="#" class="btn btn-primary" onclick={_ -> rockit()}>call opa function, should close modal</a>
        </div>
      </div>
      <!-- works: -->
      <a class="btn" data-toggle="modal" href="#mymodal" >show modal using data-toggle</a>
      <!-- does not: -->
      <a class="btn" onclick={_ -> show_modal(#mymodal)}> show modal using opa js call</a>
      <div id=#foo/>
    </>
  headers =
    <>
      <link rel="stylesheet" type="text/css" href="/css/bootstrap.css" />
    </>
  Resource.full_page(
    "foo", html, headers, {success}, []
  )

do Resource.register_external_js("/js/bootstrap-modal.js")
do Resource.register_external_js("/js/bootstrap-transition.js")

server =
  css_dir = Server.resource_map(@static_resource_directory("css"))
  js_dir = Server.resource_map(@static_resource_directory("js"))
  Server.make(parser
    | result={js_dir}       -> _hr -> result
    | result={css_dir}      -> _hr -> result
    | .*                    -> _hr -> testmodal()
  )
