function! FormatJson()
  exec "%!python -m json.tool"
endfunction!
command! FormatJson :call FormatJson()
