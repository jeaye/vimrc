local opt = vim.opt

opt.modeline = false
-- Work nicely with the system clipboard
opt.clipboard = "unnamedplus"

vim.cmd(
[[
command! Diffwin windo diffthis
command! Diffwin windo diffoff
]])
