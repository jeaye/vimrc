function! SubscribeInit(filetype, func)
  exe "augroup subscribeInit" . a:filetype
  exe "autocmd!"
  exe "autocmd FileType " . a:filetype
        \ . " call GuardedInit('" . a:filetype . "', '" . a:func . "')"
  exe "augroup END"
endfunction!

function! GuardedInit(filetype, func)
  if exists("g:subscribed_init_" . a:filetype)
    echom "Already initialized filetype " . a:filetype
    return 0
  endif
  exe "call " . a:func . "()"
  exe "let g:subscribed_init_" . a:filetype . " = 1"
endfunction!
