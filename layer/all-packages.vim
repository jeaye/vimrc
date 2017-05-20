if has('nvim')
  if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
  endif
else
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
  endif
endif

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
