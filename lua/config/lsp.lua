vim.cmd([[
  " Automatically open and close the popup menu / preview window
  au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

  " Completion window showing
  " menu: show all possible completions
  " menuone: show even when there is a single option
  " preview: show extra info in the preview window
  set completeopt=menuone,menu,preview

  " Syntastic
  "set statusline+=%#warningmsg#
  "set statusline+=%{SyntasticStatuslineFlag()}
  "set statusline+=%*

  " Close preview once completion is finished.
  autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

  " Only run linters named in ale_linters settings.
  let g:ale_linters_explicit = 1
  " A markdown linter I sometimes use: 'vale'
  let g:ale_linters = { 'javascript': ['vim-lsp', 'eslint'], 'sh': ['vim-lsp', 'shellcheck'], 'markdown': [] }
  let g:ale_c_build_dir_names = ["build"]
  let g:ale_sh_shellcheck_options = '-o all'
]])
