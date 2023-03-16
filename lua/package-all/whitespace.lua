return {
  {
    "ntpeters/vim-better-whitespace",
    config = function()
      --vim.g.better_whitespace_filetypes_blacklist = { "terminal" }
      vim.cmd([[autocmd FileType terminal DisableWhitespace]])
    end
  },
}
