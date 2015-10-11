call neobundle#append()
  NeoBundle 'camelcasemotion'
  NeoBundle 'tpope/vim-unimpaired'
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'triglav/vim-visual-increment'
  NeoBundle 'matchit.zip'
  NeoBundle 'repeat.vim'
call neobundle#end()

" Number formats, for incrementing
set nrformats=octal,hex

" Go to file in a new tab
nnoremap gF <C-W>gF

" Merging upward
nnoremap K kJ

" Delete lines without adding them to the yank stack
nnoremap ,d "_d
vnoremap ,d "_d

nnoremap Y y$
