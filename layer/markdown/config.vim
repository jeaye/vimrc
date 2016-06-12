function! Init_markdown()
  setlocal spell
  setlocal textwidth=80
  let g:vim_markdown_new_list_item_indent = 2
endfunction!
call SubscribeInit("markdown", "Init_markdown")
