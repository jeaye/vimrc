local opt = vim.opt

-- Color conceal characters nicely
opt.conceallevel = 2

-- Improves speed of drawing and smoothness of scrolling
opt.ttyfast = true
-- Noice cannot have this be true
opt.lazyredraw = false

vim.cmd([[
hi Conceal guifg=green ctermfg=green

" Show incomplete commands as I type
set showcmd

" Show command completion with tab
set wildmenu

" GUI tabs
nnoremap <silent> ,t <Esc>:tabnew<CR>
nnoremap <silent> <C-l> :tabn<CR>
nnoremap <silent> <C-h> :tabp<CR>
nnoremap <silent> <C-j> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <C-k> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" Allow a lot of tabs to be opened by -p
set tabpagemax=50

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

" Show line numbers
set number
" Don't show the current mode - it's already displayed by airline
set noshowmode

" UTF8 please
if has('vim_starting')
  set fileencoding=utf-8
  set encoding=utf-8
endif

" Idle time before CursorHold is sent
set updatetime=1000

" 80 column
let &colorcolumn="101,101"
set synmaxcol=128

" Enter in the quickfix window doesn't focus the new buffer.
" This is convenient for quickly looking at code and following the
" quickfix buffer without having to manually switch back.
au BufReadPost quickfix noremap <C-cr> <cr><c-w>p

if has('nvim')
  " Allow escaping terminal mode.
  tnoremap <C-Esc> <C-\><C-n>
  " Make terminal windows as big as possible.
  set scrollback=100000
  au BufWinEnter * if &buftype == 'terminal' | exec "resize " . &lines | endif
endif
]])

-- UFO folding
-- vim.o.foldcolumn = "1" -- '0' is not bad
-- vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
-- vim.o.foldlevelstart = 99
-- vim.o.foldenable = false
-- vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

-- Normal folding
--vim.o.foldcolumn = "0"
--vim.wo.foldmethod = 'expr'
--vim.o.foldlevelstart = 1
--vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
