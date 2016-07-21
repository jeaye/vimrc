let packages = globpath("~/.vim/layer", "**/package.vim")
call plug#begin('~/.vim/plugged')
  for f in split(packages, "\n")
    exe "source" f
  endfor

  let layers = split(globpath("~/.vim/layer", "*/after"), "\n")
  for l in layers
    exe "set rtp+=" . l
  endfor

call plug#end()

" Load each layer's config
let configs = globpath("~/.vim/layer", "**/config.vim")
for f in split(configs, "\n")
  exe "source" f
endfor
