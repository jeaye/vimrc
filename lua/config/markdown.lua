vim.cmd([[
  let g:vim_markdown_frontmatter = 1
  let g:vim_markdown_strikethrough = 1
  let g:vim_markdown_new_list_item_indent = 2
  let g:vim_markdown_no_extensions_in_markdown = 1
  let g:vim_markdown_folding_disabled = 1

  function! s:enable_markdown_folding()
    setlocal foldlevelstart=1
    setlocal foldenable
    ownsyntax off
  endfunction
  autocmd! FileType markdown call s:enable_markdown_folding()
]])
