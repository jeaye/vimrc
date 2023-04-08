vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = {"json"},
  command = "set formatprg=jq",
})
