" Automatically reload files from disk
set autoread
if has('nvim')
  " NeoVim doesn't check for changed files automatically. For now, hack it in.
  " This only works with a GUI though.
  " https://github.com/neovim/neovim/issues/1936
  au FocusGained * :checktime
endif

set noswapfile
set nobackup
set nowritebackup
set directory=/tmp

" Persist undo history.
if !isdirectory($HOME . "/.vim-undo")
  call mkdir($HOME . "/.vim-undo", "", 0700)
endif
set undodir=~/.vim-undo
set undofile

" Don't unload abandoned buffers
set hidden

set history=1000

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
if has('nvim')
  set viminfo='10,<100,:20,%,n~/.nviminfo
else
  set viminfo='10,\"100,:20,%,n~/.viminfo
endif

function! ResCur()
  if line("'\"") <= line("$") && !&diff
    normal! g`"
    return 1
  endif
endfunction
augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" Allow saving as root
command! Wsudo w !sudo tee % > /dev/null

" Common typos
command! W w
command! Wa wa
command! Wq wq
command! Wqa wqa

" Make the proper directories when writing a file
function! s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction
augroup BWCCreateDir
  autocmd!
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
