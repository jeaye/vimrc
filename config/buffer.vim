" Don't parse modelines
set nomodeline

" Allow opening multiple files at once
com! -complete=file -nargs=* E silent! exec "!vim --servername " . v:servername . " --remote-tab-silent <args>"
