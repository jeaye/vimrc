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

augroup custom_todo
  au!
  au Syntax * syn match CustomTodo /\v<(TODO|XXX|TIME):/
        \ containedin=.*Comment
augroup END
hi def link CustomTodo Todo

" Set colorscheme and trigger hook
set background=dark

let g:gruvbox_italic=0
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_contrast_light='hard'
silent! colorscheme gruvbox


lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust", "markdown" },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
