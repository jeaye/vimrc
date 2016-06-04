" Enable global syntax highlighting
syntax on

call neobundle#append()
  NeoBundle 'altercation/vim-colors-solarized'
  NeoBundle 'luochen1990/rainbow'
call neobundle#end()

set background=dark
colorscheme solarized

" True color in neovim
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

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
