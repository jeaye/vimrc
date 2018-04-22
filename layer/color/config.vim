" Enable global syntax highlighting
"syntax on

" Color conceal characters nicely
hi Conceal guifg=green ctermfg=green
set conceallevel=2

" Rainbow operators
let g:rainbow_active = 1
let g:rainbow_conf =
\ {
\  'guifgs': ['darkorange3', 'seagreen3', 'deepskyblue', 'darkorchid3', 'forestgreen', 'lightblue', 'hotpink', 'mistyrose1'],
\  'ctermfgs': ['darkgreen', 'cyan', 'lightgreen', 'lightred'],
\  'operators': '_[\,\+\*\-\&\^\!\.\<\>\=\|\?]_',
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
\  }
\}

" Add a hook to patch the colorscheme
function! FixColorscheme()
  hi Pmenu guibg=#eee8d5 guifg=#586e75 gui=none
  hi PmenuSel guibg=#859900 guifg=#586e75 gui=none
endfunction

augroup fix_colorscheme
  au!
  au ColorScheme * call FixColorscheme()
augroup END

" Set colorscheme and trigger hook
set background=dark

let g:gruvbox_italic=0
let g:gruvbox_contrast_dark='medium'
colorscheme gruvbox
