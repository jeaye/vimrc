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
set wildignore+=_site,vendor,node_modules
set wildignore+=*.o,*.d,*.a,*.c3b,*.ccz,Resource,*.jar,*.strings,*.plist,*.filters
set wildignore+=*.xcscheme,*.xcworkspacedata,*.xcscmblueprint,*.properties,*.keystore
set wildignore+=boost_*,googletest,*.proto,protobuf,*.txt,Frameworks,*.framework
set wildignore+=*.vcxitems,*.xib,*.nib,*.pbxproj,*.xcuserstate,*.props
set wildignore+=*.apk,*.iml
set wildignore+=*.ogg,*.wav,*.mp3,*.mid,*.png,*.jpg,*.jpeg

""" CtrlP
" Don't change cwd while I move around
let g:ctrlp_working_path_mode = 'rw'

" Don't limit results as much
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:20'
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 100

" Allow easy opening of multiple files in tabs
let g:ctrlp_open_multiple_files = 't'

" Follow symlinks, but don't loop
let g:ctrlp_follow_symlinks = 1

" Only update after typing has stopped for some ms
let g:ctrlp_lazy_update = 250

" Use a faster matcher for CtrlP
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s; git ls-files . -co --exclude-standard; for submodule in $(git submodule status | sed "s/[ +]\S\+ \(\S\+\).*/\1/"); do cd "$submodule"; git ls-files . -co --exclude-standard | sed "s#^#$submodule/#"; cd "$OLDPWD"; done', 'find %s -type f']

" Keep file cache between sessions
let g:ctrlp_clear_cache_on_exit = 0

""" Ack/Ag
let g:ackprg = expand('~/.vim/plugged/the_silver_searcher/ag') . ' --smart-case --vimgrep'

" Don't jump to first result
cnoreabbrev Ag Ack!
let g:ackhighlight = 0

" Disable terminal output of ag as it runs
set shellpipe=>

nnoremap <C-f> :Ack! 

" Count word occurrences in a file
map ,* *<C-O>:%s///gn<CR>
