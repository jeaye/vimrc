function! Init_mail()
  set tw=0 " Unlimited text width
  set spell " Spell check
endfunction!
call SubscribeInit("mail", "Init_mail")
