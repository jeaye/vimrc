" File finding
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('FelikZ/ctrlp-py-matcher')

" Pattern finding
call dein#add('rking/ag.vim')
call dein#add('ggreer/the_silver_searcher', {
      \ 'build': './build.sh'
\ })
