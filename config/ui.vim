" Improves speed of drawing and smoothness of scrolling
set ttyfast

" GUI tabs
nnoremap ,t <Esc>:tabnew<CR>
nnoremap <C-l> :tabn<CR>
nnoremap <C-h> :tabp<CR>
nnoremap <silent> <C-j> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <C-k> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

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
  set guifont=Monospace\ 16
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

" Show line numbers and the current mode
set number
set showmode

" Folding
set foldmethod=syntax
set foldenable
set foldcolumn=0
set foldlevelstart=20

" UTF8 please
set fileencoding=utf-8
set encoding=utf-8

" Idle time before CursorHold is sent
set updatetime=1000
