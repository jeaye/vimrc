"set verbose=15
set verbosefile=~/vim-verbose

"augroup foo
"  au BufEnter * lua vim.command('echom "BufEnter lua: ' .. vim.buffer().fname ..'"')
"  au VimResized * lua vim.command('echom "VimResized lua: ' .. vim.buffer().fname ..'"')
"  au BufDelete * lua vim.command('echom "BufDelete lua: ' .. vim.buffer().fname ..'"')
"  au TextChanged,TextChangedI * echom "TextChanged"
"augroup END
