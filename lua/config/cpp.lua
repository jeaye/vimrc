vim.cmd([[
  " Header guards on new .h files
  function! s:insert_gates()
    execute "normal! i#pragma once"
    normal! gg
  endfunction
  autocmd! BufNewFile *.{h,hpp} call s:insert_gates()
]])
