call neobundle#append()
  NeoBundle 'tpope/vim-fugitive'
  NeoBundle 'rhysd/committia.vim'
  NeoBundle 'chrisbra/vim-diff-enhanced'
  NeoBundle 'mattn/gist-vim', {'depends': 'mattn/webapi-vim'}
call neobundle#end()

let g:committia_min_window_width = 80
let g:committia_hooks = {}
function! g:committia_hooks.edit_open(info)
  setlocal spell

  " Scroll the diff window from insert mode
  " Map <C-n> and <C-p>
  imap <buffer><C-n> <Plug>(committia-scroll-diff-down-half)
  imap <buffer><C-p> <Plug>(committia-scroll-diff-up-half)
endfunction!

let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1

" Copy gist URIs to the system clipboard
let os = substitute(system('uname'), "\n", "", "")
if os != "Darwin"
  let g:gist_clip_command = 'xclip -selection clipboard'
else
  let g:gist_clip_command = 'pbcopy'
endif
