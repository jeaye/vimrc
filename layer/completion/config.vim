" YCM
let g:ycm_confirm_extra_conf = 0
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = ']]'
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_server_log_level = 'critical'
nnoremap ,g :YcmCompleter GoToDeclaration <CR>
nnoremap ,G :YcmCompleter GoToDefinition <CR>

" Automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

" Completion window showing
" menu: show all possible completions
" menuone: show even when there is a single option
" preview: show extra info in the preview window
set completeopt=menuone,menu,preview

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']

"" CoC
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Close preview once completion is finished.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let g:coc_global_extensions = [ 'coc-conjure', 'coc-rls', 'coc-omnisharp' ]

" Rename the current word.
nmap <leader>rn <Plug>(coc-rename)
