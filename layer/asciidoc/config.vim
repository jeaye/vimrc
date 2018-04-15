" Source: http://blog.ciplogic.com/index.php/blog/95-vim-asciidoc-or-markdown-source-code-blocks-highlight

function! AsciidocEnableSyntaxRanges()
  if exists('g:loaded_SyntaxRange')
    for lang in ['c', 'cpp', 'java',
               \ 'python', 'javascript',
               \ 'vim', 'sh',
               \ 'json', 'yaml', 'markdown', 'asciidoc',
               \ 'css', 'html']
      call SyntaxRange#Include(
            \  '\c\[source\s*,\s*' . lang . '\s*\]\s*\n[=-]\{4,\}\n'
            \, '\]\@<!\n[=-]\{4,\}\n'
            \, lang, 'NonText')
    endfor
  endif
endfunction

augroup asciidocSyntaxRanges
    autocmd!
    autocmd Filetype asciidoc call AsciidocEnableSyntaxRanges()
augroup END
