return {
  {
    "sbdchd/neoformat",
    ft = { "c", "cpp" },
    config = function()
      vim.cmd([[
        let g:neoformat_enabled_cpp = ['clangformat']
        let g:neoformat_enabled_c = ['clangformat']
        let g:neoformat_only_msg_on_error = 1

        let g:neoformat_cpp_clangformat = {
            \ 'exe': 'clang-format',
            \ 'args': ['-assume-filename=' . expand('"%"')],
            \ 'stdin': 1,
            \ }

        augroup fmt
          autocmd!
          autocmd BufWritePre * undojoin | Neoformat
        augroup END

        command NeoformatEnable execute 'let g:neoformat_enabled_cpp = ["clangformat"]'
        command NeoformatDisable execute 'let g:neoformat_enabled_cpp = []'
      ]])
    end
  },
}
