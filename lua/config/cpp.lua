vim.cmd([[
  " Header guards on new .h files
  function! s:insert_gates()
    execute "normal! i#pragma once"
    normal! gg
  endfunction
  autocmd! BufNewFile *.{h,hpp} call s:insert_gates()

  let g:cpp_class_scope_highlight = 1
  let g:cpp_member_variable_highlight = 1
  let g:cpp_class_decl_highlight = 1
  let g:cpp_posix_standard = 1
  let g:cpp_experimental_template_highlight = 1
  let g:cpp_concepts_highlight = 1
]])
