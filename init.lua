local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

for _, v in pairs(vim.api.nvim_get_runtime_file("lua/config/*", true)) do
  local module = v:gsub(".*lua/config/", "config/")
  module = module:gsub("%.lua$", "")
  module = module:gsub("/", ".")
  --print("Loading module", module)
  require(module)
end

require("lazy").setup("package")
--require("lazy").setup("no-packages")
