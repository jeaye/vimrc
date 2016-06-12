" No highlights after searches
set nohls
" Search while typing
set incsearch

" Ignore case (but be smart)
set ignorecase
set smartcase

" Ignore certain patterns while searching
set wildignore+=target,out,build_debug,build_release,build
set wildignore+=Library,*.csproject,*.meta
set wildignore+=_site,vendor
set wildignore+=*.o,*.d,*.a,*.c3b,*.ccz,Resource,*.jar,*.strings,*.plist,*.xml,*.filters
set wildignore+=*.xcscheme,*.xcworkspacedata,*.xcscmblueprint,*.properties,*.keystore
set wildignore+=boost_*,googletest,*.proto,protobuf,*.txt,Frameworks,*.framework
set wildignore+=*.vcxitems,*.xib,*.pbxproj,*.xcuserstate,*.props

function! InitCtrlP()
  " Don't change cwd while I move around
  let g:ctrlp_working_path_mode = 'rw'

  " Use a faster matcher for CtrlP
  let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endfunction!

""" Ag
let g:ag_working_path_mode = "r"
let g:ag_prg = expand('~/.vim/dein/repos/github.com/ggreer/the_silver_searcher/ag') . ' --vimgrep'
let g:ag_mapping_message = 0

" Disable terminal output of ag as it runs
set shellpipe=>

nnoremap <C-f> :Ag 
