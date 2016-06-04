" Enable global syntax highlighting
syntax on

call neobundle#append()
  if has('nvim')
    NeoBundle 'frankier/neovim-colors-solarized-truecolor-only'
  else
    NeoBundle 'altercation/vim-colors-solarized'
  endif
  NeoBundle 'luochen1990/rainbow'
call neobundle#end()

" True color in neovim
if has('nvim')
  set termguicolors
endif

set background=dark
colorscheme solarized

" Color conceal characters nicely
hi Conceal guifg=green ctermfg=green

" Rainbow operators
let g:rainbow_active = 1
let g:rainbow_conf =
\ {
\  'guifgs': ['darkorange3', 'seagreen3', 'deepskyblue', 'darkorchid3', 'forestgreen', 'lightblue', 'hotpink', 'mistyrose1'],
\  'ctermfgs': ['darkgreen', 'cyan', 'lightgreen', 'lightred'],
\  'operators': '_[\,\+\*\-\&\^\!\.\:\<\>\;\=\|\?]_',
\  'parentheses':
\  [
\    'start=/(/ end=/)/ fold',
\    'start=/\[/ end=/\]/ fold',
\    'start=/{/ end=/}/ fold'
\  ],
\  'separately':
\  {
\    'jank':
\    {
\      'parentheses':
\      [
\        'start=/(\ze[^;]/ end=/)/ fold',
\        'start=/\[/ end=/\]/ fold',
\        'start=/{/ end=/}/ fold'
\      ],
\    },
\    'clojure': 0,
\  }
\}
