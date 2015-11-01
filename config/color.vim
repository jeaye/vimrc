" Enable global syntax highlighting
syntax on

call neobundle#append()
  NeoBundle 'altercation/vim-colors-solarized'
  NeoBundleLazy 'jeaye/color_coded', {
    \ 'build': {
    \   'unix': 'cmake . && make && make install',
    \ },
    \ 'autoload': { 'filetypes' : ['c', 'cpp', 'objc', 'objcpp'] },
    \ 'build_commands': ['cmake', 'make'],
    \ 'disabled': has('nvim'),
  \ }
  NeoBundle 'luochen1990/rainbow'
call neobundle#end()

set background=dark
colorscheme solarized

" Color conceal characters nicely
hi Conceal guifg=green ctermfg=green

" Disable color_coded in diff mode
if &diff
  let g:color_coded_enabled = 0
endif

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
\    }
\  }
\}

