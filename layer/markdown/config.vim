call neobundle#append()
  NeoBundleLazy 'hallison/vim-markdown', {
    \ 'autoload' : { 'filetypes' : ['markdown'] },
  \ }
call neobundle#end()

autocmd FileType markdown set spell

au BufRead,BufNewFile *.md setlocal textwidth=80
