function! Init_cxx()
  nmap <silent> <c-z> :FSHere<cr>
  let fsnonewfiles="on"

  " C++11 uniform initialization
  let c_no_curly_error=1

  " Header guards on new .h files
  function! s:insert_gates()
    execute "normal! i#pragma once"
    normal! gg
  endfunction
  autocmd BufNewFile *.{h,hpp} call s:insert_gates()
endfunction!
call SubscribeInit("cpp", "Init_cxx")
