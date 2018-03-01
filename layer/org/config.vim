function! MakeDiaryLink()
  return "~/vimwiki/diary/" . strftime('%Y-%m-%d') . ".md"
endfunction

nmap <Leader>ww :e ~/vimwiki/index.md<CR>
nmap <Leader>wi :e ~/vimwiki/diary/diary.md<CR>
nmap <Leader>w<Leader>w :exec "e " . MakeDiaryLink()<CR>
