function! Init_html()
  let g:html_indent_inctags = "html,body,head,tbody"
endfunction!
call SubscribeInit("html", "Init_html")
