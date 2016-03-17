call neobundle#append()
  NeoBundle 'ctrlpvim/ctrlp.vim'
call neobundle#end()

" No highlights after searches
set nohls
" Search while typing
set incsearch

" Ignore case (but be smart)
set ignorecase
set smartcase

" Don't change cwd while I move around
let g:ctrlp_working_path_mode = 'rw'

" Ignore certain patterns while searching
set wildignore+=target,out,build_debug,build_release,build
set wildignore+=Library,*.csproject,*.meta
set wildignore+=_site,vendor
set wildignore+=*.o,*.d,*.c3b,*.ccz,Resource,*.jar,*.strings,*.plist,*.xcscheme,*.xcworkspacedata,*.xcscmblueprint,*.properties,*.keystore
