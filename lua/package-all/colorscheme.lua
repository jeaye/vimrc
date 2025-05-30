return {
  { "vim-scripts/ebnf.vim" },
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      --vim.cmd([[
      --  let g:gruvbox_contrast_light = 'hard'
      --  autocmd ColorScheme * highlight Normal guibg=#FFFFFF
      --  set background=light
      --  set nocursorline
      --]])
      vim.opt.scrolloff = 0
      vim.cmd.colorscheme("gruvbox")
    end
  },
  --{
  --  "catppuccin/nvim",
  --  name = "catppuccin",
  --  priority = 1000,
  --  config = function()
  --    vim.cmd([[
  --      "autocmd ColorScheme * highlight Normal guibg=#FFFFFF
  --      set background=light
  --      set nocursorline
  --    ]])
  --    --vim.cmd.colorscheme("catppuccin")
  --  end
  --}
}
