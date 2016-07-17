function! Init_mail()
  setlocal spell
  setlocal wrap
  setlocal linebreak
  setlocal textwidth=0
  setlocal wrapmargin=0
endfunction!
call SubscribeInit("mail", "Init_mail")
