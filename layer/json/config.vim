function! FormatJson()
  exec "%!python -m json.tool"
endfunction!
command! FormatJson :call FormatJson()

" Highlight JSONC comments properly.
autocmd FileType json syntax match Comment +\/\/.\+$+
