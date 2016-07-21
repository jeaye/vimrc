let layers = split(globpath("~/.vim/layer", "*"), "\n")
call plug#begin('~/.vim/plugged')
  for l in layers
    let s:after = l . '/after'
    if !empty(glob(s:after))
      exe "set rtp+=" . s:after
    endif

    let s:package = l . '/package.vim'
    if filereadable(s:package)
      exe "source" s:package
    endif
  endfor
call plug#end()

" Load each layer's config
for l in layers
  let s:config = l . '/config.vim'
  if filereadable(s:config)
    exe "source" s:config
  endif
endfor
