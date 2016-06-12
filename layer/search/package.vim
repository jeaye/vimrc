" File finding
call dein#add('ctrlpvim/ctrlp.vim', {
      \ 'on_map': { 'n': '<C-p>' },
      \ 'hook_source': 'call Init_CtrlP()',
\ })
call dein#add('FelikZ/ctrlp-py-matcher', {
      \ 'on_func': 'pymatcher#PyMatch',
\ })

" Pattern finding
call dein#add('rking/ag.vim')
call dein#add('ggreer/the_silver_searcher', {
      \ 'build': './build.sh',
\ })
