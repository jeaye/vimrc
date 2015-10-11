call neobundle#append()
  NeoBundle 'indenthtml.vim'
call neobundle#end()

set autoindent smartindent
set backspace=indent,eol,start

" Tab size
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set scrolloff=2

" HTML indentation
let g:html_indent_inctags = "html,body,head,tbody"
