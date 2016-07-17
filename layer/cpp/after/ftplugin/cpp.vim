nmap <silent> <c-z> :FSHere<cr>
let fsnonewfiles="on"

" C++11 uniform initialization
let c_no_curly_error=1

" Disable color_coded in diff mode
if &diff
  let g:color_coded_enabled = 0
endif

" Header guards on new .h files
function! s:insert_gates()
  execute "normal! i#pragma once"
  normal! gg
endfunction
autocmd BufNewFile *.{h,hpp} call s:insert_gates()
