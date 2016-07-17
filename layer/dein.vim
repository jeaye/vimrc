let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    exe '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  exe 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

let configs = globpath("~/.vim/layer", "**/config.vim")
if dein#load_state(s:dein_dir)
  let packages = globpath("~/.vim/layer", "dein.vim,**/package.vim")
  call dein#begin(expand('~/.vim/dein'), split(packages + configs, "\n"))
    call dein#add('Shougo/dein.vim')
    call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

    for f in split(packages, "\n")
      exe "source" f
    endfor

    let layers = split(globpath("~/.vim/layer", "*"), "\n")
    for l in layers
      if !empty(glob(l . "/after"))
        echomsg l
        exe "set rtp^=" . l . "/after"
      endif
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
for f in split(configs, "\n")
  exe "source" f
endfor
