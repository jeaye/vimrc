let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    exe '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  exe 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" Register all packages across layers
let packages = split(globpath($HOME . "/.vim/layer", "**/package.vim"), "\n")
if dein#load_state(s:dein_dir)
  call dein#begin(expand('~/.vim/dein'), packages)
    call dein#add('Shougo/dein.vim')
    call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

    for f in packages
      exe "source" f
    endfor
  call dein#end()
  call dein#save_state()
endif

" Install missing packages
if has('vim_starting') && dein#check_install()
  let g:dein#install_process_timeout = 60 * 10
  call dein#install()
endif

" Load each layer's config
let files = globpath($HOME . "/.vim/layer", "**/config.vim")
for f in split(files, "\n")
  exe "source" f
endfor
