call neobundle#append()
  NeoBundle 'tpope/vim-fugitive'
  NeoBundle 'rhysd/committia.vim'
  NeoBundle 'chrisbra/vim-diff-enhanced'
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
