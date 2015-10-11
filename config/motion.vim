call neobundle#append()
  NeoBundle 'easymotion/vim-easymotion'
  NeoBundle 'camelcasemotion'
  NeoBundle 'tpope/vim-unimpaired'
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'triglav/vim-visual-increment'
call neobundle#end()

" Number formats, for incrementing
set nrformats=octal,hex

" Go to file in a new tab
nnoremap gF <C-W>gF

" Merging upward
nnoremap K kJ

" EasyMotion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_upper = 1
nnoremap <leader><leader>. <Plug>(easymotion-repeat)

" hjkl motions
map <leader><leader>l <Plug>(easymotion-lineforward)
map <leader><leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0

" Delete lines without adding them to the yank stack
nnoremap ,d "_d
vnoremap ,d "_d

nnoremap Y y$
