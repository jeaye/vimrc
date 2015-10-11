" Enable global syntax highlighting
syntax on

call neobundle#append()
  NeoBundle 'altercation/vim-colors-solarized'
  NeoBundle 'jeaye/color_coded', {
      \ 'build': {
      \   'unix': 'cmake . && make && make install',
      \ },
      \ 'autoload' : { 'filetypes' : ['c', 'cpp', 'objc', 'objcpp'] },
      \ 'build_commands' : ['cmake', 'make']
  \}
call neobundle#end()

set background=dark
colorscheme solarized

" Color conceal characters nicely
hi Conceal guifg=green ctermfg=green

" Disable color_coded in diff mode
if &diff
  let g:color_coded_enabled = 0
endif
