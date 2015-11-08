" Improves speed of drawing and smoothness of scrolling
set ttyfast

" GUI tabs
nnoremap ,t <Esc>:tabnew<CR>
nnoremap <C-l> :tabn<CR>
nnoremap <C-h> :tabp<CR>
nnoremap <silent> <C-j> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <C-k> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" Allow tab duplication
function! s:copy_tab()
  tabnew %:p
endfunction!
nnoremap ,T <Esc>:call <SID>copy_tab()<CR>

" No visual bell
set noerrorbells
set visualbell t_vb=
au GuiEnter * set visualbell t_vb=

" Enable mouse
set mouse=a
set mousemodel=popup_setpos

" Unixy pasting
noremap! <s-insert> <middlemouse>

" Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Font
let os = substitute(system('uname'), "\n", "", "")
if os != "Darwin"
  set guifont=Monospace\ 17
else
  set guifont=Menlo\ Regular:h20
endif

" GUI menus
set guioptions-=m " Menu
set guioptions-=T " Toolbar
set guioptions-=r " Right scroll
set guioptions-=R " Right scroll
set guioptions-=l " Left scroll
set guioptions-=L " Left scroll
set guioptions+=c " Use console to prompt questions

" Show line numbers
set number
" Don't show the current mode - it's already displayed by airline
set noshowmode

" Folding
set foldmethod=syntax
set foldenable
set foldcolumn=0
set foldlevelstart=20

" UTF8 please
if has('vim_starting')
  set fileencoding=utf-8
  set encoding=utf-8
endif

" Idle time before CursorHold is sent
set updatetime=1000

" 80 column
let &colorcolumn="81,81"

" Enter in the quickfix window doesn't focus the new buffer.
" This is convenient for quickly looking at code and following the
" quickfix buffer without having to manually switch back.
au BufReadPost quickfix noremap <C-cr> <cr><c-w>p

if has('nvim')
  " Allow escaping terminal mode with ESC
  :tnoremap <Esc> <C-\><C-n>
endif
