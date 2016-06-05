function! Init_markdown()
  set spell
  setlocal textwidth=80
endfunction!
call SubscribeInit("markdown", "Init_markdown")
