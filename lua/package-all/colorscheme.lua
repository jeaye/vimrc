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
      --vim.opt.scrolloff = 0
      vim.cmd.colorscheme("gruvbox")
    end
  },
}
