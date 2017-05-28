" Don't parse modelines
set nomodeline

" Work nicely with the system clipboard
set clipboard=unnamedplus

" Allow opening multiple files at once
com! -complete=file -nargs=* E silent! exec "!vim --servername " . v:servername . " --remote-tab-silent <args>"
