return {
  {
    "sbdchd/neoformat",
    ft = { "c", "cpp" },
    config = function()
      vim.cmd([[
        let g:neoformat_enabled_cpp = ['clangformat']
        let g:neoformat_enabled_c = ['clangformat']

        augroup fmt
          autocmd!
          autocmd BufWritePre * undojoin | Neoformat
        augroup END
      ]])
    end
  },
}
